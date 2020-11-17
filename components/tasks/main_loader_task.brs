sub init()
    m.top.functionName = "GetContent"
end sub

function GetContent()
    'request conent feed from API
    http = createObject("roUrlTransfer")
    port = createObject("roMessagePort")
    http.setPort(port)
    http.SetUrl("http://192.168.1.126:5500/roku_lessons/comedy.json")
    'parse the feed and buld a tree of content nodes to populate the grid view
    content_arr = []
    if (http.AsyncGetToString())
        while (true)
            response = wait(10000, port)
            if (type(response) = "roUrlEvent")
                code = response.GetResponseCode()
                if (code = 200)
                    contentNode = CreateObject("roSGNode", "ContentNode")
                    content_response = parseJSON(response.getstring())
                    for each item in content_response.items ' parse items and push them to row
                        content_arr.Push(item)
                    end for
                    contentNode.Update({
                        content: content_arr
                    }, true)
                    m.top.content = contentNode
                else
                    m.top.error = "HTTP Failed"
                end if
            end if
        end while
    end if
    return invalid
end function


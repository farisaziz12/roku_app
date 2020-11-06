sub init()
    m.top.functionname = "loginRequest"
end sub

function loginRequest()
    http = createObject("roUrlTransfer")
    port = createObject("roMessagePort")
    http.setPort(port)
    http.SetUrl("http://192.168.1.126:5500/login.json")
    if (http.AsyncGetToString())
        while (true)
            msg = wait(10000, port)
            if (type(msg) = "roUrlEvent")
                code = msg.GetResponseCode()
                if (code = 200)
                    m.top.response = msg.getstring()
                else
                    m.top.error = "Login Failed"
                end if
            end if
        end while
    end if
    return invalid
end function
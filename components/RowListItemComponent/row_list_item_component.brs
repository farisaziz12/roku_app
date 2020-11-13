sub init()
end sub


sub OnContentSet() 'invoked when metadata retrieved
    content = m.top.item_content
    'set poster uri if content is valid
    if content <> invalid
        m.top.findNode("poster").uri = content.hsPosterUrl
    end if
end sub
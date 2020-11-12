sub init()
    m.row_list = m.top.findNode("row_list")
    m.row_list.setFocus(true)
    m.description_label = m.top.findNode("description_label")
    m.title_label = m.top.findNode("titleLabel")
    m.row_list.observeField("rowItemFocused", "OnItemFocused")
end sub

sub OnItemFocused()
    focusedIndex = m.row_list.rowItemFocused ' get position of focused item
    row = m.row_list.content.getChild(focusedIndex[0]) ' get all items of row
    item = row.getChild(focusedIndex[1]) ' get focused item
    'update description label with description of focused item
    m.description_label.test = item.description
    ' update title label with title of focused item
    m.title_label.text = item.title
    'adding length of playback to the title if item length field was populated
    if item.length <> invalid
        '@TODO get time with getTime method
    end if
end sub
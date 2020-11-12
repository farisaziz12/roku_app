function init()
    ? "homepage init"
    m.top.observeField("visible", "onVisibleChange")
    m.category_list = m.top.findNode("category_list")
end function

sub onVisibleChange()
    if m.top.visible = true then
        setCategoryListFocus()
        showGridScreen()
        runContentTask() ' Retrieves content to display
    end if
end sub

sub setCategoryListFocus()
    m.category_list.setFocus(true)
end sub

sub showGridScreen()
    m.grid_screen = CreateObject("roSGNode", "GridScreen")
end sub

sub runContentTask()
    m.content_task = CreateObject("roSGNode", "MainLoaderTask") ' create task for feed retrieving content
    ' observer created to know when content feed will be parsed
    m.content_task.ObserveField("content", "onMainContentLoaded")
    m.content_task.control = "run" 'executing getContent method
    ' @TODO: Create loading indicator and set visible to true
end sub

sub onMainContentLoaded() 'invoked when conent is ready to be used
    m.grid_screen.setFocus(true) 'set focus to grid screen
    ' @TODO: set loading indicator to false here
    m.grid_screen.content = m.content_task.content 'populating grid screen with the retrieved content
end sub
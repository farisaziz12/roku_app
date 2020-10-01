
function init()
    m.top.observeField("visible", "onVisibleChange")
    m.login_keyboard = m.top.findNode("login_keyboard")
    m.submit_button = m.top.findNode("submit_button")
    ? m.login_keyboard
end function


sub onVisibleChange()
    if m.top.visible = true then
        m.login_keyboard.setFocus(true)
    end if
end sub



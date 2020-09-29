
function init()
    m.top.observeField("visible", "onVisibleChange")
    m.login_keyboard = m.top.findNode("login_keyboard")
    ' keyboardrect = m.login_keyboard.boundingRect()
    ' centerx = (1280 - keyboardrect.width) / 2
    ' centery = (720 - keyboardrect.height) / 2
    ' m.login_keyboard.translation = [centerx, centery]
end function


sub onVisibleChange()
    if m.top.visible = true then
        m.login_keyboard.setFocus(true)
    end if
end sub

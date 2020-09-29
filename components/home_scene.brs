function init()
    ? "[home_scene] init"
    m.login_screen = m.top.findNode("login_screen")
    m.login_button = m.top.findNode("login_button")
    m.login_button.setFocus(true)
end function


sub onLoginButtonPressed()
    ? "button pressed"
    m.login_button.visible = false
    m.login_screen.visible = true
end sub

function onKeyEvent(key, press) as boolean
    ? "[home_scene] onKeyEvent", key, press
    handled = false
    ' if press then
    if key = "OK" then
        handled = true
        onLoginButtonPressed()
    end if
    ' end if

    return handled
end function
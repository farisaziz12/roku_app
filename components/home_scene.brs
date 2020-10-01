function init()
    ? "[home_scene] init"
    m.login_screen = m.top.findNode("login_screen")
    m.login_button = m.top.findNode("login_button")
    m.submit_button = m.top.findNode("submit_button")
    m.login_keyboard = m.top.findNode("login_keyboard")
    m.login_label = m.top.findNode("login_label")
    m.login_screen.observeField("submit_button_pressed", "onUsernameSubmit")
    m.login_button.setFocus(true)
end function


sub onLoginButtonPressed()
    ? "button pressed"
    m.login_button.visible = false
    m.login_screen.visible = true
end sub

sub onUsernameSubmit()
    m.login_label.text = "Enter Password"
    username = m.login_keyboard.text
    m.login_keyboard.text = ""
end sub

function onKeyEvent(key, press) as boolean
    ? "[home_scene] onKeyEvent", key, press
    handled = false
    ' if press then
    if key = "OK" and m.login_button.visible then
        handled = true
        onLoginButtonPressed()
    else if key = "down" and m.login_screen.visible then
        m.submit_button.setFocus(true)
    else if key = "up" and m.login_screen.visible then
        m.login_keyboard.setFocus(true)
    end if
    ' end if

    return handled
end function
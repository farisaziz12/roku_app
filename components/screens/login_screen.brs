
function init()
    m.login_button = m.top.findNode("login_button")
    m.login_button.setFocus(true)
end function

sub onLoginButtonPressed()
    ? "button pressed"
    m.login_screen = m.top.findNode("login_screen")
    m.login_screen.visible = false
end sub
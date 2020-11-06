function init()
    ? "[home_scene] init"
    ' screens
    m.login_screen = m.top.findNode("login_screen")
    m.homepage_screen = m.top.findNode("homepage_screen")

    ' buttons
    m.submit_username_button = m.top.findNode("submit_username_button")
    m.login_button = m.top.findNode("login_button")
    m.submit_button = m.top.findNode("submit_button")

    ' keyboard
    m.login_keyboard = m.top.findNode("login_keyboard")

    ' labels
    m.login_label = m.top.findNode("login_label")
    m.login_error = m.top.findNode("login_error")

    ' observers
    m.login_screen.observeField("submit_username_button_pressed", "onUsernameSubmit")
    m.login_screen.observeField("submit_button_pressed", "onPasswordSubmit")

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
    m.submit_username_button.visible = false
    m.submit_button.visible = true
    m.login_keyboard.setFocus(true)
end sub

sub onPasswordSubmit()
    checkLogin()
end sub


sub checkLogin()
    m.check_login = createObject("roSGNode", "check_login_task")
    m.check_login.observeField("response", "onLoginResponse")
    m.check_login.observeField("error", "onLoginError")
    m.check_login.control = "RUN"
end sub

sub onLoginResponse(obj)
    response = obj.getData()
    msg = parseJSON(response)
    if msg <> invalid
        if msg.status = "verified"
            handleLoginSuccess()
            if m.login_error.visible
                m.login_error.visible = false
            end if
        end if
    end if
end sub

sub onLoginError(obj)
    if m.login_error.visible = false then
        m.login_error.text = obj.getData()
        m.login_error.visible = true
    end if
end sub

sub handleLoginSuccess()
    m.login_screen.visible = false
    m.homepage_screen.visible = true
end sub


function onKeyEvent(key, press) as boolean
    ? "[home_scene] onKeyEvent", key, press
    handled = false

    if key = "OK" and m.login_button.visible then
        handled = true
        onLoginButtonPressed()

    else if key = "down" and m.login_screen.visible then
        if m.submit_username_button.visible then
            m.submit_username_button.setFocus(true)
        else if m.submit_button.visible
            m.submit_button.setFocus(true)
        end if

    else if key = "up" and m.login_screen.visible then
        m.login_keyboard.setFocus(true)

    else if key = "back" and m.login_screen.visible then
        m.login_screen.visible = false
        m.login_button.visible = true
        m.login_button.setFocus(true)
        m.login_label.text = "Enter Username"
        m.login_keyboard.text = ""
        m.submit_username_button.visible = true
        m.submit_button.visible = false
        return true

    end if

    return handled
end function
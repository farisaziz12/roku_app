function init()
    ? "[home_scene] init"
    m.login_screen = m.top.findNode("login_screen")
    m.submit_username_button = m.top.findNode("submit_username_button")
    m.login_button = m.top.findNode("login_button")
    m.submit_button = m.top.findNode("submit_button")
    m.login_keyboard = m.top.findNode("login_keyboard")
    m.login_label = m.top.findNode("login_label")
    m.login_error = m.top.findNode("login_error")
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
    ' m.check_login.url = url
    m.check_login.control = "RUN"
end sub

sub onLoginResponse(obj)
    response = obj.getData() 'this is a string from the http response
    'turn the string (JSON) into an Associative Array
    msg = parseJSON(response)
    if msg <> invalid
        if msg.status = "verified"
            handleLoginSuccess()
            if m.login_error.visible
                m.login_error.visible = false
            end if
        else
            m.login_error.visible = true
        end if
    else
        ?"error"
    end if
end sub

sub handleLoginSuccess()
    m.login_screen.visible = false
end sub


function onKeyEvent(key, press) as boolean
    ? "[home_scene] onKeyEvent", key, press
    handled = false
    ' if press then
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
    end if
    ' end if

    return handled
end function
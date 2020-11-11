' Channel entry point
sub main()
    ' SceneGraph canvas that displays the contents of the Scene node instance
    screen = CreateObject("roSGScreen")
    ' Scene node
    scene = screen.createScene("home_scene")
    ' Creating message port to listen for events sent from the screen
    m.port = createObject("roMessagePort")
    screen.setMessagePort(m.port)
    ' Invokes Init method in home_scene.brs
    screen.Show()

    ' Event Loop
    while(true)
        ' waiting for events from screen (setting time out to 0 so that wait doesn't time out)
        msg = wait(0, m.port)
        msg_type = type(msg)

        if msg_type = "roSGScreenEvent"
            ' Returns from main thread if screen is closed
            if msg.screenIsClosed() then return
        end if
    end while
end sub
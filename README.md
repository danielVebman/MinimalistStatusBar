# MinimalistStatusBar
An extremely minimalist yet beautiful status bar.

MinimalistStatusBar provides a very easy to use, prepackaged framework. MinimalistStatusBar shows three data: the time, the type of internet connection, and the battery level. These cycle by fading in and out of each other every 10 seconds. 

The status bar is highly customizable while also ready and beautiful out of the box. Usage is very simple:

Show the status bar:

    MinimalistStatusBar.shared.isHidden = false
    
Customize it:

    MinimalistStatusBar.shared.statusBar.tintColor = UIColor.blue
    MinimalistStatusBar.shared.statusBar.view.backgroundColor = UIColor.white

    // Access to the view allows extremely high customization.
    MinimalistStatusBar.shared.statusBar.view


This requires the FontAwesome font. It can be found at <a href="https://www.fontawesome.io">fontawesome.io</a>. To add the font to your Xcode project

 1. Download the fonts folder from FontAwesome.
 2. Drag `FontAwesome.otf` from the downloaded folder into your Xcode project and when prompted, check `Copy items if needed`, and check your target under `Add to targets`. 
 3. In your `Info.plist`, add a row `Fonts provided by application`. Open that row, and add an item with the string value `FontAwesome.otf`.

If for some reason this does not work, navigate to your project `Build Phases`, and make sure that `FontAwesome.otf` is under `Copy Bundle Resources`. If not, press the `+` button and select it.

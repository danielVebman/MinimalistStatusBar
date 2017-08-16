# MinimalistStatusBar
An extremely minimalist yet beautiful status bar.

MinimalistStatusBar provides a very easy to use, prepackaged framework. MinimalistStatusBar shows three data: the time, the type of internet connection, and the battery level. These cycle, fading in and out every 10 seconds. 

## Showing the status bar

It is recommended that you show the status bar in your App Delegate:

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        MinimalistStatusBar.shared.isHidden = false
        return true
    }
    
Make sure to hide the system status bar:

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
The status bar can also be shown and hidden with `MinimalistStatusBar.shared.setBlurHidden(_:, animated:)`. The animation options are `.fade`, `.slide`, and `.none`.
    
## Customizing the status bar    

The status bar is ready out of the box, yet versatile:

    MinimalistStatusBar.shared.statusBar.tintColor = UIColor.white
    MinimalistStatusBar.shared.setBlurHidden(false, animated: false)
    // Access to the view allows extremely high customization.
    MinimalistStatusBar.shared.statusBar.view.backgroundColor = UIColor(colorLiteralRed: 0.259, green: 0.525, blue: 0.957, alpha: 1)

## Required files

This requires the FontAwesome font. It can be found at <a href="https://www.fontawesome.io">fontawesome.io</a>. To add the font to your Xcode project

 1. Download the fonts folder from FontAwesome.
 2. Drag `FontAwesome.otf` from the downloaded folder into your Xcode project and when prompted, check `Copy items if needed`, and check your target under `Add to targets`. 
 3. In your `Info.plist`, add a row `Fonts provided by application`. Open that row, and add an item with the string value `FontAwesome.otf`.

If for some reason this does not work, navigate to your project `Build Phases`, and make sure that `FontAwesome.otf` is under `Copy Bundle Resources`. If not, press the `+` button and select it.

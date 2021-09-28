# ``EasyTipView``

![Header logo](easytipview.png)

`EasyTipView` is a fully customizable tooltip view written in Swift that can be used as a call to action or informative tip.

## Overview

### Features

- [x] Can be shown pointing to any `UIBarItem` or `UIView` subclass.
- [x] Support for any arrow direction `←, →, ↑, ↓`
- [x] Automatic orientation change adjustments.
- [x] Fully customizable appearance (custom content view or simply just text - including `NSAttributedString` - see the Example app).
- [x] Fully customizable presentation and dismissal animations.

## Usage

 1. First you should customize the preferences:
    ```swift
    var preferences = EasyTipView.Preferences()
    preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
    preferences.drawing.foregroundColor = UIColor.whiteColor()
    preferences.drawing.backgroundColor = UIColor(hue:0.46, saturation:0.99, brightness:0.6, alpha:1)
    preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
    /*
     * Optionally you can make these preferences global for all future EasyTipViews
     */
    EasyTipView.globalPreferences = preferences
    ```

 2. Secondly call the ``EasyTipView/EasyTipView/show(animated:forView:withinSuperview:text:preferences:delegate:)`` method:
     ```swift
     EasyTipView.show(forView: self.buttonB, withinSuperview: self.navigationController?.view, text: "Tip view inside the navigation controller's view. Tap to dismiss!", preferences: preferences, delegate: self)
     ```
    **Note** that if you set the `EasyTipView.globalPreferences`, you can **omit** the ``EasyTipView/EasyTipView/preferences-swift.property`` parameter in all calls. Additionally, you can also omit the `withinSuperview` parameter and the `EasyTipView` will be shown within the main application window.

    *Alternatively, if you want to dismiss the `EasyTipView` programmatically later on, you can use one of the instance methods:*

    ```swift
    let tipView = EasyTipView(text: "Some text", preferences: preferences)
    tipView.show(forView: someView, withinSuperview: someSuperview)
    
    // later on you can dismiss it
    tipView.dismiss()
    ```

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->

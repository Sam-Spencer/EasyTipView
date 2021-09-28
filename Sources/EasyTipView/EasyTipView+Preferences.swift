//
//  EasyTipView+Preferences.swift
//  EasyTipView
//
//  Created by Sam Spencer on 9/28/21.
//  Copyright © 2021 teodorpatras. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import UIKit

extension EasyTipView {
    
    /// The position of the arrow.
    ///
    /// This can be:
    ///
    ///   - `.top`: on top of the bubble
    ///   - `.bottom`: at the bottom of the bubble.
    ///   - `.left`: on the left of the bubble
    ///   - `.right`: on the right of the bubble
    ///   - `.any`: use this option to let the `EasyTipView` automatically find the
    ///  best arrow position.
    ///
    ///  - note: If the passed in arrow cannot be applied due to layout restrictions, a
    ///  different arrow position will be automatically assigned.
    ///
    public enum ArrowPosition {
        /// Use this option to let `EasyTipView` automatically find the best arrow position.
        case any
        
        /// Arrow displays on top of the bubble.
        case top
        
        /// Arrow displays at the bottom of the bubble.
        case bottom
        
        /// Arrow displays to the right of the bubble.
        case right
        
        /// Arrow displays to the left of the bubble.
        case left
        
        static let allValues = [top, bottom, right, left]
    }
    
    /// Customize the `EasyTipView` appearance and behavior.
    ///
    /// The `Preferences` structure encapsulates all customizable properties of the
    /// ``EasyTipView``. These are  split into three discrete structures.
    ///
    public struct Preferences {
        
        /// Encapsulates customizable properties specifying how `EasyTipView` will be drawn
        /// on screen.
        ///
        public struct Drawing {
            /// The corner radius of the tip view bubble.
            public var cornerRadius        = CGFloat(5)
            
            /// The height of the arrow positioned at the top or bottom of the bubble.
            public var arrowHeight         = CGFloat(5)
            
            /// The width of the bubble's arrow.
            public var arrowWidth          = CGFloat(10)
            
            /// The text color.
            public var foregroundColor     = UIColor.white
            
            /// The background color of the bubble.
            public var backgroundColor     = UIColor.red
            
            /// The position of the arrow relative to the bubble and its presenting view.
            /// - SeeAlso: ``EasyTipView/EasyTipView/ArrowPosition``
            public var arrowPosition       = ArrowPosition.any
            
            /// The alignment of the text.
            public var textAlignment       = NSTextAlignment.center
            
            /// Width of the optional border to be applied on the bubble.
            public var borderWidth         = CGFloat(0)
            
            /// Color of the optional border to be applied on the bubble.
            ///
            /// - note: In order for the border to be applied, `borderColor` needs to be
            /// different than `UIColor.clear` and ``borderWidth`` must be greater than `0`.
            ///
            public var borderColor         = UIColor.clear
            
            /// Font to be applied on the text.
            public var font                = UIFont.systemFont(ofSize: 15)
            
            /// The color of the shadow.
            ///
            /// Default value: `UIColor.clear`.
            ///
            public var shadowColor         = UIColor.clear
            
            /// The offset of the shadow.
            ///
            public var shadowOffset        = CGSize(width: 0.0, height: 0.0)
            
            /// The radius of the shadow.
            ///
            /// Default value: `0`.
            ///
            public var shadowRadius        = CGFloat(0)
            
            /// The opacity of the shadow.
            ///
            /// Default value: `0`.
            ///
            /// - note: For the shadow to be drawn, both ``shadowColor`` **and**
            /// ``shadowOpacity`` must be set to a valid value.
            ///
            public var shadowOpacity       = CGFloat(0)
        }
        
        /// Encapsulates customizable properties specifying where `EasyTipView` will be
        /// drawn within its own bounds.
        ///
        public struct Positioning {
            
            /// Bubble inset within its container.
            ///
            public var bubbleInsets         = UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
            
            /// Content inset within the bubble.
            ///
            public var contentInsets        = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
            
            /// Maximum width of the bubble.
            ///
            /// Default value: `200`
            ///
            public var maxWidth             = CGFloat(200)
        }
        
        /// Encapsulates customizable properties specifying how `EasyTipView` will animate
        /// on and off screen.
        ///
        /// The default animations for showing or dismissing are scale up and down. If you
        /// want to change the default behavior, you need to change the attributes of the
        /// `animating` property within the preferences. An example could be:
        ///
        /// ```swift
        /// preferences.animating.dismissTransform = CGAffineTransform(translationX: 0, y: -15)
        /// preferences.animating.showInitialTransform = CGAffineTransform(translationX: 0, y: -15)
        /// preferences.animating.showInitialAlpha = 0
        /// preferences.animating.showDuration = 1.5
        /// preferences.animating.dismissDuration = 1.5
        /// ```
        ///
        /// This produces the following animations:
        /// ![Animation example](animation.gif)
        ///
        /// For more animations, checkout the example project.
        ///
        /// - note: Once you have configured your animations, a good idea would be to __make
        /// these preferences global__, for all future instances of `EasyTipView` by
        /// assigning it to ``EasyTipView/EasyTipView/globalPreferences``.
        ///
        public struct Animating {
            
            /// `CGAffineTransform` specifying how the bubble will be dismissed.
            ///
            /// Default value: Scales down from x1.0 to x0.1.
            ///
            public var dismissTransform     = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
            /// `CGAffineTransform` specifying the initial transform to be applied on the bubble
            /// before it is animated on screen.
            ///
            /// Default value: Scale of x0.0
            ///
            public var showInitialTransform = CGAffineTransform(scaleX: 0, y: 0)
            
            /// `CGAffineTransform` specifying how the bubble will be animated on screen.
            ///
            /// Default value: Identity transform.
            ///
            public var showFinalTransform   = CGAffineTransform.identity
            
            /// Spring animation damping.
            ///
            /// Default value: `0.7`
            ///
            public var springDamping        = CGFloat(0.7)
            
            /// Spring animation velocity.
            ///
            /// Default value: `0.7`
            ///
            public var springVelocity       = CGFloat(0.7)
            
            /// Initial alpha to be applied on the tip view before it is animated on screen.
            ///
            /// Default value: `0.0`
            ///
            public var showInitialAlpha     = CGFloat(0)
            
            /// The alpha to be applied on the tip view when it is animating off screen.
            ///
            /// Default value: `0.0`
            ///
            public var dismissFinalAlpha    = CGFloat(0)
            
            /// Show animation duration.
            ///
            /// Default value: `0.7`
            ///
            public var showDuration         = 0.7
            
            /// Dismiss animation duration.
            ///
            /// Default value: `0.7`
            ///
            public var dismissDuration      = 0.7
            
            /// Prevents view from dismissing on tap if it is set to false.
            ///
            /// Default value: `true`
            ///
            public var dismissOnTap         = true
        }
        
        /// Specify drawing parameters for the `EasyTipView`.
        ///
        public var drawing      = Drawing()
        
        /// Specify positioning parameters for the `EasyTipView`.
        ///
        public var positioning  = Positioning()
        
        /// Specify animation parameters for the `EasyTipView`.
        ///
        public var animating    = Animating()
        
        /// Indicates whether or not the tip-view is displaying a border.
        ///
        public var hasBorder: Bool {
            return drawing.borderWidth > 0 && drawing.borderColor != UIColor.clear
        }
        
        /// Indicates whether or not the tip-view is displaying a shadow.
        ///
        public var hasShadow: Bool {
            return drawing.shadowOpacity > 0 && drawing.shadowColor != UIColor.clear
        }
        
        /// Create a new instance of `Preferences` for an `EasyTipView`.
        public init() {
            
        }
    }
    
}
#endif

//
//  MCDLayout.swift
//  MCDLayout
//
//  Created by mconintet on 5/10/16.
//  Copyright © 2016 mconintet. All rights reserved.
//

import Foundation

@available(iOS 8.0, *)
public class MCDLayoutAnchor: NSObject {
    public let item: UIView
    public let attribute: NSLayoutAttribute

    public init(item: UIView, attribute: NSLayoutAttribute) {
        self.item = item
        self.attribute = attribute
        super.init()
    }

    /* These methods return an inactive constraint of the form thisAnchor = otherAnchor.
     */
    public func constraintEqualToAnchor(anchor: MCDLayoutAnchor!) -> NSLayoutConstraint! {
        return constraintEqualToAnchor(anchor, constant: 0)
    }

    public func constraintGreaterThanOrEqualToAnchor(anchor: MCDLayoutAnchor!) -> NSLayoutConstraint! {
        return constraintGreaterThanOrEqualToAnchor(anchor, constant: 0)
    }

    public func constraintLessThanOrEqualToAnchor(anchor: MCDLayoutAnchor!) -> NSLayoutConstraint! {
        return constraintLessThanOrEqualToAnchor(anchor, constant: 0)
    }

    /* These methods return an inactive constraint of the form thisAnchor = otherAnchor + constant.
     */
    public func constraintEqualToAnchor(anchor: MCDLayoutAnchor!, constant c: CGFloat) -> NSLayoutConstraint! {
        return NSLayoutConstraint(item: item,
            attribute: attribute,
            relatedBy: .Equal,
            toItem: anchor.item,
            attribute: anchor.attribute,
            multiplier: 1,
            constant: c)
    }

    public func constraintGreaterThanOrEqualToAnchor(anchor: MCDLayoutAnchor!, constant c: CGFloat) -> NSLayoutConstraint! {
        return NSLayoutConstraint(item: item,
            attribute: attribute,
            relatedBy: .GreaterThanOrEqual,
            toItem: anchor.item,
            attribute: anchor.attribute,
            multiplier: 1,
            constant: c)
    }

    public func constraintLessThanOrEqualToAnchor(anchor: MCDLayoutAnchor!, constant c: CGFloat) -> NSLayoutConstraint! {
        return NSLayoutConstraint(item: item,
            attribute: attribute,
            relatedBy: .LessThanOrEqual,
            toItem: anchor.item,
            attribute: anchor.attribute,
            multiplier: 1,
            constant: c)
    }

    public func eq(anchor: MCDLayoutAnchor!) -> NSLayoutConstraint! {
        return self.constraintEqualToAnchor(anchor).active(true)
    }

    public func eq(anchor: MCDLayoutAnchor!, constant c: CGFloat) -> NSLayoutConstraint! {
        return self.constraintEqualToAnchor(anchor, constant: c).active(true)
    }

    public func ge(anchor: MCDLayoutAnchor!) -> NSLayoutConstraint! {
        return self.constraintGreaterThanOrEqualToAnchor(anchor).active(true)
    }

    public func ge(anchor: MCDLayoutAnchor!, constant c: CGFloat) -> NSLayoutConstraint! {
        return self.constraintGreaterThanOrEqualToAnchor(anchor, constant: c).active(true)
    }

    public func le(anchor: MCDLayoutAnchor!) -> NSLayoutConstraint! {
        return self.constraintLessThanOrEqualToAnchor(anchor).active(true)
    }

    public func le(anchor: MCDLayoutAnchor!, constant c: CGFloat) -> NSLayoutConstraint! {
        return self.constraintLessThanOrEqualToAnchor(anchor, constant: c).active(true)
    }
}

/* Axis-specific subclasses for location anchors: top/bottom, leading/trailing, baseline, etc.
 */
@available(iOS 8.0, *)
public class MCDLayoutXAxisAnchor: MCDLayoutAnchor {
}

@available(iOS 8.0, *)
public class MCDLayoutYAxisAnchor: MCDLayoutAnchor {
}

/* This layout anchor subclass is used for sizes (width & height).
 */
@available(iOS 8.0, *)
public class MCDLayoutDimension: MCDLayoutAnchor {
    /* These methods return an inactive constraint of the form
     thisVariable = constant.
     */
    public func constraintEqualToConstant(c: CGFloat) -> NSLayoutConstraint! {
        return NSLayoutConstraint(item: item,
            attribute: attribute,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 1,
            constant: c)
    }

    public func constraintGreaterThanOrEqualToConstant(c: CGFloat) -> NSLayoutConstraint! {
        return NSLayoutConstraint(item: item,
            attribute: attribute,
            relatedBy: .GreaterThanOrEqual,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 0,
            constant: c)
    }

    public func constraintLessThanOrEqualToConstant(c: CGFloat) -> NSLayoutConstraint! {
        return NSLayoutConstraint(item: item,
            attribute: attribute,
            relatedBy: .LessThanOrEqual,
            toItem: nil,
            attribute: .NotAnAttribute,
            multiplier: 0,
            constant: c)
    }

    /* These methods return an inactive constraint of the form
     thisAnchor = otherAnchor * multiplier.
     */
    public func constraintEqualToAnchor(anchor: MCDLayoutDimension!, multiplier m: CGFloat) -> NSLayoutConstraint! {
        return constraintEqualToAnchor(anchor, multiplier: m, constant: 0)
    }

    public func constraintGreaterThanOrEqualToAnchor(anchor: MCDLayoutDimension!, multiplier m: CGFloat) -> NSLayoutConstraint! {
        return constraintGreaterThanOrEqualToAnchor(anchor, multiplier: m, constant: 0)
    }

    public func constraintLessThanOrEqualToAnchor(anchor: MCDLayoutDimension!, multiplier m: CGFloat) -> NSLayoutConstraint! {
        return constraintLessThanOrEqualToAnchor(anchor, multiplier: m, constant: 0)
    }

    /* These methods return an inactive constraint of the form
     thisAnchor = otherAnchor * multiplier + constant.
     */
    public func constraintEqualToAnchor(anchor: MCDLayoutDimension!, multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint! {
        return NSLayoutConstraint(item: item,
            attribute: attribute,
            relatedBy: .Equal,
            toItem: anchor.item,
            attribute: anchor.attribute,
            multiplier: m,
            constant: c)
    }

    public func constraintGreaterThanOrEqualToAnchor(anchor: MCDLayoutDimension!, multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint!
    {
        return NSLayoutConstraint(item: item,
            attribute: attribute,
            relatedBy: .GreaterThanOrEqual,
            toItem: anchor.item,
            attribute: anchor.attribute,
            multiplier: m,
            constant: c)
    }

    public func constraintLessThanOrEqualToAnchor(anchor: MCDLayoutDimension!, multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint! {
        return NSLayoutConstraint(item: item,
            attribute: attribute,
            relatedBy: .LessThanOrEqual,
            toItem: anchor.item,
            attribute: anchor.attribute,
            multiplier: m,
            constant: c)
    }

    public func eq(constant c: CGFloat) -> NSLayoutConstraint! {
        return self.constraintEqualToConstant(c).active(true)
    }

    public func eq(anchor: MCDLayoutDimension!, multiplier m: CGFloat) -> NSLayoutConstraint! {
        return self.constraintEqualToAnchor(anchor, multiplier: m).active(true)
    }

    public func eq(anchor: MCDLayoutDimension!, multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint! {
        return self.constraintEqualToAnchor(anchor, multiplier: m, constant: c).active(true)
    }

    public func ge(constant c: CGFloat) -> NSLayoutConstraint! {
        return self.constraintLessThanOrEqualToConstant(c).active(true)
    }

    public func ge(anchor: MCDLayoutDimension!, multiplier m: CGFloat) -> NSLayoutConstraint! {
        return self.constraintLessThanOrEqualToAnchor(anchor, multiplier: m).active(true)
    }

    public func ge(anchor: MCDLayoutDimension!, multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint! {
        return self.constraintGreaterThanOrEqualToAnchor(anchor, multiplier: m, constant: c).active(true)
    }

    public func le(constant c: CGFloat) -> NSLayoutConstraint! {
        return self.constraintLessThanOrEqualToConstant(c).active(true)
    }

    public func le(anchor: MCDLayoutDimension!, multiplier m: CGFloat) -> NSLayoutConstraint! {
        return self.constraintLessThanOrEqualToAnchor(anchor, multiplier: m).active(true)
    }

    public func le(anchor: MCDLayoutDimension!, multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint! {
        return self.constraintLessThanOrEqualToAnchor(anchor, multiplier: m, constant: c).active(true)
    }
}

@available(iOS 8.0, *)
public extension NSLayoutConstraint {
    public func active(active: Bool) -> NSLayoutConstraint {
        let left = self.firstItem as! UIView
        left.translatesAutoresizingMaskIntoConstraints = false
        self.active = active
        return self
    }

    public func priority(priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}

@available(iOS 8.0, *)
public extension UIView {
    public var top: MCDLayoutYAxisAnchor {
        get {
            return MCDLayoutYAxisAnchor(item: self, attribute: .Top)
        }
    }

    public var left: MCDLayoutXAxisAnchor {
        get {
            return MCDLayoutXAxisAnchor(item: self, attribute: .Left)
        }
    }

    public var right: MCDLayoutXAxisAnchor {
        get {
            return MCDLayoutXAxisAnchor(item: self, attribute: .Right)
        }
    }

    public var bottom: MCDLayoutYAxisAnchor {
        get {
            return MCDLayoutYAxisAnchor(item: self, attribute: .Bottom)
        }
    }

    public var width: MCDLayoutDimension {
        get {
            return MCDLayoutDimension(item: self, attribute: .Width)
        }
    }

    public var height: MCDLayoutDimension {
        get {
            return MCDLayoutDimension(item: self, attribute: .Height)
        }
    }

    public var centerX: MCDLayoutXAxisAnchor {
        get {
            return MCDLayoutXAxisAnchor(item: self, attribute: .CenterX)
        }
    }

    public var centerY: MCDLayoutYAxisAnchor {
        get {
            return MCDLayoutYAxisAnchor(item: self, attribute: .CenterY)
        }
    }

    public var leading: MCDLayoutXAxisAnchor {
        get {
            return MCDLayoutXAxisAnchor(item: self, attribute: .Leading)
        }
    }

    public var trailing: MCDLayoutXAxisAnchor {
        get {
            return MCDLayoutXAxisAnchor(item: self, attribute: .Trailing)
        }
    }

    public var baseline: MCDLayoutYAxisAnchor {
        get {
            return MCDLayoutYAxisAnchor(item: self, attribute: .Baseline)
        }
    }

    public var firstBaseline: MCDLayoutYAxisAnchor {
        get {
            return MCDLayoutYAxisAnchor(item: self, attribute: .FirstBaseline)
        }
    }

    public var lastBaseline: MCDLayoutYAxisAnchor {
        get {
            return MCDLayoutYAxisAnchor(item: self, attribute: .LastBaseline)
        }
    }

    public var leftMargin: MCDLayoutXAxisAnchor {
        get {
            return MCDLayoutXAxisAnchor(item: self, attribute: .LeftMargin)
        }
    }

    public var rightMargin: MCDLayoutXAxisAnchor {
        get {
            return MCDLayoutXAxisAnchor(item: self, attribute: .RightMargin)
        }
    }

    public var topMargin: MCDLayoutYAxisAnchor {
        get {
            return MCDLayoutYAxisAnchor(item: self, attribute: .TopMargin)
        }
    }

    public var bottomMargin: MCDLayoutYAxisAnchor {
        get {
            return MCDLayoutYAxisAnchor(item: self, attribute: .BottomMargin)
        }
    }

    public var leadingMargin: MCDLayoutXAxisAnchor {
        get {
            return MCDLayoutXAxisAnchor(item: self, attribute: .LeadingMargin)
        }
    }

    public var trailingMargin: MCDLayoutXAxisAnchor {
        get {
            return MCDLayoutXAxisAnchor(item: self, attribute: .TrailingMargin)
        }
    }

    public var centerXWithinMargins: MCDLayoutXAxisAnchor {
        get {
            return MCDLayoutXAxisAnchor(item: self, attribute: .CenterXWithinMargins)
        }
    }

    public var centerYWithinMargins: MCDLayoutYAxisAnchor {
        get {
            return MCDLayoutYAxisAnchor(item: self, attribute: .CenterYWithinMargins)
        }
    }
}

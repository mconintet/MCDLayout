# MCDLayout

iOS 9.0 introduces a new class `NSLayoutAnchor` for making our works with Auto Layout to be more easier. If you're using swift the way you set the constraints can be like:

```swift
view2.translatesAutoresizingMaskIntoConstraints = false
view2.topAnchor.constraintEqualToAnchor(view1.topAnchor).active = true
```

above code is equal to

```swift
view2.translatesAutoresizingMaskIntoConstraints = false
let constraint = NSLayoutConstraint(item: view2,
    attribute: .Top,
    relatedBy: .Equal,
    toItem: view1,
    attribute: .Top,
    multiplier: 1,
    constant: 0)
constraint.active = true
```

as you see the new APIs are more clearer.

This project's deployment target is equal or greate than 8.0, since only small quantity of devices are using 7.0 or lower and the `active` property of `NSLayoutConstraint` was instroduced from 8.0.

Now question is how to use those 9.0 convenient APIs about Auto Layout in 8.0 environment? Yes, that's what this project does.

By using this project, just one line can complete above work:

```swift
view2.top.eq(view1.top)
```

Also this project is very light - only use few classes to imitate 9.0 APIs. 

## Install

Append this line into your `Cartfile`:

```
github "mconintet/MCDLayout" "master"
```

then update carthage using:

```
carthage update --platform iOS
```
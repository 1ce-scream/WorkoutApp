//
//  UIView+Ext.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import class UIKit.UIView
import class UIKit.UIColor
import struct UIKit.CGFloat

extension UIView {
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = .init(x: 0, y: frame.height - height, width: frame.width, height: height)
        addSubview(separator)
    }
}

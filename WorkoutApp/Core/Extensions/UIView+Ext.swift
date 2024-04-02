//
//  UIView+Ext.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import class UIKit.UIView
import class UIKit.UIColor
import class UIKit.UIButton
import struct UIKit.CGFloat
import struct UIKit.UIRectCorner
import class UIKit.UIBezierPath
import class UIKit.CAShapeLayer
import struct UIKit.CGSize

extension UIView {
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = .init(x: 0, y: frame.height - height, width: frame.width, height: height)
        addSubview(separator)
    }
    
    func makeSystem(_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchDragOutside,
            .touchUpInside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func handleIn() {
        UIView.animate(withDuration: Constants.ButtonsAnimation.animationDuration) {
            self.alpha = Constants.ButtonsAnimation.alphaFinish
        }
    }
    
    @objc func handleOut() {
        UIView.animate(withDuration: Constants.ButtonsAnimation.animationDuration) {
            self.alpha = Constants.ButtonsAnimation.alphaStart
        }
    }
    
    func addViews(_ views: UIView...) {
        views.forEach { view in
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = path.cgPath
        
        let borderLayer = CAShapeLayer()
        borderLayer.frame = bounds
        borderLayer.path = path.cgPath
        borderLayer.strokeColor = Resources.Colors.separator.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.lineWidth = Constants.Common.borderWidth
        
        layer.mask = maskLayer
        layer.addSublayer(borderLayer)
    }
}

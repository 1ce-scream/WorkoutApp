//
//  ProgressView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 26.03.2024.
//

import UIKit

extension TimerView {
    final class ProgressView: UIView {
        func drawProgress(_ progress: CGFloat) {
            layer.sublayers?.removeAll()
            
            let startSegment: CGFloat = 7 / 6
            let endSegment: CGFloat = 8 / 6
            let segment: CGFloat = 1 / 6
            
            let circleFrame = UIScreen.main.bounds.width - (
                Constants.Session.horizontalPadding + Constants.Session.Timer.progressPadding
            ) * 2
            
            let radius = circleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * startSegment
            let endAngle = CGFloat.pi * segment
            
            let circlePath = UIBezierPath(
                arcCenter: center,
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: true
            )
            
            let defaultCircleLayer = CAShapeLayer()
            defaultCircleLayer.path = circlePath.cgPath
            defaultCircleLayer.strokeColor = Resources.Colors.separator.cgColor
            defaultCircleLayer.lineWidth = Constants.Session.Timer.progressWidth
            defaultCircleLayer.strokeEnd = 1
            defaultCircleLayer.fillColor = UIColor.clear.cgColor
            defaultCircleLayer.lineCap = .round
            
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = Resources.Colors.active.cgColor
            circleLayer.lineWidth = Constants.Session.Timer.progressWidth
            circleLayer.strokeEnd = progress
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            
            let dotAngle = CGFloat.pi * (startSegment - (endSegment * progress))
            let dotPoint = CGPoint(
                x: cos(-dotAngle) * radius + center.x,
                y: sin(-dotAngle) * radius + center.y
            )
            let dotPath = UIBezierPath()
            dotPath.move(to: dotPoint)
            dotPath.addLine(to: dotPoint)
            
            let bigDotLayer = CAShapeLayer()
            bigDotLayer.path = dotPath.cgPath
            bigDotLayer.fillColor = UIColor.clear.cgColor
            bigDotLayer.strokeColor = Resources.Colors.active.cgColor
            bigDotLayer.lineCap = .round
            bigDotLayer.lineWidth = Constants.Session.Timer.progressWidth
            
            let dotLayer = CAShapeLayer()
            dotLayer.path = dotPath.cgPath
            dotLayer.fillColor = UIColor.clear.cgColor
            dotLayer.strokeColor = Resources.Colors.infoViewBackground.cgColor
            dotLayer.lineCap = .round
            dotLayer.lineWidth = Constants.Session.Timer.dotWidth
            
            let barsFrame = UIScreen.main.bounds.width - (
                Constants.Session.horizontalPadding + 
                Constants.Session.Timer.progressPadding +
                Constants.Session.Timer.barsPadding
            ) * 2
            let barsRadius = barsFrame / 2
            
            let barsPath = UIBezierPath(arcCenter: center,
                                        radius: barsRadius,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)
            
            let barsLayer = CAShapeLayer()
            barsLayer.path = barsPath.cgPath
            barsLayer.fillColor = UIColor.clear.cgColor
            barsLayer.strokeColor = UIColor.clear.cgColor
            barsLayer.lineWidth = Constants.Session.Timer.barsWidth
            
            let startBarRadius = barsRadius - barsLayer.lineWidth * 0.5
            let endBarRadius = startBarRadius + barsLayer.lineWidth
            
            var angle: CGFloat = startSegment
            (1...9).forEach { _ in
                let barAngle = CGFloat.pi * angle
                let startBarPoint = CGPoint(
                    x: cos(-barAngle) * startBarRadius + center.x,
                    y: sin(-barAngle) * startBarRadius + center.y
                )
                
                let endBarPoint = CGPoint(
                    x: cos(-barAngle) * endBarRadius + center.x,
                    y: sin(-barAngle) * endBarRadius + center.y
                )
                
                let barPath = UIBezierPath()
                barPath.move(to: startBarPoint)
                barPath.addLine(to: endBarPoint)
                
                let barLayer = CAShapeLayer()
                barLayer.path = barPath.cgPath
                barLayer.fillColor = UIColor.clear.cgColor
                barLayer.strokeColor = angle >= (startSegment - (endSegment * progress))
                ? Resources.Colors.active.cgColor : Resources.Colors.separator.cgColor
                barLayer.lineCap = .round
                barLayer.lineWidth = Constants.Session.Timer.barSegmentWidth
                
                barsLayer.addSublayer(barLayer)
                
                angle -= segment
            }
            
            layer.addSublayer(defaultCircleLayer)
            layer.addSublayer(circleLayer)
            layer.addSublayer(bigDotLayer)
            layer.addSublayer(dotLayer)
            layer.addSublayer(barsLayer)
        }
    }
}

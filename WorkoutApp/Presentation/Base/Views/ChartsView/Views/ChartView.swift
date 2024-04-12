//
//  ChartView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 28.03.2024.
//

import UIKit

final class ChartView: BaseView {
    // MARK: Views
    private let yAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()
    
    private let xAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()
}

// MARK: Configuration
extension ChartView {
    func configure(with data: [ChartsView.Data], linesCount: Int, chartTopOffset: CGFloat) {
        layoutIfNeeded()
        drawDashLines(count: linesCount)
        drawChart(with: data, topOffset: chartTopOffset)
    }
    
    override func setupViews() {
        super.setupViews()
        
        addViews(
           xAxisSeparator,
           yAxisSeparator
        )
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            xAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisSeparator.heightAnchor.constraint(equalToConstant: Constants.Common.borderWidth),
            
            yAxisSeparator.topAnchor.constraint(equalTo: topAnchor),
            yAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            yAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeparator.widthAnchor.constraint(equalToConstant: Constants.Common.borderWidth)
            
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}

// MARK: Private methods
private extension ChartView {
    private func drawDashLines(count: Int) {
        (0..<count).map { CGFloat($0) }.forEach {
            drawDashLine(at: bounds.height / CGFloat(count) * $0)
        }
    }
    
    private func drawDashLine(at yPosition: CGFloat) {
        let startPoint = CGPoint(x: .zero, y: yPosition)
        let endPoint = CGPoint(x: bounds.width, y: yPosition)
        
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = Resources.Colors.separator.cgColor
        dashLayer.lineWidth = Constants.Common.borderWidth
        dashLayer.lineDashPattern = [
            Constants.Charts.Chart.dashLineWidth,
            Constants.Charts.Chart.dashLineInterval
        ]
        
        layer.addSublayer(dashLayer)
    }
    
    private func drawChart(with data: [ChartsView.Data], topOffset: CGFloat) {
        guard let maxValue = data.map({ CGFloat($0.value) }).max() else { return }
        
        let valuePoints = data.enumerated().map({ CGPoint(x: CGFloat($0), y: CGFloat($1.value)) })
        let chartHeight = bounds.height / (maxValue + topOffset)
        
        let drawPoints = valuePoints.map {
            let x = bounds.width / CGFloat(data.count - 1) * $0.x
            let y = bounds.height - $0.y * chartHeight
            return CGPoint(x: x, y: y)
        }
        
        let chartPath = UIBezierPath()
        chartPath.move(to: drawPoints[0])
        
        drawPoints.forEach {
            chartPath.addLine(to: $0)
            drawChartDot(at: $0)
        }
        
        let chartLayer = CAShapeLayer()
        chartLayer.path = chartPath.cgPath
        chartLayer.fillColor = UIColor.clear.cgColor
        chartLayer.strokeColor = Resources.Colors.active.cgColor
        chartLayer.lineWidth = Constants.Charts.Chart.linewidth
        chartLayer.strokeEnd = 1
        chartLayer.lineJoin = .round
        
        layer.addSublayer(chartLayer)
    }
    
    private func drawChartDot(at point: CGPoint) {
        let dotPath = UIBezierPath()
        dotPath.move(to: point)
        dotPath.addLine(to: point)
        
        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = Resources.Colors.active.cgColor
        dotLayer.lineCap = .round
        dotLayer.lineWidth = Constants.Charts.Chart.dotWidth
        
        layer.addSublayer(dotLayer)
    }
}

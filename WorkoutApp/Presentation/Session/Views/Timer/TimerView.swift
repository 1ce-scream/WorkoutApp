//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 26.03.2024.
//

import UIKit

final class TimerView: BaseInfoView {
    // MARK: Public properties
    public var state: TimerState = .stopped
    var onFinishTimerCallback: (() -> Void)?
    
    // MARK: Private properties
    private let progressView = ProgressView()
    private var timer = Timer()
    private var timerProgress: CGFloat = .zero
    private var timerDuration: Double = .zero
    
    private let elapsedTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.elapsedTime
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.elapsedTime)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let elapsedTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.elapsedTimeValue)
        label.textColor = Resources.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.remainingTime
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.medium)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.medium)
        label.textColor = Resources.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let timeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = Constants.Session.Timer.timeStackSpacing
        return view
    }()
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.spacing = Constants.Session.Timer.percentStackSpacing
        return view
    }()
    
    private let completedPercentView = PercentView()
    private let remainingPercentView = PercentView()
    
    private let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()
}

// MARK: Configuration
extension TimerView {
    override func setupViews() {
        super.setupViews()
        
        addViews(
            progressView,
            timeStackView,
            bottomStackView
        )
        
        [
            elapsedTimeLabel,
            elapsedTimeValueLabel,
            remainingTimeLabel,
            remainingTimeValueLabel
        ].forEach(timeStackView.addArrangedSubview)
        
        [
            completedPercentView,
            bottomSeparatorView,
            remainingPercentView
        ].forEach(bottomStackView.addArrangedSubview)
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Session.Timer.progressPadding),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Session.Timer.progressPadding),
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Session.Timer.progressPadding),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.Session.Timer.progressPadding),
            
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.Session.Timer.percentStackPadding),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: Constants.Session.Timer.percentStackHeight),
            bottomStackView.widthAnchor.constraint(equalToConstant: Constants.Session.Timer.percentStackWidth),
            
            bottomSeparatorView.widthAnchor.constraint(equalToConstant: Constants.Common.borderWidth),
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
    }
}

// MARK: Methods
extension TimerView {
    func configureTimer(duration: Double, progress: CGFloat) {
        timerDuration = duration
        let tempCurrentProgress = progress > duration ? duration : progress
        let goalValueDivider = duration == 0 ? 1 : duration
        let progress = tempCurrentProgress / goalValueDivider
        let roundedPercents = Int(round(progress * 100))
        
        elapsedTimeValueLabel.text = getDisplayedTime(from: Int(tempCurrentProgress))
        remainingTimeValueLabel.text = getDisplayedTime(from: Int(duration) - Int(tempCurrentProgress))
        completedPercentView.configure(with: Resources.Strings.Session.completedPercent, value: roundedPercents)
        remainingPercentView.configure(with: Resources.Strings.Session.remainingPercent, value: 100 - roundedPercents)
        progressView.drawProgress(progress)
    }
    
    func startTimer() {
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                self.onFinishTimerCallback?()
            }
            self.configureTimer(duration: self.timerDuration, progress: self.timerProgress)
        }
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        guard timerProgress > 0 else { return }
        
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= self.timerDuration * 0.02
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            self.configureTimer(duration: self.timerDuration, progress: self.timerProgress)
        }
    }
}

// MARK: Private Methods
private extension TimerView {
    private func getDisplayedTime(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        
        let secondsString = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesString = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursString = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0
        ? [minutesString, secondsString].joined(separator: ":")
        : [hoursString, minutesString, secondsString].joined(separator: ":")
    }
}

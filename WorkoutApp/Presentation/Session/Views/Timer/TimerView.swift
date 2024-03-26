//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 26.03.2024.
//

import UIKit

final class TimerView: BaseInfoView {
    private let progressView = ProgressView()
    private var timer = Timer()
    private var timerProgress: CGFloat = .zero
    private var timerDuration: Double = .zero
    public var state: TimerState = .stopped
    
    private let elapsedTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.elapsedTime
        label.font = Resources.Fonts.helveticaRegular(with: 14)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let elapsedTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 46)
        label.textColor = Resources.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Session.remainingTime
        label.font = Resources.Fonts.helveticaRegular(with: 13)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 13)
        label.textColor = Resources.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private var timeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    func configureTimer(duration: Double, progress: CGFloat) {
        timerDuration = duration
        let tempCurrentProgress = progress > duration ? duration : progress
        let goalValueDivider = duration == 0 ? 1 : duration
        let progress = tempCurrentProgress / goalValueDivider
        
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
            self.timerProgress -= 0.1
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            self.configureTimer(duration: self.timerDuration, progress: self.timerProgress)
        }
    }
}

extension TimerView {
    override func setupViews() {
        super.setupViews()
        
        addViews(progressView, timeStackView)
        
        [
            elapsedTimeLabel,
            elapsedTimeValueLabel,
            remainingTimeLabel,
            remainingTimeValueLabel
        ].forEach {
            timeStackView.addArrangedSubview($0)
        }
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Session.Timer.progressPadding),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Session.Timer.progressPadding),
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Session.Timer.progressPadding),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.Session.Timer.progressPadding),
            
            timeStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
    }
}


//
//  TrainingCell.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 02.04.2024.
//

import UIKit

final class TrainingCell: UICollectionViewCell {
    // MARK: Static properties
    static let id = "TrainingCellView"
    
    // MARK: Views
    private let checkmarkView = UIImageView(image: Resources.Images.Overview.oval)
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = Constants.Overview.TrainingCell.stackSpacing
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.title)
        label.textColor = Resources.Colors.titleGray
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: Constants.FontSizes.medium)
        label.textColor = Resources.Colors.subtitleGray
        return label
    }()
    
    private let rightArrowView = UIImageView(image: Resources.Images.Overview.rightArrow)
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        configureAppearance()
    }
}

// MARK: Configuration
extension TrainingCell {
    func configure(with title: String, subtitle: String, isDone: Bool, _ roundedType: CellRoundedType) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        checkmarkView.image = isDone ? Resources.Images.Overview.checkmark : Resources.Images.Overview.oval
        
        switch roundedType {
        case .top:
            self.roundCorners([.topLeft, .topRight], radius: Constants.Overview.TrainingCell.cornerRadius)
        case .bottom:
            self.roundCorners([.bottomLeft, .bottomRight], radius: Constants.Overview.TrainingCell.cornerRadius)
        case .all:
            self.roundCorners(.allCorners, radius: Constants.Overview.TrainingCell.cornerRadius)
        case .notRounded:
            self.roundCorners(.allCorners, radius: .zero)
        }
    }
    
    private func setupViews() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        addViews(
            stackView,
            checkmarkView,
            rightArrowView
        )
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Overview.TrainingCell.padding),
            checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkView.heightAnchor.constraint(equalToConstant: Constants.Overview.TrainingCell.checkmarkHeight),
            checkmarkView.widthAnchor.constraint(equalTo: checkmarkView.heightAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: checkmarkView.trailingAnchor, constant: Constants.Overview.TrainingCell.padding),
            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: -Constants.Overview.TrainingCell.padding),
            
            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Overview.TrainingCell.padding),
            rightArrowView.heightAnchor.constraint(equalToConstant: Constants.Overview.TrainingCell.rightArrowHeight),
            rightArrowView.widthAnchor.constraint(equalToConstant: Constants.Overview.TrainingCell.rightArrowWidth),
        ])
    }
    private func configureAppearance() {
        backgroundColor = Resources.Colors.navigationBackground
        layer.borderWidth = Constants.Common.borderWidth
        layer.borderColor = Resources.Colors.separator.cgColor
    }
}

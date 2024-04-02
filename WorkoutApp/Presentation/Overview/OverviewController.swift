//
//  OverviewController.swift
//  WorkoutApp
//
//  Created by Vitaliy Talalay on 24.03.2024.
//

import UIKit

final class OverviewController: BaseController {
    // MARK: Private properties
    private let navBar = OverviewNavBar()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = .zero
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
    
    private var dataSource: [TrainingData] = []
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .overview)
        setupNavBarButtonActions()
    }
    
    // MARK: Private methods
    private func setupNavBarButtonActions() {
        navBar.addAdditingAction(#selector(addButtonAction), with: self)
        navBar.addAllWorkoutsAction(#selector(allWorkoutsButtonAction), with: self)
    }
}

// MARK: Configuration
extension OverviewController {
    override func setupViews() {
        super.setupViews()
        
        view.addViews(
            navBar,
            collectionView
        )
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Common.horizontalPadding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Common.horizontalPadding),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        navigationController?.navigationBar.isHidden = true
        
        collectionView.register(TrainingCell.self, forCellWithReuseIdentifier: TrainingCell.id)
        collectionView.register(
            SectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeader.id
        )
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        dataSource = MockData.shared.trainingData
        collectionView.reloadData()
    }
}

// MARK: Button actions
@objc private extension OverviewController {
    func allWorkoutsButtonAction() {
        print("All Workouts button tapped")
    }
    
    func addButtonAction() {
        print("Add button tapped")
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OverviewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.frame.width, height: Constants.Overview.trainingCellHeight)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        CGSize(width: collectionView.frame.width, height: Constants.Overview.cellHeaderHeight)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
    }
}

// MARK: - UICollectionViewDataSource
extension OverviewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        dataSource[section].items.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TrainingCell.id,
            for: indexPath
        )  as? TrainingCell else { return .init() }
        
        let item = dataSource[indexPath.section].items[indexPath.row]
        
        let roundedType: CellRoundedType
        
        if indexPath.row == 0 && indexPath.row == dataSource[indexPath.section].items.count - 1 {
            roundedType = .all
        } else if indexPath.row == 0 {
            roundedType = .top
        } else if indexPath.row == dataSource[indexPath.section].items.count - 1 {
            roundedType = .bottom
        } else {
            roundedType = .notRounded
        }
        
        cell.configure(with: item.title, subtitle: item.subtitle, isDone: item.isDone, roundedType)
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SectionHeader.id,
            for: indexPath
        ) as? SectionHeader else { return .init() }
        
        header.configure(with: dataSource[indexPath.section].date)
        return header
    }
}

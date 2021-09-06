//
//  ViewController.swift
//  WeatherApp
//
//  Created by Neringa on 17.02.21.
//

import UIKit

class DetailViewController: UIViewController {
    
    enum Section: String, CaseIterable {
        case currentForecast = "Current Forecast"
        case nearestForecast = "Nearest Forecast"
        case weekForecast = "Week Forecast"
    }
    private let viewModel: DetailViewModel
    
    init(with viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, CurrentForecastItem>! = nil
    var detailCollectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        //            view.backgroundColor = .yellow
        configureCollectionView()
        configureDataSource()
        
        viewModel.getWeatherDetails(for: "vilnius") {
            
            print("The place was found")
            
        } failure: {
            //
        }
    }
}


extension DetailViewController {
    func configureCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .simpleSectionBackground
//        collectionView.delegate = self
        collectionView.register(CurrentForecastCell.self, forCellWithReuseIdentifier: CurrentForecastCell.reuseIdentifier)
        collectionView.register(NearestForecastCell.self, forCellWithReuseIdentifier: NearestForecastCell.reuseIdentifier)
        collectionView.register(WeekForecastCell.self, forCellWithReuseIdentifier: WeekForecastCell.reuseIdentifier)
        detailCollectionView = collectionView
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, CurrentForecastItem>(collectionView: detailCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, albumItem: CurrentForecastItem) -> UICollectionViewCell? in
            
            let sectionType = Section.allCases[indexPath.section]
            
            switch sectionType {
            
            case .currentForecast:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentForecastCell.reuseIdentifier, for: indexPath) as? CurrentForecastCell else {
                    fatalError("Could not create new cell")}
//                cell.backgroundColor = .simpleSectionBackground
                return cell
                
            case .nearestForecast:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NearestForecastCell.reuseIdentifier, for: indexPath) as? NearestForecastCell else {
                    fatalError("Could not create new cell")}
//                cell.backgroundColor = .green
                return cell
                
            case .weekForecast:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekForecastCell.reuseIdentifier, for: indexPath) as? WeekForecastCell
                else { fatalError("Could not create new cell") }
//                cell.backgroundColor = .simpleSectionBackground
                return cell
            }
        }
        
        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let isWideView = layoutEnvironment.container.effectiveContentSize.width > 500
            let sectionLayoutKind = Section.allCases[sectionIndex]
            switch (sectionLayoutKind) {
            case .currentForecast: return self.generateCurrentForecastLayout(isWide: isWideView)
            case .nearestForecast: return self.generateNearestForecastLayout()
            case .weekForecast: return self.generateWeekForecastLayout(isWide: isWideView)
            }
        }
        layout.register(DecorationView.self, forDecorationViewOfKind: DecorationView.kind)
        return layout
    }
    
    func generateCurrentForecastLayout(isWide: Bool) -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(2/3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 40, trailing: 2)
        
        let groupFractionalWidth = isWide ? 0.475 : 0.95
        let groupFractionalHeight: Float = isWide ? 1/3 : 1/2
        //        let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1.0)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(CGFloat(groupFractionalWidth)), heightDimension:
                .fractionalWidth(CGFloat(groupFractionalHeight)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    func generateNearestForecastLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 2, bottom: 10, trailing: 2)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(60), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        let decoration = NSCollectionLayoutDecorationItem.background(elementKind: DecorationView.kind)
        section.decorationItems = [decoration]
    
        return section
    }
    
    
    func generateWeekForecastLayout(isWide: Bool) -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 2, bottom: 2, trailing: 2)
        
//        let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1.0)
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: groupHeight)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, CurrentForecastItem> {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, CurrentForecastItem>()
        snapshot.appendSections([Section.currentForecast, Section.nearestForecast, Section.weekForecast])
        snapshot.appendItems(viewModel.getCurrentForecasts(), toSection: .currentForecast)
        snapshot.appendItems(viewModel.getNearestForecasts(), toSection: .nearestForecast)
        snapshot.appendItems(viewModel.getWeekForecasts(), toSection: .weekForecast)
        return snapshot
    }
}



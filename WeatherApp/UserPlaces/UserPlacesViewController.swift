//
//  UserPlaces.swift
//  WeatherApp
//
//  Created by Neringa on 03.05.21.
//

import UIKit

enum Section {
    case all
}

class UserPlacesVC: UIViewController {
    
    private let viewModel: UserPlacesViewModel
    
    init(with viewModel: UserPlacesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, UserPlacesItem>! = nil
    
    private lazy var collectionView: UICollectionView = {
        var layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        layoutConfig.trailingSwipeActionsConfigurationProvider = { indexPath -> UISwipeActionsConfiguration? in
            guard let place = self.dataSource.itemIdentifier(for: indexPath) else { return nil }
            
            let action = UIContextualAction(style: .destructive, title: "Ištrinti", handler: { [weak self] (_, _, completion) in
                self?.deletePlace(place)
                completion(true)
            })
            
            let configuration = UISwipeActionsConfiguration(actions: [action])
            return configuration
        }
        
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        let view = UICollectionView(frame: .zero, collectionViewLayout: listLayout)
        view.register(UserPlacesCell.self, forCellWithReuseIdentifier:UserPlacesCell.reuseIdentifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .simpleSectionBackground
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pasirinktos vietovės"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        //subview + constrainais, paziureti kur uzdejau diffableDataSource
        
        setupViews()
        configureDataSource()
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
        
        let constrs = [collectionView.topAnchor .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                       collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                       collectionView.trailingAnchor .constraint(equalTo: view.trailingAnchor),
                       collectionView.bottomAnchor .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)]
        NSLayoutConstraint.activate(constrs)
    }
    
    private func deletePlace(_ place: UserPlacesItem) {
        guard let indexPath = dataSource.indexPath(for: place) else { return }
        
        viewModel.userPlacesItems.remove(at: indexPath.item)
        
        var snapshot = dataSource.snapshot()
        snapshot.deleteItems([place])
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, UserPlacesItem>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, place: UserPlacesItem) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserPlacesCell.reuseIdentifier, for: indexPath) as? UserPlacesCell else {
                fatalError("Could not create new cell")
            }
            
            cell.set(title: place.name)
            cell.set(subtitle: place.administrativeDivision)
            cell.backgroundColor = .prominentSectionBackground
            
            return cell
        }
        
        let snapshot = snapshot()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func snapshot() -> NSDiffableDataSourceSnapshot<Section, UserPlacesItem> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, UserPlacesItem>()
        snapshot.appendSections([Section.all])
        snapshot.appendItems(viewModel.userPlacesItems, toSection: Section.all)
        return snapshot
    }
    
    @objc private func addTapped() {
                let searchVC = PlacesFactory.viewController()
                let nav = UINavigationController(rootViewController: searchVC)
//        
//                let userPlacesVC = UserPlacesVC(with: UserPlacesViewModel())
//                let nav = UINavigationController(rootViewController: userPlacesVC)
                present(nav, animated: true, completion: nil)
    }
    
}

extension UserPlacesVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

//swift generics for beginners
//nustatyt celems ir collection view atspalvius, kad butu skirtumas +

//sutvarkyti sriftus +
//kaip dark mode atrodo +
//kaip istrinti cele su diffable +


// kai pliusas atsidaro, kad butu paieska vietu +


//paspaudi, atsidaro screenas. 2. kaip identifikuoti, kad astidaro sk=creenas, view did load, kuris yra kvieciamas viena karta per screen // egzisatvima. kaip search logika veikia, kas siuo metu yra padaryta, ka galima pritaikyti, ka gakima pakeisti

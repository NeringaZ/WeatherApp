//
//  PlacesViewController.swift
//  WeatherApp
//
//  Created by Neringa on 01.03.21.
//

import UIKit

class PlacesViewController: UIViewController {
    
    private lazy var table: TableView = {
        
        return TableView(dataSourceDelegate: viewModel)
    }()
    
    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.placeholder = "Ieškoti vietovės"
        controller.searchResultsUpdater = viewModel
        return controller
    }()
    
    private let viewModel: PlacesViewModel
    
    init(with viewModel: PlacesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        view.addSubview(table)
        
        
        let constrs = [table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                       table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                       table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                       table.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        NSLayoutConstraint.activate(constrs)
        
//        let loader = LoaderViewController()
//        loader.modalPresentationStyle = .overFullScreen
//        navigationController?.present(loader, animated: false, completion: nil)
        
        viewModel.getPlaces {
//            loader.dismiss(animated: true, completion: nil)
            
        } failure: {
//            loader.dismiss(animated: true, completion: nil)
        }     
    }
    
}
extension PlacesViewController: PlacesViewModelDelegate {
    
    func reloadData() {
        table.reloadData()
    }
}


private class TableView: UITableView {
    
    init(dataSourceDelegate: UITableViewDataSource & UITableViewDelegate) {
        super.init(frame: .zero, style: .grouped)
        register(PlacesTableViewCell.self, forCellReuseIdentifier: PlacesTableViewCell.identifier)
        translatesAutoresizingMaskIntoConstraints = false
        contentInsetAdjustmentBehavior = .never
        estimatedSectionHeaderHeight = 44.0
        dataSource = dataSourceDelegate
        delegate = dataSourceDelegate
        backgroundColor = .lightGray
        separatorColor = .separator
        alwaysBounceVertical = true
        estimatedRowHeight = 60.0
        separatorStyle = .none
        isScrollEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//

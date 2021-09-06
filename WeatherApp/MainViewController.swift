//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Neringa on 27.04.21.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var pageController: PageViewController = {
//        sukurt page vc, priskiriant si objecta (self), kaip action handler)
        let controller = PageViewController(with: self)
        return controller
    }()
    
    private lazy var placesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .tabBackground1
        button.setTitleColor(.lightBlue, for: .normal)
        button.setTitle("Test", for: .normal)
        button.addTarget(self, action: #selector(placesButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.currentPageIndicatorTintColor = .lightBlue
        control.pageIndicatorTintColor = .navigationBackground
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        
        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
        view.addSubview(placesButton)
        view.addSubview(pageControl)
        view.backgroundColor = .prominentSectionBackground
        
        let constrains = [pageController.view.topAnchor.constraint(equalTo: view.topAnchor),
                          pageController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                          pageController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                          
                          placesButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -.spaceRegular),
                          placesButton.topAnchor.constraint(equalTo: pageController.view.bottomAnchor, constant: .spaceMedum),
                          placesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.spaceRegular),
                          
                          pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                          pageControl.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: .spaceRegular),
                          pageControl.trailingAnchor.constraint(lessThanOrEqualTo: placesButton.trailingAnchor, constant: -.spaceRegular),
                          pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -.spaceRegular),]
        NSLayoutConstraint.activate(constrains)
        
        pageControl.numberOfPages = pageController.numberOfPages()
        pageControl.currentPage = 0
        
    }
    
    @objc private func placesButtonPressed() {
        
        let destinationVC = UserPlacesVC(with: UserPlacesViewModel())
        let nav = UINavigationController(rootViewController: destinationVC)
        present(nav, animated: true, completion: nil)
        
//        let page = DetailFactory.viewController()
//        pageController.addPage(page)
//        let numberPages = pageController.numberOfPages()
//        pageControl.numberOfPages = numberPages
//        pageControl.currentPage = numberPages - 1
    }
}

extension MainViewController: PageControllerHandler {
    
    func didNavigateToPage(with index: Int) {
        pageControl.currentPage = index
    }
}



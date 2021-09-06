//
//  UIPageViewController.swift
//  WeatherApp
//
//  Created by Neringa on 22.04.21.
//

import UIKit

protocol PageControllerHandler: AnyObject {
    func didNavigateToPage(with index: Int)
    //
}

class PageViewController: UIPageViewController {
    
    private var pages: [UIViewController] = [DetailFactory.viewController()]
    
    private unowned let handler: PageControllerHandler
    
    init(with handler: PageControllerHandler) {
        self.handler = handler
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        dataSource = self
        delegate = self
        let initialPage = 0
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    func numberOfPages() -> Int {
        return pages.count
    }
    
    func addPage(_ page: UIViewController) {
        pages.append(page)
        setViewControllers([page], direction: .forward, animated: true, completion: nil)
    }
    
    //metodas, kuris handlintu page pridejimas reikia padaryti, kad pages - tuscias, kai pridesiu, UIPAgeView Controleryje prideti
    // viena page
}


extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentIndex = pages.firstIndex(of: viewController) {
            if currentIndex > 0 {
                return pages[currentIndex - 1]
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentIndex = pages.firstIndex(of: viewController) {
            if currentIndex < pages.count - 1 {
                return pages[currentIndex + 1]
            }
        }
        return nil
    }
}

extension PageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard completed == true,
              let controllers = pageViewController.viewControllers,
              let currentController = controllers.first,
              let currentIndex = pages.firstIndex(of: currentController) else { return }
        
        handler.didNavigateToPage(with: currentIndex)
    }
}

//kaip mainVC zinos, kiek puslapiu pas pageVC, kais jis tai zinos, jis tures nusetinti numberOfPages


//atritraukimas horizontal celese

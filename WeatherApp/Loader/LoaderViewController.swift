//
//  LoaderViewController.swift
//  WeatherApp
//
//  Created by Neringa on 23.03.21.
//

import UIKit

class LoaderViewController: UIViewController {

    private lazy var loader: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView(style: .medium)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.startAnimating()
    return view
}()

override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .yellow
    view.addSubview(loader)

    let constrs = [loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   loader.centerYAnchor.constraint(equalTo: view.centerYAnchor)]
    NSLayoutConstraint.activate(constrs)
}
}

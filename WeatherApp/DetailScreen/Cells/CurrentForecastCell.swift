//
//  CurrentForecastCell.swift
//  WeatherApp
//
//  Created by Neringa on 16.04.21.
//

import UIKit

class CurrentForecastCell: UICollectionViewCell {

    static let reuseIdentifier = "current-forecast-cell-reuse-identifier"
    
    private lazy var conditionImage: UIImageView = {
        let image = UIImage(systemName: "cloud.sun")?.withRenderingMode(.alwaysTemplate)
        let view = UIImageView(image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        let constrs = [view.heightAnchor.constraint(equalToConstant: 50.0),
                      view.widthAnchor.constraint(equalToConstant: 50.0)]
        NSLayoutConstraint.activate(constrs)
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.backgroundColor = .simpleSectionBackground
        view.contentMode = .scaleAspectFit
        return view
        
    }()
    
    private lazy var placeLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .fontCapsLock
        view.text = "Vilnius"
        view.font = .largeTitle
        return view
    }()

    private lazy var temperatureLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "+5C"
        view.textColor = .fontOrange
        view.font = .title3
        return view
    }()

    private lazy var conditionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.textColor = .fontCondition
        view.text = "cloudy"
        view.font = .title3
        view.numberOfLines = 0
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
       
        let hStack = UIStackView(arrangedSubviews:[temperatureLabel, conditionLabel])
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.distribution = .equalSpacing
        hStack.axis = .horizontal
        hStack.alignment = .top
        hStack.spacing = 5.0
        
        let vStack = UIStackView(arrangedSubviews: [conditionImage, placeLabel, hStack])
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.alignment = .center
        vStack.distribution = .equalSpacing
        vStack.axis = .vertical
        vStack.spacing = 5.0
        
        contentView.addSubview(vStack)
        
        let constrs = [vStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                       vStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)]
        NSLayoutConstraint.activate(constrs)
    }
}

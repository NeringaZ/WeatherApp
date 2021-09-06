//
//  NearestForecastCell.swift
//  WeatherApp
//
//  Created by Neringa on 16.04.21.
//

import UIKit

class NearestForecastCell: UICollectionViewCell {
    static let reuseIdentifier = "nearest-forecast-cell-reuse-identifier"
    
    private lazy var timeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .fontCondition
        view.text = "Now"
        view.font = .caption1
        return view
    }()
    
    private lazy var conditionImage: UIImageView = {
        let image = UIImage(systemName: "cloud.sun")?.withRenderingMode(.alwaysTemplate)
        let view = UIImageView(image: image)
        let constrs = [view.heightAnchor.constraint(equalToConstant: 20.0),
                      view.widthAnchor.constraint(equalToConstant: 20.0)]
        NSLayoutConstraint.activate(constrs)
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        view.backgroundColor = .prominentSectionBackground
        return view
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let view = UILabel()
//        view.isHighlighted = true
//        view.highlightedTextColor = .fontSimple
        view.textColor = .title2
        view.text = "+5C"
//        view.font = .systemFont(ofSize: 20.0)
        view.font = .body
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NearestForecastCell {
    func configure() {
        
        contentView.addSubview(timeLabel)
        contentView.addSubview(conditionImage)
        contentView.addSubview(temperatureLabel)
        contentView.backgroundColor = .prominentSectionBackground
        
        let vStack = UIStackView(arrangedSubviews: [timeLabel, conditionImage, temperatureLabel])
        vStack.translatesAutoresizingMaskIntoConstraints = false
//        vStack.backgroundColor = .prominentSectionBackground
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.distribution = .fill
        vStack.spacing = 5.0
        
        contentView.addSubview(vStack)
        
        let verticalConstrs = [vStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                             vStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -20)]
        NSLayoutConstraint.activate(verticalConstrs)
    }
}


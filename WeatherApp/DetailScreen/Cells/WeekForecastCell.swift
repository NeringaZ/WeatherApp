
//
//  WeekForecastCell.swift
//  WeatherApp
//
//  Created by Neringa on 16.04.21.
//

import UIKit

class WeekForecastCell: UICollectionViewCell {
    
    static let reuseIdentifier = "week-forecast-cell-reuse-identifier"
    
    private lazy var weekDayLabel: UILabel = {
        let view = UILabel()
        view.textColor = .title2
        view.text = "Antradienis"
        view.font = .callout
        view.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        return view
    }()
    
    private lazy var conditionImage: UIImageView = {
        let image = UIImage(systemName: "cloud.sun")?.withRenderingMode(.alwaysTemplate)
        let view = UIImageView(image: image)
        let constrs = [view.heightAnchor.constraint(equalToConstant: 20.0),
                      view.widthAnchor.constraint(equalToConstant: 20.0)]
        NSLayoutConstraint.activate(constrs)
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return view
        
    }()
    
    private lazy var hightTemperatureLabel: UILabel = {
        let view = UILabel()
        let constrs = [view.heightAnchor.constraint(equalToConstant: 20.0),
                      view.widthAnchor.constraint(equalToConstant: 50.0)]
        NSLayoutConstraint.activate(constrs)
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.textColor = .fontOrange
        view.text = "+5C"
        view.font = .body
        return view
    }()
    
    private lazy var lowTemperatureLabel: UILabel = {
        let view = UILabel()
        let constrs = [view.heightAnchor.constraint(equalToConstant: 20.0),
                      view.widthAnchor.constraint(equalToConstant: 50.0)]
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        NSLayoutConstraint.activate(constrs)
        view.textColor = .lightBlue
        view.text = "-1C"
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

private extension WeekForecastCell {
    func configure() {
        
        let TempretureStack = UIStackView(arrangedSubviews: [hightTemperatureLabel, lowTemperatureLabel])
        TempretureStack.translatesAutoresizingMaskIntoConstraints = false
        TempretureStack.axis = .horizontal
        TempretureStack.alignment = .center
        TempretureStack.distribution = .fill
        
        let horizontalStack = UIStackView(arrangedSubviews: [weekDayLabel, conditionImage, TempretureStack])
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .leading
        horizontalStack.distribution = .equalCentering

        contentView.addSubview(horizontalStack)
        
        let horizontalConstrs = [horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                                 horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)]
        NSLayoutConstraint.activate(horizontalConstrs)
    }
}


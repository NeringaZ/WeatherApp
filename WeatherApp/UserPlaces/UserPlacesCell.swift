//
//  UserPlacesCell.swift
//  WeatherApp
//
//  Created by Neringa on 21.05.21.
//

import UIKit

class UserPlacesCell: UICollectionViewCell {
    
    static let reuseIdentifier = "user-places-cell-reuse-identifier"
    
    private lazy var placeLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .fontCapsLock
        view.font = .title2
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var administrativeLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .fontCondition
        view.font = .footnote
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
       
        let stack = UIStackView(arrangedSubviews:[placeLabel, administrativeLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: .spaceSmall,
                                                                 leading: .spaceRegular,
                                                                 bottom: .spaceSmall,
                                                                 trailing: .spaceSmall)
        stack.distribution = .fill
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = .spaceTiny
        
        contentView.addSubview(stack)
        
        let constrs = [stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                       stack.topAnchor.constraint(equalTo: contentView.topAnchor),
                       stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                       stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)]
        NSLayoutConstraint.activate(constrs)
    }
    
    func set(title: String?) {
        placeLabel.text = title
    }
    
    func set(subtitle: String?) {
        administrativeLabel.text = subtitle
    }
}

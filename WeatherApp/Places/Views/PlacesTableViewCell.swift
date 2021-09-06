//
//  PlacesTableViewCell.swift
//  WeatherApp
//
//  Created by Neringa on 09.03.21.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {
        
    static let identifier = String(describing: PlacesTableViewCell.self)
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        selectionStyle = .none
        contentView.addSubview(label)
        
        let constr = [label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .spaceRegular),
                      label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .spaceMedum),
                      label.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor),
                      label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.spaceRegular)]
        NSLayoutConstraint.activate(constr)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func cell(from tableView: UITableView, with indexPath: IndexPath) -> PlacesTableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlacesTableViewCell.identifier, for: indexPath) as? PlacesTableViewCell else {
            fatalError()
        }
        return cell
    }
    
    func set(place: String?) {
        label.text = place
    }
}



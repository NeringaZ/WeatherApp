//
//  DecorationView.swift
//  WeatherApp
//
//  Created by Neringa on 07.05.21.
//

import UIKit

class DecorationView: UICollectionReusableView {
    
    static let kind = String(describing: DecorationView.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .prominentSectionBackground
        backgroundColor = .prominentSectionBackground
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


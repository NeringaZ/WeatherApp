//
//  Colors.swift
//  WeatherApp
//
//  Created by Neringa on 05.05.21.
//


import UIKit

extension UIColor {
    
    static let actionHighlight = UIColor.link

    static let prominentSectionBackground = color(withName: "ProminentSectionBackground")
    static let simpleSectionBackground = color(withName: "SimpleSectionBackground")
    static let navigationBackground = color(withName: "NavigationBackground")
    static let tabBackground1 = color(withName: "TabBackground1")
    static let tabBackground2 = color(withName: "TabBackground2")
    static let fontCondition = color(withName: "FontCondition")
    static let fontProminent = color(withName: "FontProminent")
    static let fontCapsLock = color(withName: "FontCapsLock")
    static let fontOrange = color(withName: "FontOrange")
    static let fontSimple = color(withName: "FontSimple")
    static let lightBlue = color(withName: "LightBlue")
    static let separator = color(withName: "Separator")
    static let title2 = color(withName: "Title2")
    static let title3 = color(withName: "Title3")

    
    static let linkValue = UIColor.link
    
    private static func color(withName name: String) -> UIColor {
        return UIColor(named: name) ?? .link
    }
}

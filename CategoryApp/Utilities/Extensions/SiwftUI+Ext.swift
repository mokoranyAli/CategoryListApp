//
//  Color+Ext.swift
//  CategoryApp
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//
import SwiftUI

extension Color {
    static let primary = Color(red: 0.36, green: 0.64, blue: 0.66)
    static let background = Color(red: 0.98, green: 0.98, blue: 0.97)
    static let darkGray = Color(red: 0.38, green: 0.38, blue: 0.38)
    static let middleGray = Color(red: 0.45, green: 0.45, blue: 0.45)
    
}

extension Font {
    static let medium14 = Font.custom("Avenir", size: 14)
        .weight(.medium)
    
    static func appFont(size: Int, weight: Font.Weight) -> Font {
        Font.custom("Avenir", size: CGFloat(size))
            .weight(weight)
    }
}

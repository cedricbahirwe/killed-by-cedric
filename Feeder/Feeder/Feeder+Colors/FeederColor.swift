//
//  FeederColor.swift
//  Feeder
//
//  Created by Cédric Bahirwe on 10/08/2022.
//

import SwiftUI

enum FeederColor: String {
    case foreground2 = "foreground2"
    case gray1 = "gray1"
    case blue2 = "blue2"
    case green1 = "green1"
}

extension Color {
    static func fColor(_ color: FeederColor) -> Color {
        Color(color.rawValue)
    }
}

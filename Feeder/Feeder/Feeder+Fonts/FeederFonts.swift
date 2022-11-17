//
//  FeederFonts.swift
//  Feeder
//
//  Created by Cédric Bahirwe on 10/08/2022.
//

import SwiftUI

enum FeederFonts {
    enum Gilroy: String {
        case medium = "Gilroy-Medium"
        case bold = "Gilroy-Bold"
    }
}

extension Font {
    static func gilroy(_ font: FeederFonts.Gilroy = .medium, _ size: CGFloat = 16) -> Font {
        Font.custom(font.rawValue, size: size)

    }
}

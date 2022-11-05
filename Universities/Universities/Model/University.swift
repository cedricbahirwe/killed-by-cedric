//
//  University.swift
//  Clome
//
//  Created by Cédric Bahirwe on 13/10/2022.
//

import Foundation

struct University: Identifiable, Codable {
    var id: String { name + alphaTwoCode }
    let webPages: [String]
    let name, alphaTwoCode: String
    let stateProvince: String?
    let domains: [String]
    let country: String

    enum CodingKeys: String, CodingKey {
        case webPages = "web_pages"
        case name
        case alphaTwoCode = "alpha_two_code"
        case stateProvince = "state-province"
        case domains, country
    }
}

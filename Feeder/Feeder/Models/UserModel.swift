//
//  UserModel.swift
//  Feeder
//
//  Created by Cédric Bahirwe on 10/08/2022.
//

import Foundation

struct UserModel: Identifiable, Hashable {
    var id: UUID = UUID()
    let firstName: String
    let lastName: String
    let imageURL: String

    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

//
//  UserModel+Preview.swift
//  Feeder
//
//  Created by Cédric Bahirwe on 10/08/2022.
//

import Foundation

extension UserModel {
    static let preview1 = UserModel(id: UUID(),
                                    firstName: "IBM",
                                    lastName: "Closed Guild",
                                    imageURL: "Avatar1")

    static let preview2 = UserModel(id: UUID(),
                                    firstName: "Juric",
                                    lastName: "Koletic",
                                    imageURL: "Avatar2")

    static let previews: [UserModel] = [.preview1, .preview2]
}

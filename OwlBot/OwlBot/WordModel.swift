//
//  WordModel.swift
//  OwlBot
//
//  Created by Cédric Bahirwe on 13/10/2022.
//

import Foundation

struct WordModel: Codable {
    let definitions: [Definition]
    let word: String
    let pronunciation: String?

#if DEBUG
    static let example = WordModel(definitions: [.example], word: "thanks", pronunciation: nil)
#endif
}

struct Definition: Hashable, Codable {
    let type, definition, example: String
    let imageURL, emoji: String?

#if DEBUG
    static let example = Definition(type: "noun", definition: "an expression of gratitude.", example: "festivals were held to give thanks for the harvest", imageURL: nil, emoji: nil)
#endif

    enum CodingKeys: String, CodingKey {
        case type, definition, example
        case imageURL = "image_url"
        case emoji
    }
}

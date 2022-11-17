//
//  PostModel.swift
//  Feeder
//
//  Created by Cédric Bahirwe on 10/08/2022.
//

import Foundation

struct PostModel: Identifiable {
    let id: UUID
    let user: UserModel
    let message: String
    let moreLink: String
    let imageURL: String
    let postedDate: Date

    let likeCount: Int
    let commentsCount: Int
    let canShare: Bool
}

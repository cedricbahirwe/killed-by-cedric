//
//  PostModel+Preview.swift
//  Feeder
//
//  Created by Cédric Bahirwe on 10/08/2022.
//

import Foundation

extension PostModel {
    static var preview1 = PostModel(id: UUID(),
                                    user: .preview1,
                                    message: "While this is relatively small in the context of the $250tn global financial system, the 2008 financial crisis was triggered by the subprime sector which was valued then at $1.2tn . . .",
                                    moreLink: "https://www.google.com",
                                    imageURL: "Post",
                                    postedDate: Date(timeIntervalSinceNow: -600),
                                    likeCount: 5,
                                    commentsCount: 9,
                                    canShare: true)

    static var preview2 = PostModel(id: UUID(),
                                    user: .preview2,
                                    message: "About a year ago, I have start to develop my own trading strategy based on xYard ideas.",
                                    moreLink: "https://www.google.com",
                                    imageURL: "Post",
                                    postedDate: Date(timeIntervalSinceNow: -300),
                                    likeCount: 10,
                                    commentsCount: 100,
                                    canShare: true)

    static let previews: [PostModel] = [
        .preview1,
        .preview2,
        .preview1,
        .preview2
    ]
}

//
//  PostRowView.swift
//  Feeder
//
//  Created by Cédric Bahirwe on 10/08/2022.
//

import SwiftUI

struct PostRowView: View {
    let model: PostModel
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Image(model.user.imageURL)
                    VStack(alignment: .leading, spacing: 0) {
                        Text(model.user.fullName)
                            .font(.gilroy(.bold))
                            .foregroundColor(.accentColor)
                        Text(model.postedDate, style: .relative)
                            .font(.subheadline)
                            .font(.gilroy())
                            .foregroundColor(.fColor(.gray1))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Image(systemName: "ellipsis")
                        .imageScale(.large)
                        .foregroundColor(.fColor(.gray1))
                        .padding()
                }

                // NOTE: Doing some anti-patterns for proof of concept
                Group {
                    if model.likeCount == 10 {
                        Text("\(model.message) \(Text("#TSLA #Trends #Stocks").bold().foregroundColor(.fColor(.blue2)))")
                    } else {
                        Text(model.message)
                    }
                }
                .foregroundColor(.fColor(.foreground2))

                Link(destination: URL(string: model.moreLink)!) {
                    Label("Read Full", image: "Eye")
                        .font(.gilroy(.bold))
                }
            }
            .padding()

            Image(model.imageURL)
                .resizable()
                .scaledToFit()

            HStack(spacing: 25) {
                Group {
                    Label("5", image: "Like")

                    Label("Comments: 9", image: "Comments")

                    Label("Share", image: "Sharing")

                }
                .font(.gilroy(.bold))
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .padding(.vertical)
                .foregroundColor(.fColor(.gray1))
            }
        }
        .background(.background)
    }
}

#if DEBUG
struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView(model: .preview1)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
#endif

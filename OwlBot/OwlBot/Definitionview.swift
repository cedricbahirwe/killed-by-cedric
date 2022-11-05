//
//  Definitionview.swift
//  OwlBot
//
//  Created by Cédric Bahirwe on 13/10/2022.
//

import SwiftUI

struct Definitionview: View {
    let wordDefinition: WordModel
    init(_ word: WordModel, resetAction: @escaping () -> Void) {
        self.wordDefinition = word
        self.reset = resetAction
    }

    var reset: () -> Void
    var body: some View {
        VStack {
            HStack {
                Text("Word:")
                Text(wordDefinition.word)
                    .foregroundColor(.teal)
            }
            .font(.title)

            if let pronunciation = wordDefinition.pronunciation {
                HStack {
                    Text("Pronunciation:")
                    Text(pronunciation)
                        .foregroundColor(.teal)
                }
                .font(.title3)
            }


            VStack(alignment: .leading, spacing: 13) {
                    ForEach(wordDefinition.definitions, id:\.self) { definiton in
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading)  {
                                Text("Type:")
                                    .font(.headline)
                                Text(definiton.type)
                                    .foregroundColor(.teal)
                            }

                            VStack(alignment: .leading)  {
                                Text("Definition:")
                                    .font(.headline)
                                Text(definiton.definition)
                                    .italic()
                                    .foregroundColor(.teal)
                            }

                            if let emoji = definiton.emoji {
                                HStack {
                                    Text("Emoji:")
                                    Text(emoji)
                                        .foregroundColor(.teal)
                                }
                                .font(.title3)
                            }
                        }
                    }

                    Button("Go Back", action: reset)
                        .buttonStyle(.borderedProminent)
                        .tint(.teal)
                        .padding(.top)
                }

                .padding(.leading, 15)
                .overlay(alignment: .leading) {
                    Color.teal
                        .frame(width: 10)
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .cornerRadius(5)
            }
        }
    }
}

#if DEBUG
struct Definitionview_Previews: PreviewProvider {
    static var previews: some View {
        Definitionview(.example, resetAction: {})
    }
}
#endif

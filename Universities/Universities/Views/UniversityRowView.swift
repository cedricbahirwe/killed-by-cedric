//
//  UniversityRowView.swift
//  Universities
//
//  Created by Cédric Bahirwe on 13/10/2022.
//

import SwiftUI

struct UniversityRowView: View {
    private let item: University
    init(_ university: University) {
        self.item = university
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name).bold()

            VStack(alignment: .leading) {
                Text("Pages:").bold()
                ForEach(item.webPages, id:\.self, content: Text.init)

                Text("Domains:").bold()
                ForEach(item.domains, id:\.self, content: Text.init)
            }

            VStack(alignment: .leading) {
                HStack {
                    Text("Country:").bold()
                    Text(item.country)
                }

                HStack {
                    Text("Alpha:").bold()
                    Text(item.alphaTwoCode)
                }
            }
        }
    }
}

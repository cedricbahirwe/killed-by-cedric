//
//  ContentView.swift
//  Feeder
//
//  Created by Cédric Bahirwe on 10/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: TabBarItem = .home()
    #if DEBUG
    let dataPosts: [PostModel] = PostModel.previews
    #else
    let dataPosts: [PostModel] = []
    #endif

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                NavbarView()
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 15) {
                        ForEach(0..<dataPosts.count, id:\.self) { index in
                            PostRowView(model: dataPosts[index])
                        }
                    }
                }

                TabBarView(selection: $selectedTab)
            }

            Image("Publish")
                .padding()
                .padding(.bottom, 80)
        }
        .background(Color(.secondarySystemBackground))

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}

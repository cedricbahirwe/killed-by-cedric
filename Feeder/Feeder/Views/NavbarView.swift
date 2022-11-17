//
//  NavbarView.swift
//  Feeder
//
//  Created by Cédric Bahirwe on 10/08/2022.
//

import SwiftUI

struct NavbarView: View {
    var body: some View {
        HStack(spacing: 15) {
            Image("ProfilePhoto")
            HStack {
                Image("Search")
                TextField("Search", text: .constant(""))
                    .colorInvert()
                    .contrast(2)
                    .font(.gilroy(.bold))
            }
            .padding(.horizontal)

            .frame(height: 40)
            .background(Color(red: 0, green: 0, blue: 0, opacity: 0.15))
            .mask(Capsule())

            Image("Notification.Alert")
                .badge(Text("Some"))
                .overlay(BadgeView(6), alignment: .topTrailing)
        }
        .padding(16)
        .background(Color.accentColor, ignoresSafeAreaEdges: .top)
    }
}

struct NavbarView_Previews: PreviewProvider {
    static var previews: some View {
        NavbarView()
            .previewLayout(.sizeThatFits)
    }
}

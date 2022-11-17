//
//  TabBarView.swift
//  Feeder
//
//  Created by Cédric Bahirwe on 10/08/2022.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selection: TabBarItem
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabBarItem.allCases, id: \.title) { tab in
                VStack(spacing: 10) {
                    Group {
                        if tab == selection {
                            Image(tab.getActiveIconName())
                                .transition(.scale.animation(.spring()))
                        } else {
                            Image(tab.getInactiveIconName())
                                .transition(.opacity.animation(.easeInOut))
                        }
                    }
                    .overlay(BadgeView(tab.badge), alignment: .topTrailing)

                    Text(tab.title)
                        .textCase(.uppercase)
                        .font(.caption2.weight(.bold))
                        .lineLimit(1)
                        .frame(maxWidth: .infinity)
                        .minimumScaleFactor(0.3)
                        .foregroundColor(.white)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        selection = tab
                    }
                }
            }
        }
        .padding(.vertical)
        .background(Color.accentColor, ignoresSafeAreaEdges: .bottom)
        .ignoresSafeArea()
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selection: .constant(.home()))
    }
}

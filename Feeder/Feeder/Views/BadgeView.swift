//
//  BadgeView.swift
//  Feeder
//
//  Created by Cédric Bahirwe on 10/08/2022.
//

import SwiftUI

struct BadgeView: View {
    let badge: Int?
    init(_ badge: Int?) {
        self.badge = badge
    }

    var body: some View {
        Group {
            if let badge = badge {
                Text("\(badge)")
                    .font(.gilroy(.bold, 10))
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                    .foregroundColor(.white)
                    .padding(3)
                    .frame(width: 20, height: 20)
                    .background(Color.fColor(.green1))
                    .clipShape(Circle())
                    .padding(1.5)
                    .background(Color.accentColor)
                    .clipShape(Circle())
                    .offset(x: 10, y: -10)
            }
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(10)
    }
}

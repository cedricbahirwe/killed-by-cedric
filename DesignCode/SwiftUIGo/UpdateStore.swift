//
//  UpdateStore.swift
//  SwiftUIGo
//
//  Created by Cédric Bahirwe on 25/04/2021.
//  Copyright © 2021 Cedric Bahirwe. All rights reserved.
//

import SwiftUI


class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}

//
//  Universities.swift
//  Clome
//
//  Created by Cédric Bahirwe on 13/10/2022.
//

import SwiftUI

struct Universities: View {
    @StateObject private var dataModel = UniverstiesDataModel()
    var body: some View {
        NavigationStack {
            List(dataModel.getCountries(),
                        id:\.self) {

                NavigationLink(
                    $0.uppercased(),
                    value: $0
                )
            }
            .navigationDestination(for: String.self, destination: {
                let universities = dataModel.universitiesForCountry($0)
                List(universities,
                     rowContent: UniversityRowView.init)
                .navigationTitle("\(universities.count) Universities")

            })
            .navigationTitle("\(dataModel.countriesCount) Countries")
        }
    }
}

#if DEBUG
struct Universities_Previews: PreviewProvider {
    static var previews: some View {
        Universities()
    }
}
#endif

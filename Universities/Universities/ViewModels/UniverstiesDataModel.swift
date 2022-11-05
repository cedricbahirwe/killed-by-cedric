//
//  UniverstiesDataModel.swift
//  Universities
//
//  Created by Cédric Bahirwe on 13/10/2022.
//

import Foundation

class UniverstiesDataModel: ObservableObject {
    typealias UniversityGroup = [String: [University]]
    @Published var groupedUniversities: UniversityGroup = [:]

    var countriesCount: Int { getCountries().count }

    init() {
        getGroupedUniversitiesByCountry()
    }

    private func getGroupedUniversitiesByCountry() {
        let universities = loadUniversities()
        let countries = Set(universities.map(\.country))
        var container = UniversityGroup()

        countries.forEach { country in
            container[country] = universities.filter({ $0.country == country })
        }
        
        self.groupedUniversities = container
    }

    private func loadUniversities() -> [University] {
        let path = Bundle.main.url(forResource: "world_universities_and_domains", withExtension: "json")!
        guard let data = try? Data(contentsOf: path, options: .mappedIfSafe) else { return [] }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let result = try? decoder.decode([University].self, from: data)
        return result?.sorted { $0.country < $1.country } ?? []
    }

    func getCountries() -> [String] {
        groupedUniversities.map(\.key).sorted()
    }
    
    func universitiesForCountry(_ country: String) -> [University] {
        return groupedUniversities[country] ?? []
    }
}

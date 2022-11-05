//
//  ContentView.swift
//  OwlBot
//
//  Created by Cédric Bahirwe on 13/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var word = ""
    @State private var wordDefinition: WordModel?
    @State private var isSearching = false
    var body: some View {
        VStack {
            
            if let wordDefinition {
                Definitionview(wordDefinition, resetAction: resetState)
                
            } else {
                searchView
            }
        }
        .padding()
    }
    
    func findDefinition() async -> WordModel? {
        word = word.trimmingCharacters(in: .whitespaces)
        guard !word.isEmpty,
              let url = URL(string: "https://owlbot.info/api/v4/dictionary/\(word)") else { return  nil }
        var request = URLRequest(url: url)
        let token = "cbd8a77be242db0ba7195362fb768ad03022cc41"
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        isSearching = true
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            isSearching = false
            return try JSONDecoder().decode(WordModel.self, from: data)
            
        } catch {
            isSearching = false
            print(error)
            return nil
        }
    }
    
    func resetState() {
        wordDefinition = nil
        word = ""
        isSearching = false
    }
    
    
    var searchView: some View {
        HStack {
            TextField("Enter a word", text: $word)
                .onSubmit  {
                    Task { await findDefinition() }
                }
            
            if isSearching {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(.teal)
            } else {
                Button {
                    Task {
                        wordDefinition = await findDefinition()
                    }
                } label: {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                }
                .disabled(word.isEmpty)
            }
            
        }
        .padding(10)
        .background(.thickMaterial)
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

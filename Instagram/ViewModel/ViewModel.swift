//
//  ViewModel.swift
//  Instagram
//
//  Created by ROCIO CHAN on 20/10/23.
//

import Foundation
import SwiftUI

struct APIData: Decodable {
    let results: [Characters]
}

struct Characters: Decodable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let species: String
    let gender: String
}

class ViewModel: ObservableObject {
    @Published var characters: [Characters] = [Characters]()
    @Published var character: Characters = Characters(id: 1, name: "Jerry Smith", image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg",species: "Human", gender: "Male")
    
    func loadData() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let decodedData = try? JSONDecoder().decode(APIData.self, from: data) {
                DispatchQueue.main.async {
                    self.characters = decodedData.results
                }
            }
        }.resume()
    }
    
    func singleLoadData() {
        loadData()
        guard let character = characters.first else { return }
        self.character = character
    }
    
    func uniqueloadData(characterID:String) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(characterID)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let decodedData = try? JSONDecoder().decode(Characters.self, from: data) {
                DispatchQueue.main.async {
                    self.character = decodedData
                }
            }
        }.resume()
    }
    
}

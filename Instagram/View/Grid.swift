//
//  PostGridApi.swift
//  Instagram
//
//  Created by ROCIO CHAN on 18/10/23.
//

import SwiftUI

struct Grid: View {
    
    @State private var characters: [Characters] = [Characters]()
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(characters) { character in
                AsyncImage(url: URL(string: character.image), content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.size.width / 3, height: UIScreen.main.bounds.size.width / 3)
                        .clipped()
                }, placeholder: {
                    ProgressView()
                })
            }
        }
        .onAppear {
            loadData()
        }
    }
    
    private func loadData() {
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
}

struct PostGridApi_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
    }
}

//
//  SearchGridApi.swift
//  Instagram
//
//  Created by ROCIO CHAN on 18/10/23.
//

import SwiftUI

struct SearchGridApi: View {
    
    @State private var characters: [Characters] = [Characters]()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 100, maximum: 200), spacing: 16)
            ], spacing: 16) {
                ForEach(characters, id: \.self) { character in
                    AsyncImageView(imageURLString: characters.image)
                }
            }
            .padding(16)
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

struct SearchGridApi_Previews: PreviewProvider {
    static var previews: some View {
        SearchGridApi()
    }
}

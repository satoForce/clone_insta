//
//  HomeStoriesCApi.swift
//  Instagram
//
//  Created by ROCIO CHAN on 18/10/23.
//

import SwiftUI

struct HomeStoriesCApi: View {
    
    @State private var characters: [Characters] = [Characters]()
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
          LazyHStack(spacing: 16) {
           
              ForEach(characters) { character in
                  HomeStoriesApi(characters:character)
              }
          }
          .padding(.horizontal, 8)
        }
        .padding()
        .onAppear {
            loadData()
        }
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

struct HomeStoriesCApi_Previews: PreviewProvider {
    static var previews: some View {
        HomeStoriesCApi()
    }
}

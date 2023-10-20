//
//  ProfileView.swift
//  Instagram
//
//  Created by ROCIO CHAN on 18/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var character: Characters = Characters(id: 1, name: "Jerry Smith", image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg")
    
    var body: some View {
        VStack() {
            ProfileTopHeader(characters: $character)
            ScrollView {
                VStack(alignment: .leading) {
                    ProfileHeaderView(characters: $character)
                    
                    Text(character.name).font(.title2).padding(4)
                    
                    ProfileControlButtonView()
                    
                    HStack {
                        HomeStoriesApi(characters: $character)
                        HomeStoriesApi(characters: $character)
                    }
                    
                    ProfileMediaSelectionView()
                    Grid()
                
                }
                .padding()
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
                    guard let character = decodedData.results.first else { return }
                    self.character = character
                }
            }
        }.resume()
    }
}

struct ProfileTopHeader: View {
    @Binding var characters : Characters
    
    var body: some View {
        HStack {
            Text(characters.name)
                .font(.title)
                .fontWeight(.black)
            Image(systemName: "plus")
            
          Spacer()
          
          HStack(spacing: 20) {
            Image(systemName: "plus")
            Image(systemName: "heart")
            Image(systemName: "message")
          }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

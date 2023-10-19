//
//  ProfileView.swift
//  Instagram
//
//  Created by ROCIO CHAN on 18/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var characters: [Characters] = [Characters]()
    @State private var character: Characters = Characters(id: 1, name: "Jerry Smith", image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg")
    
    var body: some View {
        VStack(alignment: .leading) {
            ProfileTopHeader()
            ScrollView {
                VStack(alignment: .leading) {
                    
                    ProfileHeader(characters: character)
                    
//                    Text($characters.name.first? ?? "").padding(.leading)
                }
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
                    guard let character = characters.first else { return }
                    self.character = character
                }
            }
        }.resume()
    }
}

struct ProfileTopHeader: View {
    var body: some View {
        HStack {
            Text("User.name")
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

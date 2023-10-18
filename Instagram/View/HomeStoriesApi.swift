//
//  HomeStoriesApi.swift
//  Instagram
//
//  Created by ROCIO CHAN on 16/10/23.
//

import SwiftUI

struct HomeStoriesApi: View {
    
    @State private var characters: [Characters] = [Characters]()
    
    private var imageSize: CGFloat = 60
    private var lineWidth: CGFloat = 2.5
    private var overlayColors: [Color] = [ .blue, .purple, .red, .pink, .yellow, .orange]
    
    
    var body: some View {
        VStack {
          VStack {
//              Image(characters.first?.image ?? "")
//              .resizable()
//              .frame(width: imageSize, height: imageSize)
//              .cornerRadius(imageSize)
          }
          .overlay(
            Circle()
              .stroke(
                LinearGradient(colors: overlayColors, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: lineWidth)
              .frame(width: imageSize + 8, height: imageSize + 8)
          )
          .frame(width: imageSize + 10, height: imageSize + 10)
          
            Text(characters.first?.name ?? "")
            .font(.caption)
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
                    print(characters)
                }
            }
        }.resume()
    }
}

struct HomeStoriesApi_Previews: PreviewProvider {
    static var previews: some View {
        HomeStoriesApi()
    }
}

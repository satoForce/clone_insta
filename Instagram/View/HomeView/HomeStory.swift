//
//  HomeStoriesApi.swift
//  Instagram
//
//  Created by ROCIO CHAN on 16/10/23.
//

import SwiftUI

struct HomeStoriesApi: View {
    
    @Binding var characters: Characters
    
    var imageSize: CGFloat = 60
    var lineWidth: CGFloat = 2.5
    var overlayColors: [Color] = [ .blue, .purple, .red, .pink, .yellow, .orange]
    //let maxLength: Int = 20
    
    var body: some View {
        VStack {
          VStack {
              AsyncImage(url: URL(string:characters.image), content: { image in
                  image
                      .resizable()
                      .frame(width: imageSize, height: imageSize)
                      .cornerRadius(imageSize)
              }, placeholder: {
                  ProgressView()
              })
          }
          .overlay(
            Circle()
              .stroke(
                LinearGradient(colors: overlayColors, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: lineWidth)
              .frame(width: imageSize + 8, height: imageSize + 8)
          )
          .frame(width: imageSize + 10, height: imageSize + 10)
          
            Text(characters.name.prefix(12) + (characters.name.count > 12 ? "..." : ""))
            .font(.caption)
        }
        .padding(2)
    }
}

//struct HomeStoriesApi_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeStoriesApi(characters: Characters(id: 1, name: "Jerry SmithJerry Smith", image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg"))
//    }
//}

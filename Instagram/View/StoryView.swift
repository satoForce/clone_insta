//
//  StoryView.swift
//  Instagram
//
//  Created by ROCIO CHAN on 21/09/23.
//

import SwiftUI

struct StoryView: View {
    
    var datos: StoryViewData
    
    private var imageSize: CGFloat = 60
    private var lineWidth: CGFloat = 2.5
    private var overlayColors: [Color] = [ .blue, .purple, .red, .pink, .yellow, .orange]
    
    public init(datos:StoryViewData) {
      self.datos = datos
      
    }
    
    var body: some View {
        VStack {
          VStack {
              Image(datos.image)
              .resizable()
              .frame(width: imageSize, height: imageSize)
              .cornerRadius(imageSize)
          }
          .overlay(
            Circle()
              .stroke(
                LinearGradient(colors: overlayColors, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: lineWidth)
              .frame(width: imageSize + 8, height: imageSize + 8)
          )
          .frame(width: imageSize + 10, height: imageSize + 10)
          
            Text(datos.name)
            .font(.caption)
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(datos:StoryViewData(id:1, image: "perro1", name: "Ana"))
    }
}

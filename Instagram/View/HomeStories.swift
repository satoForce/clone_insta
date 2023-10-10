//
//  HomeStories.swift
//  Instagram
//
//  Created by ROCIO CHAN on 21/09/23.
//

import SwiftUI

struct HomeStories: View {
    
    var datos = [
        StoryViewData(id: 1, image: "perro1", name: "Ana"),
        StoryViewData(id: 2, image: "perro2", name: "Pedro")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
          LazyHStack(spacing: 16) {
           
              ForEach(datos) { dato in
                  StoryView(datos:dato)
              }
          }
          .padding(.horizontal, 8)
        }
        .padding()
    }
}

struct HomeStories_Previews: PreviewProvider {
    static var previews: some View {
        HomeStories()
    }
}

//
//  Post1.swift
//  Instagram
//
//  Created by ROCIO CHAN on 13/09/23.
//

import SwiftUI

struct Post1: View {
    var body: some View {
        HStack {
          HStack {
            Image("perro2")
              .resizable()
              .frame(width: 40, height: 40)
              .cornerRadius(40)
            
            Text("Perro 1")
              .font(.caption)
              .fontWeight(.bold)
          }
          
          Spacer()
          
          Image(systemName: "ellipsis")
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
    }
}

struct Post1_Previews: PreviewProvider {
    static var previews: some View {
        Post1()
    }
}

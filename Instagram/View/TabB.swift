//
//  TabB.swift
//  Instagram
//
//  Created by ROCIO CHAN on 13/09/23.
//

import SwiftUI

struct TabB: View {
    
    var body: some View {
        
        VStack(spacing: 0) {
          Divider()
          HStack {
            Image(systemName: "house")
            Spacer()
            Image(systemName: "magnifyingglass")
            Spacer()
            Image(systemName: "display")
            Spacer()
            Image(systemName: "bag")
            Spacer()
            Image("perro1")
              .resizable()
              .frame(width: 22, height: 22)
              .cornerRadius(50)
          }
          .padding(.horizontal, 24)
          .padding(.top, 12)
        }
    }
}

struct TabB_Previews: PreviewProvider {
    static var previews: some View {
        TabB()
    }
}

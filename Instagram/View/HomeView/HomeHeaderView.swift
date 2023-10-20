//
//  Header.swift
//  Instagram
//
//  Created by ROCIO CHAN on 13/09/23.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        HStack {
          Image("logo")
            .resizable()
            .frame(width: 120, height: 70)
            .aspectRatio(contentMode: .fit)
          
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

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}

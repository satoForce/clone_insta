//
//  PostGrid.swift
//  Instagram
//
//  Created by ROCIO CHAN on 29/09/23.
//

import SwiftUI

struct PostGrid: View {
    
    let posts: [Post]
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(posts) {
                Image($0.postImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.size.width / 3, height: UIScreen.main.bounds.size.width / 3)
                    .clipped()
            }
        }
    }
}

struct PostGrid_Previews: PreviewProvider {
    static var previews: some View {
        PostGrid(posts: Data().posts)
    }
}

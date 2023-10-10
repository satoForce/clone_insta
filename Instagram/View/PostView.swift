//
//  PostView.swift
//  Instagram
//
//  Created by ROCIO CHAN on 29/09/23.
//

import SwiftUI

struct PostView: View {
    
    let post: Post
    //let screenWidth: CGFloat
    
    var body: some View {
        VStack {
            
            HStack {
                Image(post.user.userImage)
                    .resizable()
                    .cornerRadius(12.5)
                    .frame(width: 25, height: 25)
                    .padding(.leading, 10)

                Text(post.user.userName)
                    .font(Font.system(size: 14, weight: .semibold))

                Spacer()
                Image("perro1")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.trailing, 10)
            }
            .frame(height: 25)
            
          
            Image(post.postImage)
                .resizable()
                .scaledToFill()
                .clipped()
            
           
            HStack {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(5)
                    .padding(.leading, 10)
                Image(systemName: "bubble.right")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(5)
                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(5)
                Spacer()
                Image(systemName: "bookmark")
                    .resizable()
                    .frame(width: 15, height: 18)
                    .padding(5)
                    .padding(.trailing, 10)
            }
            .frame(height: 20)
            VStack(alignment: .leading, spacing: 0){
                Group {
                    Text(post.user.userName)
                        .font(Font.system(size: 14, weight: .semibold))
                        + Text(" ")
                        + Text(post.caption)
                        .font(Font.system(size: 14))
                }
                .padding(.horizontal, 15)
            }
            //.frame(maxWidth: screenWidth, maxHeight: 60, alignment: .leading)
            Text(post.likes)
                .font(Font.system(size: 14, weight: .semibold))
                .padding(.horizontal, 15)
                .padding(.vertical, 6)
                //.frame(width: screenWidth, height: 15, alignment: .leading)
        }
    }
}


struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Data().posts.first!)
    }
}

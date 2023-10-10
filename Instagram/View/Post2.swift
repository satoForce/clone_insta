//
//  Post2.swift
//  Instagram
//
//  Created by ROCIO CHAN on 13/09/23.
//

import SwiftUI

struct Post2: View {
    
    let post: Post
    
    var body: some View {
        
        VStack {
            HStack {
              HStack {
                Image(post.user.userImage)
                  .resizable()
                  .frame(width: 40, height: 40)
                  .cornerRadius(40)
                
                Text(post.user.userName)
                  .font(.caption)
                  .fontWeight(.bold)
              }
              
              Spacer()
              
              Image(systemName: "ellipsis")
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 8)
            
            VStack(alignment: .leading, spacing: 0) {
                
                VStack {
                    Image(post.postImage)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .aspectRatio(contentMode: .fit)
                  
                  HStack {
                    HStack {
                      Image(systemName: "heart")
                      Image(systemName: "message")
                      Image(systemName: "envelope")
                    }
                    Spacer()
                    
                    Image(systemName: "bookmark")
                  }
                  .padding(.horizontal, 12)
                  .padding(.vertical, 10)
                }
                
                VStack(alignment: .leading) {
                    Group {
                        Text(post.user.userName)
                            .font(Font.system(size: 14, weight: .semibold))
                            + Text(" ")
                            + Text(post.caption)
                            .font(.footnote)
                    }
                    
                    Text(post.likes)
                    .font(.footnote)
                  HStack(spacing: 6) {
                    Text("perro1")
                      .fontWeight(.bold)
                    
                    Text("Hola")
                  }
                  .font(.caption)
                  
                  HStack {
                    HStack(spacing: 8) {
                      Image("perro2")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .cornerRadius(50)
                      
                      Text("Add comment...")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    HStack {
                      Text("😍")
                      Text("😆")
                      Image(systemName: "plus.circle")
                        .foregroundColor(.secondary)
                    }
                  }
                }
                .frame(width: .infinity)
                .padding(.horizontal, 12)
            }
                
            }
            
        }
        
}

struct Post2_Previews: PreviewProvider {
    static var previews: some View {
        Post2(post: Data().posts.first!)
    }
}

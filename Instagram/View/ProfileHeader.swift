//
//  Profile.swift
//  Instagram
//
//  Created by ROCIO CHAN on 26/09/23.
//

import SwiftUI

struct ProfileHeader: View {
    
    @State var characters: Characters
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string:characters.image), content: { image in
                image
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .center)
                    .cornerRadius(60)
                    .clipped()
                    .padding()
            }, placeholder: {
                ProgressView()
            })
                
            Spacer()
            
            VStack {
                Text("205")
                    .font(Font.system(size: 16, weight: .bold))
                Text("Posts")
                    .font(Font.system(size: 14, weight: .medium))
            }
            Spacer()

            VStack {
                Text("364")
                    .font(Font.system(size: 16, weight: .bold))
                Text("Followers")
                    .font(Font.system(size: 14, weight: .medium))
            }
            Spacer()

            VStack {
                Text("358")
                    .font(Font.system(size: 16, weight: .bold))
                Text("Following")
                    .font(Font.system(size: 14, weight: .medium))
            }
            Spacer()
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader(characters: Characters(id: 1, name: "Jerry SmithJerry Smith", image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg"))
    }
}

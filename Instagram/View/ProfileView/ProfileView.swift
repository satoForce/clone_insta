//
//  ProfileView.swift
//  Instagram
//
//  Created by ROCIO CHAN on 18/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack() {
            ProfileTopHeader(characters: viewModel.character)
            ScrollView {
                VStack(alignment: .leading) {
                    ProfileHeaderView(characters: viewModel.character)
                    
                    Text(viewModel.character.name).font(.title2).padding(4)
                    
                    ProfileControlButtonView()
                    
                    HStack {
                        HomeStoriesApi(characters: viewModel.character)
                        HomeStoriesApi(characters: viewModel.character)
                    }
                    
                    ProfileMediaSelectionView()
                    Grid()
                
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.singleLoadData()
        }
    }
}

struct ProfileTopHeader: View {
    @State var characters : Characters
    
    var body: some View {
        HStack {
            Text(characters.name)
                .font(.title)
                .fontWeight(.black)
            Image(systemName: "plus")
            
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

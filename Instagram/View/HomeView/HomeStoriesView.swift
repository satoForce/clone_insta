//
//  HomeStoriesCApi.swift
//  Instagram
//
//  Created by ROCIO CHAN on 18/10/23.
//

import SwiftUI

struct HomeStoriesView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            LazyHStack(spacing: 16) {
                
                ForEach(viewModel.characters) { character in
                    HomeStoriesApi(characters: character)
                }
            }
            .padding(.horizontal, 8)
        }
        .padding()
        .onAppear {
            viewModel.loadData()
        }
    }
}

struct HomeStoriesCApi_Previews: PreviewProvider {
    static var previews: some View {
        HomeStoriesView()
    }
}

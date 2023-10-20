//
//  Post2.swift
//  Instagram
//
//  Created by ROCIO CHAN on 13/09/23.
//

import SwiftUI

struct PostView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        LazyVStack {
            ForEach(viewModel.characters) { character in
                PostScroll(characters: character)
            }
        }
        .onAppear {
            viewModel.loadData()
        }
    }
}

struct Post2_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}

//
//  StoryViewDataApi.swift
//  Instagram
//
//  Created by ROCIO CHAN on 15/10/23.
//

import Foundation
import SwiftUI



struct APIDataView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters) {character in
                    HStack {
                        AsyncImage(url: URL(string:character.image), content: { image in
                            image
                                .resizable()
                                .frame(width: 70, height: 70)
                        }, placeholder: {
                            ProgressView()
                        })
                        
                        Text(character.name)
                    }
                    
                }
                
            }
            .navigationTitle("Personajes")
            .onAppear {
                viewModel.loadData()
            }
        }
    }
}



struct APIDataView_Previews: PreviewProvider {
    static var previews: some View {
        APIDataView()
    }
}



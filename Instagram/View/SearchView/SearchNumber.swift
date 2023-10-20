//
//  SearchNumber.swift
//  Instagram
//
//  Created by ROCIO CHAN on 20/10/23.
//

import SwiftUI

struct SearchNumber: View {
    @State private var characterID = ""
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            HStack {
                TextField("Ingrese el ID del personaje", text: $characterID)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    viewModel.uniqueloadData(characterID: characterID)
                    
                }) {
                    Text("Buscar")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            Divider()
            
            VStack {
                Text(viewModel.character.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 8)
        
                AsyncImage(url: URL(string:viewModel.character.image), content: { image in
                    image
                        .resizable()
                        .frame(width: 300, height: 300)
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {
                        ProgressView()
                })
                VStack {
                    Text("Gender:  \(viewModel.character.gender)")
                    Text("Specie:  \(viewModel.character.species)")
                }
                .font(.title3)
            }
            .onAppear {
                viewModel.uniqueloadData(characterID: characterID)
            }
        }
    }
}

struct SearchNumber_Previews: PreviewProvider {
    static var previews: some View {
        SearchNumber()
    }
}

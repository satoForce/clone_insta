//
//  SearchView.swift
//  Instagram
//
//  Created by ROCIO CHAN on 19/10/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchTerm: String = ""
    @State private var searchResults: String = ""
   
    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)

                TextField("Buscar", text: $searchTerm)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "cursorarrow.square")
                }
            }
            Grid()
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

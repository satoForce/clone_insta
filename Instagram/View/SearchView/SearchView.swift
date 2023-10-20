//
//  SearchView.swift
//  Instagram
//
//  Created by ROCIO CHAN on 20/10/23.
//

import SwiftUI

struct SearchButton: View {
    @State private var characterID = ""
    
    var body: some View {
        VStack {
            TextField("Ingrese el ID del personaje", text: $characterID)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                // Realiza la búsqueda del personaje usando el ID ingresado
                // y muestra los detalles en una vista diferente.
            }) {
                Text("Buscar")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButton()
    }
}

//
//  TabB.swift
//  Instagram
//
//  Created by ROCIO CHAN on 13/09/23.
//

import SwiftUI

struct TabB: View {
    
    var body: some View {
        TabView{
            
            ContentView()
                .tabItem {
                    Label("", systemImage: "house")
            }
            
            Text("buscar")
                .tabItem {
                    Label("", systemImage: "magnifyingglass")
            }
            
            Text("agregar")
                .tabItem {
                    Label("", systemImage: "display")
            }
            
            Text("reels")
                .tabItem {
                    Label("", systemImage: "bag")
            }
            
            Text("perfil")
                .tabItem {
                    Label("", systemImage: "circle")
            }
        }
    }
}

struct TabB_Previews: PreviewProvider {
    static var previews: some View {
        TabB()
    }
}

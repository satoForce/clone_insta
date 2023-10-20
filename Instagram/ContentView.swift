//
//  TabB.swift
//  Instagram
//
//  Created by ROCIO CHAN on 13/09/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            
            HomeView()
                .tabItem {
                    Label("", systemImage: "house")
            }
            
            SearchView()
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
            
            ProfileView()
                .tabItem {
                    Label("", systemImage: "circle")
            }
        }
    }
}

struct TabB_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

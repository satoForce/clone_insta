//
//  ContentView.swift
//  Instagram
//
//  Created by ROCIO CHAN on 13/09/23.
//

import SwiftUI



struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HomeHeaderView()
            ScrollView {
                VStack(alignment: .leading) {
                    HomeStoriesView()
                    Divider()
                    PostView()            
                }
            }
        }
    }
}


        


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

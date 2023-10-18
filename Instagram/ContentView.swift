//
//  ContentView.swift
//  Instagram
//
//  Created by ROCIO CHAN on 13/09/23.
//

import SwiftUI



struct ContentView: View {
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Header()
            
            
            ScrollView {
                VStack(alignment: .leading) {
//                    HomeStoriesApi()
                    Divider()
                   
                    ForEach(Data().posts) {
                        Post2(post: $0)
                    }
                }
                
                TabB()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

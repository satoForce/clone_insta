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
                    HomeStoriesCApi()
                    Divider()
                    Post2()            
                }
            }
        }
    }
}


        


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

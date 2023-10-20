//
//  Post2.swift
//  Instagram
//
//  Created by ROCIO CHAN on 13/09/23.
//

import SwiftUI

struct PostView: View {
    
    @State private var characters: [Characters] = [Characters]()
    
    var body: some View {
        LazyVStack {
            ForEach(characters) { character in
                PostScroll(characters: character)
            }
        }
        .onAppear {
            loadData()
        }
    }
    
    private func loadData() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let decodedData = try? JSONDecoder().decode(APIData.self, from: data) {
                DispatchQueue.main.async {
                    self.characters = decodedData.results
                }
            }
        }.resume()
    }
}
    
struct PostScroll: View {
    
    @State var characters: Characters
    
    var body: some View {
        
        VStack {
            HStack {
                HStack {
                    AsyncImage(url: URL(string:characters.image), content: { image in
                        image
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(40)
                    }, placeholder: {
                        ProgressView()
                    })
                    Text(characters.name)
                        .font(.caption)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                Image(systemName: "heart")
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 8)
            
            VStack(alignment: .leading, spacing: 0) {
                
                VStack {
                    AsyncImage(url: URL(string:characters.image), content: { image in
                        image
                            .resizable()
                            .frame(width: 300, height: 300)
                            .aspectRatio(contentMode: .fit)
                    }, placeholder: {
                        ProgressView()
                    })
                    
                    HStack {
                        HStack {
                            Image(systemName: "heart")
                            Image(systemName: "message")
                            Image(systemName: "envelope")
                        }
                        Spacer()
                        
                        Image(systemName: "bookmark")
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                }
                
                VStack(alignment: .leading) {
                    Group {
                        Text(characters.name)
                            .font(Font.system(size: 14, weight: .semibold))
                        + Text(" ")
                        + Text("Hola a todos")
                            .font(.footnote)
                    }
                    
                    Text("Les gusta a franco y 100 más")
                        .font(.footnote)
                    HStack(spacing: 6) {
                        Text("Usuario")
                            .fontWeight(.bold)
                        
                        Text("Hola!!!")
                    }
                    .font(.caption)
                    
                    HStack {
                        HStack(spacing: 8) {
                            AsyncImage(url: URL(string:characters.image), content: { image in
                                image
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(50)
                            }, placeholder: {
                                ProgressView()
                            })
                            
                            
                            Text("Add comment...")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        HStack {
                            Text("😍")
                            Text("😆")
                            Image(systemName: "plus.circle")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 12)
            }
            
        }
        
    }
}


struct Post2_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}

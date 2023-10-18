//
//  ejemplogrid.swift
//  Instagram
//
//  Created by ROCIO CHAN on 18/10/23.
//

import SwiftUI



struct ejemplogrid: View {
    @State private var items: [String] = []
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 100, maximum: 200), spacing: 16)
            ], spacing: 16) {
                ForEach(items, id: \.self) { imageURLString in
                    AsyncImageView(imageURLString: imageURLString)
                }
            }
            .padding(16)
        }
        .onAppear {
            // Load data from your API and populate the "items" array with image URLs
            // You can use URLSession or other networking libraries to fetch the data.
            // For demonstration, let's assume you have an array of image URLs.
            items = ["https://example.com/image1.jpg", "https://example.com/image2.jpg", "https://example.com/image3.jpg"]
        }
    }
}

struct AsyncImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    let imageURLString: String
    
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
        } else {
            ProgressView()
                .frame(width: 100, height: 100)
                .onAppear {
                    imageLoader.loadImage(from: imageURLString)
                }
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }.resume()
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

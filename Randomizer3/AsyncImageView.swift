//
//  AsyncImageView.swift
//  Randomizer3
//
//  Created by Vitalij Dovhanyč on 08.12.2020.
//

import SwiftUI
import Combine


struct AsyncImageView: View{
    @StateObject private var imageLoader = ImageLoader()
    @Binding var urlString: String?
    
    init(urlString: Binding<String?>){
        self._urlString = urlString
    }
    
    
    var image: some View {
        Group{
            if let image = imageLoader.image{
                
                Image (uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .padding()
            }else{Text ("Press the button")
                .bold()
                .padding()
                .foregroundColor(.primary)
                .padding(.all,10)
                .cornerRadius(20)
                
            }
        }
    }
    
    var body: some View{
        image.onChange(of: urlString, perform: { value in
            if let urlString = urlString, let url = URL(string: urlString){
                imageLoader.url = url
                imageLoader.load()
                
            }
        })
    }
}

final class ImageLoader: ObservableObject{
    
    @Published var image: UIImage?
    
    var url: URL?
    
    func load(){
        guard let url = url else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map{UIImage(data: $0.data)}
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: &$image)
    }
}


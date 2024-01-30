//
//  ImageDownLoader.swift
//  TapToShop
//
//  Created by Mayur Nilwant on 29/01/2024.
//

import Foundation
import Combine
import SwiftUI


struct AsyncImageView: View {
    
    @ObservedObject var downLoadHandler: ImageDownLoader
    
    init(downLoadHandler: ImageDownLoader) {
        self.downLoadHandler = downLoadHandler
    }
  
    private var downLoadedImageView: some View {
        
        Group {
            
            
            if let image = self.downLoadHandler.downloadedImage  {
                
                Image(uiImage: self.downLoadHandler.downloadedImage ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }else {
                
                ProgressView()
            }
            
        }
        
    }
    
    
    var body: some View {
            downLoadedImageView
            .onAppear {
                self.downLoadHandler.start()
            }
            .onDisappear {
                self.downLoadHandler.stop()
            }
    }
}


class ImageDownLoader: ObservableObject {
    
    @Published var downloadedImage: UIImage?
    var cancellable: AnyCancellable?
    let imageUrlString: String
    
    
    init(imageUrlString: String) {
        
        self.imageUrlString = imageUrlString
    }
    
    func start() {
        
        guard let imageUrl = URL(string: self.imageUrlString) else {
            self.downloadedImage = nil
            return
        }
        self.cancellable = URLSession.shared.dataTaskPublisher(for: imageUrl)
            .map({UIImage(data:$0.data)})
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.downloadedImage, on: self)
            
        
        
        
    }
    
    func stop() {
        
        cancellable?.cancel()
    }
}



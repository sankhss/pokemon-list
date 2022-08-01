//
//  UIImageView+Extensions.swift
//  pokemonList
//
//  Created by Samuel Silva on 01/08/22.
//

import UIKit

extension UIImageView {
    private static let imageCache = NSCache<NSString, UIImage>()
    private var imageCache: NSCache<NSString, UIImage> { UIImageView.imageCache }
    
    func imageFromURL(_ stringUrl: String) {
        if let cachedImage = imageCache.object(forKey: NSString(string: stringUrl)) {
            self.image = cachedImage
            return
        }
        
        HttpClient.getData(url: URL(string: stringUrl)) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            self.imageCache.setObject(downloadedImage, forKey: NSString(string: stringUrl))
                            self.image = downloadedImage
                        }
                    }
                }
            case .failure(_):
                break
            }
        }
    }
    
}

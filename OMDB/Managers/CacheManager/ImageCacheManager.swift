//
//  ImageCacheManager.swift
//  OMDB
//
//  Created by Emircan Aydın on 4.11.2021.
//


import UIKit

class ImageCacheManager {
    
    private static let imageCache = NSCache<NSString, UIImage>()
    
    class func setImagesToCache(object: UIImage, key: String) {
        imageCache.setObject(object, forKey: NSString(string: key))
    }
    
    class func returnImagesFromCache(key: String) -> UIImage? {
        return imageCache.object(forKey: NSString(string: key))
    }
    
}

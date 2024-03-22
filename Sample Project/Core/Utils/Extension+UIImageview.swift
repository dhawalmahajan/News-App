//
//  Extension+UIImageview.swift
//  Sample Project
//
//  Created by Dhawal Mahajan on 22/03/24.
//

import UIKit
extension UIImageView {
    
   public func setImageFromUrl(ImageURL :String) {
       let imageCache = NSCache<AnyObject, AnyObject>()
       if let imageFromCache = imageCache.object(forKey: ImageURL as AnyObject) as? UIImage {
                   self.image = imageFromCache
                   return
               }
        if let url = URL(string:ImageURL) {
            URLSession.shared.dataTask( with:url , completionHandler: {
                (data, response, error) -> Void in
                DispatchQueue.main.async {
                    if let data = data, let image = UIImage(data: data) {
                        imageCache.setObject(image, forKey: url as AnyObject)
                        self.image = UIImage(data: data)
                    }
                }
            }).resume()
        }
    }
    
}

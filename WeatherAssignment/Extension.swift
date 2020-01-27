//
//  Extension.swift
//  WeatherAssignment
//
//  Created by Nikhil d on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
import UIKit
extension Data {
    func printString(){
        
        print(String(bytes: self, encoding: .utf8) ?? "")
    }
}

extension FileManager {
    func saveImageToFile(id:String,tempURL:URL){
        if let imageURL = getLocalImageURL(id: id){
            try? moveItem(at: tempURL, to: imageURL)
        }
    }
    func getLocalImageURL(id:String) -> URL?{
        if let cacheDirectoryURL = self.urls(for: .cachesDirectory, in: .userDomainMask).first{
              let imageURL = cacheDirectoryURL.appendingPathComponent(id+".png")
            return imageURL
        }
        return nil
    }
//    func containImage(id:String) -> Bool {
//        var contains = false
//        if let url = getLocalImageURL(id: id){
//           contains = self.fileExists(atPath: url.absoluteString)
//        }
//        return contains
//    }
}


//
//  ImageDownloader.swift
//  WeatherAssignment
//
//  Created by Nikhil d on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
@objc protocol ImageDownloadedDelegate:class {
    func imageDownloaded()
    @objc optional func downloadFailedError()
}
class ImageDownloader {
    weak var delegate:ImageDownloadedDelegate?
    var id:String?
    init(id:String) {
        self.id = id
        let imageString = NetworkConstant.iconString.replacingOccurrences(of: NetworkConstant.imageIdKey, with: id)
        downloadImage(urlString: imageString)
    }
    func downloadImage(urlString:String)
    {
        if let url = URL(string: urlString){
            URLSession.shared.downloadTask(with: url, completionHandler: {(url,urlResponse,error) in
                if let imageId = self.id, let tempURL = url{
                    FileManager.default.saveImageToFile(id: imageId, tempURL: tempURL)
                    DispatchQueue.main.async {
                        self.delegate?.imageDownloaded()

                    }
                }
               
                
                }).resume()

        }
    }
}

//
//  CustomImageView.swift
//  WeatherAssignment
//
//  Created by Nikhil d on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import UIKit
import Foundation
class CustomImageView: UIImageView {
    var id:String?{
        didSet{
            setImageFromLocal()
           
            
        }
    }
    var imageDownloader:ImageDownloader?
    func setImageFromLocal(){
        if let imageId = id {
            if let localURL = FileManager.default.getLocalImageURL(id:imageId){
                image = UIImage(contentsOfFile:localURL.path)
                if image == nil && imageDownloader == nil {
                    imageDownloader = ImageDownloader(id: imageId)
                    imageDownloader?.delegate = self
                }
            }
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension CustomImageView:ImageDownloadedDelegate {
    func imageDownloaded() {
        setImageFromLocal()
    }
    
    
}

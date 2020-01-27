//
//  ForecastCollectionViewController.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ForecastCollectionViewController: UICollectionViewController {

    var forecastArray  = [ForecastResponse]() {
        didSet {
            collectionView?.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        registerCell()
    }
    func registerCell(){
        self.collectionView!.register(UINib(nibName: WeatherUIConstant.ForecastCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: WeatherUIConstant.forecastcellIdenfier)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return forecastArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherUIConstant.forecastcellIdenfier, for: indexPath) as! ForecastCollectionViewCell
        let forecastResponse = forecastArray[indexPath.row]
        cell.imageView.image = nil;
        cell.imageView.id = forecastResponse.weather?.first?.icon
        var titleString = ""
        if let temp = forecastResponse.main?.temp {
            titleString = "\(temp) \u{00B0}C"
        }
        if let dateInt = forecastResponse.dt{
            let date = Date(timeIntervalSince1970: TimeInterval(dateInt))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            titleString = "\n" + dateFormatter.string(from: date)
        }
        
        cell.titleLabel.text = titleString
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

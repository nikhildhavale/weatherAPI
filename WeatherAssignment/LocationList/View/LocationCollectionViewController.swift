//
//  LocationCollectionViewController.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 26/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import UIKit

class LocationCollectionViewController: UICollectionViewController,LocationListViewProtocol {
  
    
    var presenter:LocationListPresenterProtocol?
    var locationList = [LocationItem]() {
        didSet {
            collectionView?.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationListWireFrame.createLocationListModule(locationListRef: self)
        presenter?.viewDidLoad()
        self.registerCell()
    }
    func registerCell(){
        self.collectionView!.register(UINib(nibName: WeatherUIConstant.LocationViewCellCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: WeatherUIConstant.cellIdentifier)
    }
    func showLocationList(with locationItem: [LocationItem]) {
        locationList = locationItem

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return locationList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherUIConstant.cellIdentifier, for: indexPath) as! LocationViewCellCollectionViewCell
        
        cell.labelTitle.text = locationList[indexPath.row].name
    
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let parent = self.parent {
             presenter?.showWeatherSelection(with: locationList[indexPath.row], from: parent)
        }
       
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

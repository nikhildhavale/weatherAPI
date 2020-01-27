//
//  LocationListIneractor.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import UIKit

class LocationListInteractor: LocationListInputInteractorProtocol {
    var presenter: LocationListOutputInteractorProtocol?
    
    func getLocationList() {
        presenter?.locationListDidFetch(locationList: getAllLocationDetail())
    }
    func getAllLocationDetail()->[LocationItem]
    {
        var locationItemArray = [LocationItem]()
        let currentLocationItem = LocationManager.shared.currentLocationItem
        locationItemArray.append(currentLocationItem)
        return locationItemArray
    }

}

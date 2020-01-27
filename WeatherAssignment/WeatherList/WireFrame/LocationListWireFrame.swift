//
//  LocationListWireFrame.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 26/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
import UIKit
class LocationListWireFrame: LocationListWireFrameProtocol {
    func pushToWeatherDetail(with location: LocationItem, from view: UIViewController) {
        view.performSegue(withIdentifier: WeatherUIConstant.weatherDetailsSegue, sender: location)
    }
    static func createLocationListModule(locationListRef: LocationContainerListViewController) {
        let presenter: LocationListPresenterProtocol & LocationListOutputInteractorProtocol = LocationListPresenter()
        
    }
    
}

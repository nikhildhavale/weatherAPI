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
    static func createLocationListModule(locationListRef: LocationCollectionViewController) {
        let presenter:LocationListPresenterProtocol & LocationListOutputInteractorProtocol  = LocationListPresenter()
        locationListRef.presenter = presenter
        locationListRef.presenter?.wireframe = LocationListWireFrame()
        locationListRef.presenter?.view = locationListRef
        locationListRef.presenter?.interactor = LocationListInteractor()
        locationListRef.presenter?.interactor?.presenter = presenter
        
    }
    
}

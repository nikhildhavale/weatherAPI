//
//  LocationWeatherDetailWireFrame.swift
//  WeatherAssignment
//
//  Created by Nikhil d on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
class LocationWeatherDetailWireFrame: LocationWeatherDetailWireFrameProtocol {
    static func createLocationWeatherDetailsModule(locationListRef: LocationWeatherDetailsViewController, with locationItem:LocationItem) {
        let presenter:LocationWeatherDetailPresenterProtocol  = LocationWeatherDetailsPresenter()
        locationListRef.presenter = presenter
        locationListRef.presenter?.view = locationListRef
//        locationListRef.presenter?.interactor = LocationListInteractor()
//        locationListRef.presenter?.interactor?.presenter = presenter
    
    }
    
    
}

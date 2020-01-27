//
//  LocationWeatherDetailWireFrame.swift
//  WeatherAssignment
//
//  Created by Nikhil d on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
import UIKit
class LocationWeatherDetailWireFrame: LocationWeatherDetailWireFrameProtocol {
    static func createLocationWeatherDetailsModule(locationDetailsRef: LocationWeatherDetailsViewController, with locationItem:LocationItem) {
        let presenter:LocationWeatherDetailPresenterProtocol  = LocationWeatherDetailsPresenter()
        locationDetailsRef.presenter = presenter
        locationDetailsRef.presenter?.wireframe = LocationWeatherDetailWireFrame()
        locationDetailsRef.presenter?.view = locationDetailsRef
        locationDetailsRef.locationItem = locationItem
        locationDetailsRef.presenter?.interactor = LocationWeatherDetailsInteractor()
        locationDetailsRef.presenter?.interactor?.presenter = presenter
    }
    func showForecastDetails(forecastDetailArray:[ForecastResponse] , in view:UIViewController){
        if let forecastCollectionController = view.children.first as? ForecastCollectionViewController {
            ForecastWireFrame.createForecastDetailsModule(forecastDetailRef: forecastCollectionController, with: forecastDetailArray)
        }
    }
    
}

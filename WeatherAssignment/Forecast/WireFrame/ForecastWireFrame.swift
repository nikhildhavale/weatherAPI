//
//  ForecastWireFrame.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
class ForecastWireFrame:ForecastDetailWireFrameProtocol {
    static func createForecastDetailsModule(forecastDetailRef: ForecastCollectionViewController, with forecast:[ForecastResponse]){
        let presenter:ForecastDetailPresenterProtocol  = ForecastDetailPresenter()
            forecastDetailRef.presenter = presenter
            forecastDetailRef.presenter?.view = forecastDetailRef
        presenter.loadForecast(forecastArray: forecast)
            
    }
}


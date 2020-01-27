//
//  ForecastDetailsPresenter.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
class ForecastDetailPresenter:ForecastDetailPresenterProtocol {
    var view: ForecastDetailViewProtocol?
    
    func viewDidLoad() {
        
    }
    func loadForecast(forecastArray: [ForecastResponse]) {
        view?.showForecastDetail(with: forecastArray)
    }
    
    
}

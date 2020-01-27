//
//  ForecastDetailsProtocol.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//
import Foundation
import UIKit
protocol  ForecastDetailPresenterProtocol: class {
    
  //  var wireframe:ForecastDetailWireFrameProtocol?{get set}
    var view: ForecastDetailViewProtocol? {get set}
    func viewDidLoad()
    func loadForecast(forecastArray:[ForecastResponse])
    
}
protocol ForecastDetailInputInteractorProtocol: class {
    var presenter: ForecastDetailPresenterProtocol? {get set}
}

protocol ForecastDetailViewProtocol: class {
    //Presenter -> View
    func showForecastDetail(with forecastArray: [ForecastResponse])
}

protocol ForecastDetailWireFrameProtocol: class {
   
}

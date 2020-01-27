//
//  LocationWeatherDetailsProtocol.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
import UIKit
protocol LocationWeatherDetailPresenterProtocol: class {
    
 //   var wireframe:LocationWeatherDetailWireFrameProtocol
    var view: LocationWeatherDetailViewProtocol? {get set}
    var interactor: LocationWeatherDetailInputInteractorProtocol? {get set}
    func viewDidLoad()
    func fetchWeatherDetails(locationItem:LocationItem)
    
}
protocol LocationWeatherDetailInputInteractorProtocol: class {
    var presenter: LocationWeatherDetailPresenterProtocol? {get set}
    func fetchWeatherDetails(locationItem:LocationItem)
}
protocol LocationWeatherDetailOutputInteractorProtocol:class {
    func didFetchWeatherFor(location:LocationItem)
}

protocol LocationWeatherDetailViewProtocol: class {
    //Presenter -> View
    func showLocationWeatherDetail(with locationItem: LocationItem)
}

protocol LocationWeatherDetailWireFrameProtocol: class {
}

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
    
    //View -> Presenter
    func viewDidLoad()
    
}

protocol LocationWeatherDetailViewProtocol: class {
    //Presenter -> View
    func showFruitDetail(with locationItem: LocationItem)
}

protocol LocationWeatherDetailWireFrameProtocol: class {
}

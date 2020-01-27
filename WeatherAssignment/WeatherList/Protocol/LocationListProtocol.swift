//
//  WeatherListProtocol.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 26/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
import UIKit


protocol LocationListViewProtocol: class {
    // PRESENTER -> VIEW
    func showWeathers(with locationItem: [LocationItem])
}

protocol LocationListPresenterProtocol: class {
    //View -> Presenter
    var interactor: LocationListInputInteractorProtocol? {get set}
    var view: LocationListViewProtocol? {get set}
    var wireframe: LocationListWireFrameProtocol? {get set}

    func viewDidLoad()
    func showWeatherSelection(with location: LocationItem, from view: UIViewController)
}

protocol LocationListInputInteractorProtocol: class {
    var presenter: LocationListOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func getLocationList()
}

protocol LocationListOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func WeatherListDidFetch(locationList: [LocationItem])
}

protocol LocationListWireFrameProtocol: class {
    //Presenter -> Wireframe
    func pushToWeatherDetail(with location: LocationItem,from view: UIViewController)
    static func createLocationListModule(locationListRef: LocationContainerListViewController)
}

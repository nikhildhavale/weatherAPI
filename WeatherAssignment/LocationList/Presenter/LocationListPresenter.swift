//
//  LocationListPresenter.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 26/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import Foundation
import UIKit
class LocationListPresenter:LocationListPresenterProtocol{
    var wireframe: LocationListWireFrameProtocol?
    weak var view:LocationListViewProtocol?
    var interactor:LocationListInputInteractorProtocol?
    func viewDidLoad() {
        self.loadLocationList()
    }
    
    func showWeatherSelection(with location: LocationItem, from view: UIViewController) {
        wireframe?.pushToWeatherDetail(with: location, from: view)
    }
    func loadLocationList(){
        interactor?.getLocationList()
    }
   
}
extension LocationListPresenter:LocationListOutputInteractorProtocol{
    func locationListDidFetch(locationList: [LocationItem]) {
        view?.showLocationList(with: locationList)
    }
    
    
}

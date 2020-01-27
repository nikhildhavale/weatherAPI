//
//  LocationWeatherDetailsViewController.swift
//  WeatherAssignment
//
//  Created by Nikhil Dhavale on 27/01/20.
//  Copyright © 2020 Nikhil Dhavale. All rights reserved.
//

import UIKit

class LocationWeatherDetailsViewController: UIViewController {
    var locationItem:LocationItem?
    var presenter:LocationWeatherDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LocationWeatherDetailsViewController:LocationWeatherDetailViewProtocol {
    func showLocationWeatherDetail(with locationItem: LocationItem) {
        
    }
    
    
}

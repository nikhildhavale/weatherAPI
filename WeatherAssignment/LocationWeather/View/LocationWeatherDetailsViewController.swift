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

    @IBOutlet weak var customImage: CustomImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        self.title = locationItem?.name
        if let locationItem = locationItem {
            presenter?.fetchWeatherDetails(locationItem: locationItem)

        }
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
        loadingIndicator.stopAnimating()
        customImage.id =  locationItem.getImageId()
    }
    
    
}

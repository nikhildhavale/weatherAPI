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
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var customImage: CustomImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var pressure:UILabel!
    @IBOutlet weak var Humidity:UILabel!
    @IBOutlet weak var wind:UILabel!
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
        customImage.id =  locationItem.getTodayImageId()
        temperatureLabel.text = locationItem.getCurrentTemperature()
        pressure.attributedText = locationItem.getPressure()
        Humidity.attributedText = locationItem.getHumidity()
        wind.attributedText = locationItem.getWind()
        if let forecastCollectionController = self.children.first as? ForecastCollectionViewController, let forecastArray = locationItem.weatherInfo?.list {
            forecastCollectionController.forecastArray = forecastArray
        }
    }
    
    
}

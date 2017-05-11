//
//  WeatherVC.swift
//  RainyShiny
//
//  Created by NK on 01.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var currentTempLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var currentWeatherImage: UIImageView!
  @IBOutlet weak var currentWeatherLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  let locationManager = CLLocationManager()
  var currentLocation: CLLocation!
  
  var currentWeather = CurrentWeather()
  var forecasts = [Forecast]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.startMonitoringSignificantLocationChanges()
    
    tableView.delegate = self
    tableView.dataSource = self

  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    locationAuthStatus()
    currentWeather.downloadDetails {
      self.updateMainUI()
    }
    
    downloadForecastData(completed: {
      self.tableView.reloadData()
    })

  }
  
  func locationAuthStatus() {
    if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
      currentLocation = locationManager.location
      Location.sharedInstance.latitude = currentLocation.coordinate.latitude
      Location.sharedInstance.longitude = currentLocation.coordinate.longitude
    } else {
      locationManager.requestWhenInUseAuthorization()
      locationAuthStatus()
    }
  }
  
  func downloadForecastData(completed: @escaping DownloadComplete) {
    let forecastURL = URL(string: FORECAST_URL)!
    Alamofire.request(forecastURL).responseJSON { response in
      let result = response.result
      
      if let dict = result.value as? Dictionary<String, Any> {
        if let list = dict["list"] as? [Dictionary<String, Any>] {
          for obj in list {
            let forecast = Forecast(weatherDict: obj)
            self.forecasts.append(forecast)
          }
          if self.forecasts.count >= 1 {
            self.forecasts.remove(at: 0)
          }
        }
      }
      completed()
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return forecasts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? ForecastCell {
      let forecast = forecasts[indexPath.row]
      cell.configureCell(forecast: forecast)
      return cell
    } else {
      return ForecastCell()
    }

  }
  
  func updateMainUI() {
    dateLabel.text = currentWeather.date
    locationLabel.text = currentWeather.cityName
    currentWeatherLabel.text = currentWeather.weatherType
    currentTempLabel.text = "\(currentWeather.currentTemp)"
    currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
  }

}


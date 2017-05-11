//
//  CurrentWeather.swift
//  RainyShiny
//
//  Created by NK on 03.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
  private var _date: String!
  private var _cityName: String = ""
  private var _weatherType: String = ""
  private var _currentTemp: Double = 0.0
  
  var cityName: String {
    return _cityName
  }
  
  var date: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .none
    let currentDate = dateFormatter.string(from: Date())
    _date = "Today, \(currentDate)"
    
    return _date
  }
  
  var weatherType: String {
    return _weatherType
  }
  
  var currentTemp: Double {
    return _currentTemp
  }
  
 func downloadDetails(completed: @escaping DownloadComplete) {
  
  let weatherURL = URL(string: CURRENT_WEATHER_URL)!
    Alamofire.request(weatherURL).responseJSON { response in
      
      let result = response.result
      
      if let dict = result.value as? Dictionary<String, Any> {
        if let name = dict["name"] as? String {
          self._cityName = name.capitalized
        }
        
        if let weather = dict["weather"] as? Array<Dictionary<String, Any>>,
          let type = weather[0]["main"] as? String {
          self._weatherType = type.capitalized
        }
        
        if let main = dict["main"] as? Dictionary<String, Any>,
          let temp = main["temp"] as? Double {
          self._currentTemp = temp
        }
      }
      completed()
    }
    
  
  }

}

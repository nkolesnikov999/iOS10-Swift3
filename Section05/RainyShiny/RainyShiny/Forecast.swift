//
//  Forecast.swift
//  RainyShiny
//
//  Created by NK on 10.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
  private var _date: String = ""
  private var _weatherType: String = ""
  private var _highTemp: String = ""
  private var _lowTemp: String = ""
  
  var date: String {
    return _date
  }
  
  var weatherType: String {
    return _weatherType
  }
  
  var highTemp: String {
    return _highTemp
  }
  
  var lowTemp: String {
    return _lowTemp
  }
  
  init(weatherDict: Dictionary<String, Any>) {
    
    if let temp = weatherDict["temp"] as? Dictionary<String, Any> {
      if let max = temp["max"] as? Double {
        _highTemp = "\(max)"
      }
      if let min = temp["min"] as? Double {
        _lowTemp = "\(min)"
      }
    }
    if let weather = weatherDict["weather"] as? [Dictionary<String, Any>],
      let type = weather[0]["main"] as? String  {
      _weatherType = type
    }
    if let dt = weatherDict["dt"] as? Int {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "EEEE"
      let date = Date(timeIntervalSince1970: TimeInterval(dt))
      _date = dateFormatter.string(from: date)
    }
  }
}

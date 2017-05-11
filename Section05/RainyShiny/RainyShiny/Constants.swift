//
//  Constants.swift
//  RainyShiny
//
//  Created by NK on 02.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import Foundation

let weatherKeyMy = "730123f27f8c7def8eb396f876aee68c"
let weatherKeyCaleb = "45dd981d2adec8c979f79bf7d3dc1ee8"

let weatherURL = "api.openweathermap.org/data/2.5/weather?lat=55.76534&lon=37.73131&units=metric&appid=730123f27f8c7def8eb396f876aee68c"

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let UNITS = "&units=metric"
let APP_ID = "&appid="
let API_KEY = "730123f27f8c7def8eb396f876aee68c"

typealias DownloadComplete = () -> ()



let CURRENT_WEATHER_URL = BASE_URL + LATITUDE + "\(Location.sharedInstance.latitude!)" + LONGITUDE + "\(Location.sharedInstance.longitude!)" + UNITS + APP_ID + API_KEY

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&units=metric&mode=json&cnt=14&appid=730123f27f8c7def8eb396f876aee68c"

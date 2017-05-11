//
//  Location.swift
//  RainyShiny
//
//  Created by NK on 11.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import CoreLocation

class Location {
  static var sharedInstance = Location()
  private init() {}
  
  var latitude: Double!
  var longitude: Double!
}

//
//  ForecastCell.swift
//  RainyShiny
//
//  Created by NK on 11.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {

  @IBOutlet weak var imageCell: UIImageView!
  @IBOutlet weak var dateLbl: UILabel!
  @IBOutlet weak var typeLbl: UILabel!
  @IBOutlet weak var maxLbl: UILabel!
  @IBOutlet weak var minLbl: UILabel!
  
  func configureCell(forecast: Forecast) {
    minLbl.text = forecast.lowTemp
    maxLbl.text = forecast.highTemp
    dateLbl.text = forecast.date
    typeLbl.text = forecast.weatherType
    imageCell.image = UIImage(named: "\(forecast.weatherType) Mini")
  }

}

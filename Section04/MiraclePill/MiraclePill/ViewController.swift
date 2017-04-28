//
//  ViewController.swift
//  MiraclePill
//
//  Created by NK on 27.04.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
  let stateArray = ["Texas", "California", "Alaska", "Alabama", "Nevada"]

  @IBOutlet weak var pillImage: UIImageView!
  @IBOutlet weak var pillLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var dividerView: UIView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var nameText: UITextField!
  @IBOutlet weak var streetLabel: UILabel!
  @IBOutlet weak var streetText: UITextField!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var cityText: UITextField!
  @IBOutlet weak var stateLabel: UILabel!
  @IBOutlet weak var statePicker: UIPickerView!
  @IBOutlet weak var statePickerBtn: UIButton!
  @IBOutlet weak var countryLabel: UILabel!
  @IBOutlet weak var countryText: UITextField!
  @IBOutlet weak var zipLabel: UILabel!
  @IBOutlet weak var zipText: UITextField!
  @IBOutlet weak var buyBtn: UIButton!
  @IBOutlet weak var successImage: UIImageView!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func stateBtnPressed(_ sender: Any) {
    statePicker.isHidden = false
    countryLabel.isHidden = true
    countryText.isHidden = true
    zipLabel.isHidden = true
    zipText.isHidden = true
    buyBtn.isHidden = true
  }

  @IBAction func buyPressed(_ sender: Any) {
    pillImage.isHidden = true
    pillLabel.isHidden = true
    priceLabel.isHidden = true
    dividerView.isHidden = true
    nameLabel.isHidden = true
    nameText.isHidden = true
    streetLabel.isHidden = true
    streetText.isHidden = true
    cityLabel.isHidden = true
    cityText.isHidden = true
    stateLabel.isHidden = true
    statePickerBtn.isHidden = true
    countryLabel.isHidden = true
    countryText.isHidden = true
    zipLabel.isHidden = true
    zipText.isHidden = true
    buyBtn.isHidden = true
    successImage.isHidden = false
  }
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return stateArray.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return stateArray[row];
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    statePicker.isHidden = true
    statePickerBtn.setTitle(stateArray[row], for: .normal)
    countryLabel.isHidden = false
    countryText.isHidden = false
    zipLabel.isHidden = false
    zipText.isHidden = false
    buyBtn.isHidden = false
  }
}


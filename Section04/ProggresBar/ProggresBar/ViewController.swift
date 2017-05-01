//
//  ViewController.swift
//  ProggresBar
//
//  Created by NK on 01.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var progressBarView: ProgressBarView!
  @IBOutlet weak var slider: UISlider!

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }


  @IBAction func sliderMoved(_ sender: Any) {
    progressBarView.progress = CGFloat(slider.value)
  }

}


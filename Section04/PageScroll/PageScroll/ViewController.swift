//
//  ViewController.swift
//  PageScroll
//
//  Created by NK on 28.04.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var scrollView: UIScrollView!
  var images = [UIImageView]()

  override func viewDidLoad() {
    super.viewDidLoad()
  
  }
  
  override func viewDidAppear(_ animated: Bool) {
    var contentWidth: CGFloat = 0.0
    
    for x in 0...2 {
      let image = UIImage(named: "icon\(x).png")
      let imageView = UIImageView(image: image)
      images.append(imageView)
      
      let newX = scrollView.frame.size.width/2 + scrollView.frame.size.width * CGFloat(x)
      contentWidth += scrollView.frame.size.width
      scrollView.addSubview(imageView)
      imageView.frame = CGRect(x: newX - 75, y: view.frame.size.height/2 - 75, width: 150, height: 150)
      
    }
    //scrollView.backgroundColor = UIColor.purple
    scrollView.clipsToBounds = false
    scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
  }
  
}


//
//  PartyCell.swift
//  PartyRock
//
//  Created by NK on 30.04.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

  @IBOutlet weak var VideoPreviewImage: UIImageView!
  @IBOutlet weak var VideoTitle: UILabel!
  
  override func awakeFromNib() {
      super.awakeFromNib()
    
  }

  func updateUI(partyRock: PartyRock) {
    VideoTitle.text = partyRock.videoTitle
    let url = URL(string: partyRock.imageURL)!
    
    DispatchQueue.global().async {
      do {
        let data = try Data(contentsOf: url)
        DispatchQueue.global().sync {
          self.VideoPreviewImage.image = UIImage(data: data)
        }
      } catch {
        print("No data")
      }
      
    }
  }

}

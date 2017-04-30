//
//  ViewController.swift
//  PartyRock
//
//  Created by NK on 30.04.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var partyRocks = [PartyRock]()
  
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let p1 = PartyRock(imageURL: "http://simpleandloveable.com/images/sun-goes-down.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/V4eGO-cD2ys\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Where The Sun Goes Down")
    partyRocks.append(p1)
    let p2 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/b/b7/Redfoo-Let%27s-Get-Ridiculous.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CdLhdrNgGu4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")
    partyRocks.append(p2)
    let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/DR0Un_NPAfs/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle Lesson")
    partyRocks.append(p3)
    let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/x15t5zNzjaI/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wEX7gDWCQVo\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock Commercial")
    partyRocks.append(p4)
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
      
      let partyRock = partyRocks[indexPath.row]
      cell.updateUI(partyRock: partyRock)
      return cell
    }
    
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return partyRocks.count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let partyRock = partyRocks[indexPath.row]
    performSegue(withIdentifier: "VideoVC", sender: partyRock)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? VideoVC {
      if let party = sender as? PartyRock {
        destination.partyRock = party
      }
    }
  }

}














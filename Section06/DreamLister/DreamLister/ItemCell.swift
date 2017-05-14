//
//  ItemCell.swift
//  DreamLister
//
//  Created by NK on 14.05.17.
//  Copyright © 2017 Nikolay Kolesnikov. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!

    func configureCell(item: Item) {
        itemTitle.text = item.title
        price.text = "$\(item.price)"
        details.text = item.details
        thumb.image = item.toImage?.image as? UIImage
    }
}

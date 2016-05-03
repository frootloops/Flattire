//
//  ProductCell.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 03/05/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import UIKit
import Haneke

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var product: UberProduct? {
        didSet {
            if let product = product {
                label.text = product.displayName
                if let url = NSURL(string: product.image) {
                    imageView.hnk_setImageFromURL(url)
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}

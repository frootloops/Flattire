//
//  ProductCell.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 03/05/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var product: UberProduct? {
        didSet {
            if let product = product {
                label.text = product.displayName
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

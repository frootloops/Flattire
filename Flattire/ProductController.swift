//
//  ProductController.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 03/05/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import UIKit

class ProductController: UITableViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var row0: UITableViewCell!
    @IBOutlet weak var row1: UITableViewCell!
    @IBOutlet weak var row2: UITableViewCell!
    @IBOutlet weak var row3: UITableViewCell!
    @IBOutlet weak var row4: UITableViewCell!
    @IBOutlet weak var row5: UITableViewCell!
    
    var product: UberProduct?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let product = product {
            navigationItem.title = product.displayName
            row1.textLabel?.text = "Display Name"
            row1.detailTextLabel?.text = product.displayName
            row2.textLabel?.text = "Product Id"
            row2.detailTextLabel?.text = product.productId
            row3.textLabel?.text = "Short Description"
            row3.detailTextLabel?.text = product.shortDescription
            row4.textLabel?.text = "Description"
            row4.detailTextLabel?.text = product.description
            row5.textLabel?.text = "Capacity"
            row5.detailTextLabel?.text = String(product.capacity)
            if let url = NSURL(string: product.image) {
                imageView.hnk_setImageFromURL(url)
            }
        }
    }
}

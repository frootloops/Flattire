//
//  MapController.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 21/02/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func zoomIn(sender: UIButton) {
    }
    
    @IBAction func zoomOut(sender: UIButton) {
    }
    
    @IBAction func findMe(sender: UIButton) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

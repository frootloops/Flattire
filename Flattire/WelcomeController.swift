//
//  WelcomeController.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 16/04/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containverView: UIView!
    
    var welcomePageViewController: WelcomePageController? {
        didSet {
            welcomePageViewController?.welcomeDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let action = #selector(WelcomeController.didChangePageControlValue)
        pageControl.addTarget(self, action: action, forControlEvents: .ValueChanged)
    }


    @IBAction func begin(sender: UIButton) {
        
    }
    
    func didChangePageControlValue() {
        welcomePageViewController?.scrollToViewController(index: pageControl.currentPage)
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let welcomePageViewController = segue.destinationViewController as? WelcomePageController {
            self.welcomePageViewController = welcomePageViewController
        }
    }

}

extension WelcomeController: WelcomePageControllerDelegate {
    
    func welcomePageViewController(tutorialPageViewController: WelcomePageController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func welcomePageViewController(tutorialPageViewController: WelcomePageController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}


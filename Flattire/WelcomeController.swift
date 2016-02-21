//
//  WelcomeController.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 21/02/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import UIKit

class WelcomeController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    private var pages = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

        pages.append(storyboard!.instantiateViewControllerWithIdentifier("Introduction"))
        pages.append(storyboard!.instantiateViewControllerWithIdentifier("RequestLocation"))
        
        dataSource = self
        setViewControllers([pages[0]], direction: .Forward, animated: false, completion: nil)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        if let index = pages.indexOf(viewController) where index >= 1 {
            return pages[index - 1]
        }
        
        return .None
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let index = pages.indexOf(viewController) where index <= pages.count - 2 {
            return pages[index + 1]
        }
        
        return .None
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

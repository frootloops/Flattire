//
//  WelcomeController.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 21/02/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import UIKit

class WelcomePageController: UIPageViewController, UIPageViewControllerDataSource {
    private var pages = [UIViewController]()
    weak var welcomeDelegate: WelcomePageControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        pages.append(storyboard!.instantiateViewControllerWithIdentifier("Introduction"))
        pages.append(storyboard!.instantiateViewControllerWithIdentifier("Services"))
        pages.append(storyboard!.instantiateViewControllerWithIdentifier("Mates"))
        pages.append(storyboard!.instantiateViewControllerWithIdentifier("Near"))
        pages.append(storyboard!.instantiateViewControllerWithIdentifier("InPlace"))
        
        dataSource = self
        delegate = self
        setViewControllers([pages[0]],
            direction: .Forward, animated: false, completion: nil)
        
        welcomeDelegate?.welcomePageViewController(self,
            didUpdatePageCount: pages.count)
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
    

    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = pages.indexOf(firstViewController) {
            let direction: UIPageViewControllerNavigationDirection = newIndex >= currentIndex ? .Forward : .Reverse
            let nextViewController = pages[newIndex]
            scrollToViewController(nextViewController, direction: direction)
        }
    }
    
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewControllerNavigationDirection = .Forward) {
        setViewControllers([viewController], direction: direction, animated: true) { finished in
            self.notifyWelcomeDelegateOfNewIndex()
        }
    }
    
    private func notifyWelcomeDelegateOfNewIndex() {
        guard let firstViewController = viewControllers?.first,
            index = pages.indexOf(firstViewController) else { return }
        
        welcomeDelegate?.welcomePageViewController(self, didUpdatePageIndex: index)
    }

}

extension WelcomePageController: UIPageViewControllerDelegate {
    
    func pageViewController(pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                                               previousViewControllers: [UIViewController],
                                               transitionCompleted completed: Bool) {
        notifyWelcomeDelegateOfNewIndex()
    }
    
}

protocol WelcomePageControllerDelegate: class {
    
    func welcomePageViewController(welcomePageViewController: WelcomePageController,
                                    didUpdatePageCount count: Int)
    
    func welcomePageViewController(welcomePageViewController: WelcomePageController,
                                    didUpdatePageIndex index: Int)
    
}

//
//  TableViewCell.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 05/05/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    convenience init(frame: CGRect) {
        self.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        userInteractionEnabled = true
        let action = #selector(TableViewCell.showMenu(_:))
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: action))
    }
    
    func showMenu(sender: AnyObject?) {
        let menu = UIMenuController.sharedMenuController()
        if let text = detailTextLabel?.text where text.characters.count > 0 && !menu.menuVisible {
            becomeFirstResponder()
            menu.setTargetRect(bounds, inView: self)
            menu.setMenuVisible(true, animated: true)
        }
    }
    
    override func copy(sender: AnyObject?) {
        let board = UIPasteboard.generalPasteboard()
        board.string = detailTextLabel?.text  ?? ""
        let menu = UIMenuController.sharedMenuController()
        menu.setMenuVisible(false, animated: true)
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == #selector(NSObject.copy(_:)) {
            return true
        }
        return false
    }
    
    deinit {
        gestureRecognizers?.forEach { removeGestureRecognizer($0) }
    }
    
}

//
//  UITableView+Ex.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 07.12.20.
//

import UIKit

extension UITableView {
    func setNoDataPlaceholder(_ message: String) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        label.text = message
        // styling
        label.sizeToFit()
      
      self.isScrollEnabled = false
        self.backgroundView = label
       self.separatorStyle = .none
    }
    

}

extension UITableView {
    func removeNoDataPlaceholder() {
        self.isScrollEnabled = true
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

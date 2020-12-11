//
//  UITableViewCell+Extensions.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 10.12.20.
//

import Foundation
import UIKit

extension  UITableViewCell{
    @objc class var identifier: String {
        return String(describing: self)
    }
  
    func animation()  {
        UIView.animate(withDuration: 0.3, animations: {
            self.layer.transform = CATransform3DMakeScale(1.5,1.5,1.5)
               },completion: { finished in
                UIView.animate(withDuration: 0.3, animations: {
                    self.layer.transform = CATransform3DMakeScale(1,1,1)
                   // cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
                   })
           })
    }
    
}

//
//  ShadowView.swift
//  Hello Local Notification
//
//  Created by Ben Aaron on 11-26-17.
//  Copyright © 2017 Ben Aaron. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        layer.shadowPath = CGPath(rect: layer.bounds, transform: nil)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowOpacity = 1
        layer.shadowRadius = 5
        layer.cornerRadius = 5
        
    }

}

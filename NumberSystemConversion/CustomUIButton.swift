//
//  CustomUIButton.swift
//  NumberSystemConversion
//
//  Created by Rolando Ramirez on 1/7/20.
//  Copyright © 2020 Rolando Ramirez. All rights reserved.
//

import Foundation
import UIKit

class CustomUIButton : UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
}

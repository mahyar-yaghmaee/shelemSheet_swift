//
//  RoundedButton.swift
//  shelemSheet
//
//  Created by Mahyar Yaghmaee on 8/14/18.
//  Copyright © 2018 Mahyar Yaghmaee. All rights reserved.
//

import UIKit

class RoundedButton : UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // To always have it as 2 pixel border
        layer.borderWidth = 2/UIScreen.main.nativeScale
        layer.borderColor = UIColor.black.cgColor
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
    }
    
}

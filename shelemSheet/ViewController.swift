//
//  ViewController.swift
//  shelemSheet
//
//  Created by Mahyar Yaghmaee on 8/3/18.
//  Copyright © 2018 Mahyar Yaghmaee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var teamAPointsLabel:UILabel!
    @IBOutlet var teamBPointsLabel:UILabel!
    @IBOutlet var teamApointsInputtText:UITextField!
    @IBOutlet var teamBpointsInputtText:UITextField!
    
    @IBAction func showPoints(sender: AnyObject){
        teamAPointsLabel.text = teamApointsInputtText.text
        teamBPointsLabel.text = teamBpointsInputtText.text
    }
    


}


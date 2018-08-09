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
    @IBOutlet var pointsSlider: UISlider!
    
    @IBAction func showPoints(sender: AnyObject){


        let amountTeamA:String! = teamApointsInputtText.text
        print("Hello!: ", amountTeamA)
        if (Int(amountTeamA)! > 165 || Int(amountTeamA)! < 100 || Int(amountTeamA)!%5 != 0){
            //|| Int(amountTeamA)! > 100 || Int(amountTeamA)!%5 != 0
            createAlert(title: "Invalid Number", message: "CALL range : 100 to 165 (5 point slices)")
        }
        else{
            pointsSlider.value = Float(amountTeamA)!/165
            pointsSlider.isEnabled = false
            teamAPointsLabel.text = teamApointsInputtText.text
            teamBPointsLabel.text = teamBpointsInputtText.text
        }

    
    }
    

    func createAlert(title:String, message:String) -> Void {
     //   let alertUI = UIAlertController(nibName: title, bundle: message)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated:true, completion: nil)
    }

}


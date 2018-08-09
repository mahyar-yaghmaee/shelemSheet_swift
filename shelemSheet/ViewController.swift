//
//  ViewController.swift
//  shelemSheet
//
//  Created by Mahyar Yaghmaee on 8/3/18.
//  Copyright © 2018 Mahyar Yaghmaee. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var isCallTime: Bool = true // this is to show which state we are in, starting with CALL state (vs Submit Points state)
    @IBOutlet var teamAPointsLabel:UILabel!
    @IBOutlet var teamBPointsLabel:UILabel!
    @IBOutlet var teamApointsInputtText:UITextField!
    @IBOutlet var teamBpointsInputtText:UITextField!
    @IBOutlet var pointsSlider: UISlider!
    
    @IBAction func showPoints(sender: AnyObject){

        let amountTeamA:String! = teamApointsInputtText.text
        let amountTeamB:String! = teamBpointsInputtText.text
        if isCallTime{
            // only one value should be entered (teamA or teamB)
            if (amountTeamA.isEmpty == amountTeamB.isEmpty){
                createAlert(title: "Invalid CALL input", message: "Only one team should CALL")
            }
            else{
                if (isCallNumberValid(number: Int(amountTeamA)!)){
                    pointsSlider.value = Float(amountTeamA)!/165
                    pointsSlider.isEnabled = false
                    teamAPointsLabel.text = teamApointsInputtText.text
                    teamBPointsLabel.text = teamBpointsInputtText.text
                    isCallTime = !isCallTime
                }
                else{
                    createAlert(title: "Invalid Number", message: "CALL range : 100 to 165 (5 point slices)")

                }
            }
        }
    
    }
    
    func isCallNumberValid(number: Int) -> Bool {
        if (number < 170 && number > 100 && number%5 == 0){
            return true
        }
        return false
    }
    

    func createAlert(title:String, message:String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated:true, completion: nil)
    }

}


//
//  ViewController.swift
//  shelemSheet
//
//  Created by Mahyar Yaghmaee on 8/3/18.
//  Copyright © 2018 Mahyar Yaghmaee. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var gameMaxCallPoints: Int = 165
    var isCallTime: Bool = true // this is to show which state we are in, starting with CALL state (vs Submit Points state)
    @IBOutlet var teamAPointsLabel:UILabel!
    @IBOutlet var teamBPointsLabel:UILabel!
    @IBOutlet var callLabel: UILabel!
    @IBOutlet var teamApointsInputtText:UITextField!
    @IBOutlet var teamBpointsInputtText:UITextField!
    @IBOutlet var pointsSlider: UISlider!
    @IBOutlet var pointsButton: UIButton!
    @IBOutlet var progressBarValue: UIProgressView!
    var callNumber: Int = 0
    var didTeamACalled: Bool = false
    var teamAFinalPoint: Int = 0
    var teamBFinalPoint: Int = 0
    
    @IBAction func showPoints(sender: AnyObject){

        let amountTeamA:String! = teamApointsInputtText.text
        let amountTeamB:String! = teamBpointsInputtText.text
        if isCallTime{
            print("isCallTime: ", isCallTime)

           
            // only one value should be entered (teamA or teamB)
            if (amountTeamA.isEmpty == amountTeamB.isEmpty){
                createAlert(title: "Invalid CALL", message: "Only one team should CALL")
            }
            else{
                if (amountTeamA.isEmpty){
                    callNumber = Int(amountTeamB)!
                    didTeamACalled = false
                } else {
                    callNumber = Int(amountTeamA)!
                    didTeamACalled = true
                }
                
                if (isCallNumberValid(number: callNumber)){
                    print("didTeamACalled: ", didTeamACalled)
                    setSliderValue(number: callNumber, didTeamACalled: didTeamACalled)
                    setProgressBarValue(number: callNumber, didTeamACalled: didTeamACalled)
                    callLabel.text = String(callNumber)
                    
                    isCallTime = !isCallTime
                    pointsButton.setTitle("POINTS",for: .normal)
                   
                }
                else{
                    createAlert(title: "Invalid Number", message: "CALL range : 100 to 165 (5 point slices)")

                }
            }
        }
        else { // Submit point time!
            print("isCallTime: ", isCallTime)
            
            if (amountTeamA.isEmpty || amountTeamB.isEmpty){
                createAlert(title: "Invalid points", message: "Submit points for both teams")
            }
            else {
                if (!isSubmitNumberValid(number:Int(amountTeamA)!) || (!isSubmitNumberValid(number:Int(amountTeamB)!))){
                    createAlert(title: "Invalid points", message: "Points should be dividable by 5")
                }
                else {
                    teamAFinalPoint = teamAFinalPoint + Int(teamApointsInputtText.text!)!
                    teamBFinalPoint = teamBFinalPoint + Int(teamBpointsInputtText.text!)!
                    teamAPointsLabel.text = String(teamAFinalPoint)
                    teamBPointsLabel.text = String(teamBFinalPoint)
                    
                    isCallTime = !isCallTime
                    pointsButton.setTitle("CALL",for: .normal)
                }

            }
            
        }
    
    }
    
    
    func isSubmitNumberValid(number: Int) -> Bool {
        if (number%5 == 0){
            return true
        }
        return false
    }
    
    func setProgressBarValue(number: Int, didTeamACalled: Bool){
        if didTeamACalled{
            progressBarValue.progress = Float(number)/Float(gameMaxCallPoints)
        }
        else {
            progressBarValue.progress = Float(gameMaxCallPoints-number)/Float(gameMaxCallPoints)
        }
        
    }

    
    func setSliderValue(number: Int, didTeamACalled: Bool){
        if didTeamACalled{
            pointsSlider.value = Float(number)/Float(gameMaxCallPoints)
        }
        else {
            pointsSlider.value = Float(gameMaxCallPoints-number)/Float(gameMaxCallPoints)
        }
        pointsSlider.isEnabled = false
    }
    
    
    func isCallNumberValid(number: Int) -> Bool {
        if (number < 170 && number > 95 && number%5 == 0){
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


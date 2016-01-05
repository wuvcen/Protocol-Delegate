//
//  ViewController.swift
//  Protocol&Delegate
//
//  Created by 吴伟城 on 16/1/5.
//  Copyright © 2016年 cn-wu.cn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GuessDelegate {
    
    @IBOutlet weak var userGuessLabelOutlet: UILabel!
    @IBOutlet weak var outcomeLabelOutlet: UILabel!
    @IBOutlet weak var guessButtonOutlet: UIButton!
    @IBOutlet weak var replayButtonOutlet: UIButton!
    
    var previousGuess = ""
    var randomNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createRandomNumber()
        replayButtonOutlet.hidden = true
        outcomeLabelOutlet.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func replayAction(sender: AnyObject) {
        createRandomNumber()
        replayButtonOutlet.hidden = true
        guessButtonOutlet.hidden = false
        outcomeLabelOutlet.text = ""
        userGuessLabelOutlet.text = "New Game"
        previousGuess = ""
    }
    
    func createRandomNumber() {
        randomNumber = Int(arc4random_uniform(100))
        print("The random number is: \(randomNumber)")
        return
    }
    
    func userDidFinish(controller: GuessInputViewController, guess: String) {
        userGuessLabelOutlet.text = "The guess was " + guess
        previousGuess = guess
        let numberGuess = Int(guess)
        if numberGuess > randomNumber {
            outcomeLabelOutlet.text = "Guess too high."
        } else if numberGuess < randomNumber {
            outcomeLabelOutlet.text = "Guess too low."
        } else {
            outcomeLabelOutlet.text = "Guess is correct."
            replayButtonOutlet.hidden = false
            guessButtonOutlet.hidden = true
        }
        controller.navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "pushToInputView" {
            let vc = segue.destinationViewController as! GuessInputViewController
            vc.previousGuess = previousGuess
            vc.delegate = self
        }
    }
    

}


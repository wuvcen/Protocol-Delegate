//
//  GuessInputViewController.swift
//  Protocol&Delegate
//
//  Created by 吴伟城 on 16/1/5.
//  Copyright © 2016年 cn-wu.cn. All rights reserved.
//

import UIKit

protocol GuessDelegate {
    func userDidFinish(controller:GuessInputViewController, guess:String)
}

class GuessInputViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var guessLabelOutlet: UILabel!
    @IBOutlet weak var guessTextFieldOutlet: UITextField!
    
    var delegate:GuessDelegate? = nil
    var previousGuess = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if !previousGuess.isEmpty {
            guessLabelOutlet.text = "Your previous guess was \(previousGuess)"
        }
        guessTextFieldOutlet.becomeFirstResponder()
    }
    
    @IBAction func saveGuessAction(sender: AnyObject) {
        if delegate != nil {
            delegate!.userDidFinish(self, guess: guessTextFieldOutlet.text!)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

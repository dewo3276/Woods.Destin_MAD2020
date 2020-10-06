//
//  ViewController.swift
//  Cookie Counter
//
//  Created by Dusty on 10/5/20.
//  Copyright © 2020 Destin Woods. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var cookieOutlet: UITextField!
    @IBOutlet weak var numOfCookies: UILabel!
    @IBOutlet weak var numOfFriends: UILabel!
    @IBOutlet weak var cookieView: UIImageView!
    @IBOutlet weak var NumCookieOutlet: UITextField!
    @IBAction func cookieTotalCount(_ sender: UITextField) {
        if NumCookieOutlet.text!.isEmpty==false{
            let cookies=Int(NumCookieOutlet.text!)!
            if cookies>0 && cookies != 1{
                numOfCookies.text="\(cookies) cookies"
            }
            else if cookies==1{
                numOfCookies.text="1 cookie"
            }
            else{
                numOfCookies.text="# of"
            }
        }
        
    }
    @IBOutlet weak var friendsStepperOutput: UIStepper!
    @IBOutlet weak var perPerson: UILabel!
    @IBAction func friendsStepperInput(_ sender: UIStepper) {
        if friendsStepperOutput.value>0 && friendsStepperOutput.value != 1{
            numOfFriends.text="\(Int(friendsStepperOutput.value)) friends"
        }
        else if friendsStepperOutput.value==1{
            numOfFriends.text="1 friend"
        }
        else{
            numOfFriends.text="# of"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
     }
    
    @IBAction func CalculateFunc(_ sender: UIButton) {
        if cookieOutlet.text!.isEmpty == false && NumCookieOutlet.text!.isEmpty == false {
        let person=((Float(NumCookieOutlet.text!)!)/Float(friendsStepperOutput.value))
        perPerson.text=String(format: "%.2f",person) + " \(cookieOutlet.text!)"
        cookieView.isHidden=false
       }
        else if friendsStepperOutput.value==0{
            alert(title: "Friends", message: "You can't have 0 friends. Everyone has some friends")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cookieOutlet.delegate=self
        NumCookieOutlet.delegate=self
        let tap: UITapGestureRecognizer =
        UITapGestureRecognizer(target: self, action:
        #selector(self.dismissKeyboard))
         view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
    view.endEditing(true)
    }
    
    func alert (title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }

}


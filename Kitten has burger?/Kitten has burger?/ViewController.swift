//
//  ViewController.swift
//  Kitten has burger?
//
//  Created by Dusty on 9/23/20.
//  Copyright © 2020 Destin Woods. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textChange: UILabel!
    @IBOutlet weak var fontCapitlization: UILabel!
    @IBOutlet weak var fontSize: UILabel!
    @IBOutlet weak var fontChooser: UILabel!
    @IBOutlet weak var fontChoice: UIStepper!
    @IBOutlet weak var capChoice: UISwitch!
    @IBOutlet weak var fontSizeChoice: UISlider!
    @IBOutlet weak var segSlider: UISegmentedControl!
    @IBOutlet weak var canHas: UIImageView!
    
    @IBAction func canMaybeCant(_ sender: UISegmentedControl) {
        infoChange()
        CapsCheck()
    }
    
    let fontChoiceNum=["Avenir","Courier","Didot","Futura"]
    
    @IBAction func fontSize(_ sender: UISlider) {
        fontSize.text=String(format: "%0.f", sender.value)
        textChange.font=UIFont(name: fontChoiceNum[Int(fontChoice.value)], size: CGFloat(sender.value))
    }
    @IBAction func capSwitch(_ sender: UISwitch) {
        CapsCheck()
    }
    @IBAction func fontChange(_ sender: UIStepper) {
        fontCheck()
    }
    
    func infoChange()
    {
            canHas.isHidden = false
            switch segSlider.selectedSegmentIndex {
            case 0:
                canHas.image=UIImage(named: "can has")
                textChange.text = "kitten tanks you"
                break;
            case 1:
                canHas.image=UIImage(named: "maybe")
                textChange.text = "kitten conteplates your fate"
                break;
            case 2:
                canHas.image=UIImage(named: "can't has")
                textChange.text = "you will face wrath of kitten"
                break;
            default:
                canHas.isHidden=true
            }
    }
    
    func fontCheck()
    {
        switch fontChoice.value {
        case 0: fontSize.font=UIFont(name: fontChoiceNum[0], size: CGFloat(fontSizeChoice.value))
        textChange.font=UIFont(name: fontChoiceNum[0], size: CGFloat(fontSizeChoice.value))
        fontCapitlization.font=UIFont(name: fontChoiceNum[0], size: CGFloat(fontSizeChoice.value))
        fontChooser.font=UIFont(name: fontChoiceNum[0], size: CGFloat(fontSizeChoice.value))
            break;
        case 1: fontSize.font=UIFont(name: fontChoiceNum[1], size: CGFloat(fontSizeChoice.value))
        textChange.font=UIFont(name: fontChoiceNum[1], size: CGFloat(fontSizeChoice.value))
        fontCapitlization.font=UIFont(name: fontChoiceNum[1], size: CGFloat(fontSizeChoice.value))
        fontChooser.font=UIFont(name: fontChoiceNum[1], size: CGFloat(fontSizeChoice.value))
            break;
        case 2: fontSize.font=UIFont(name: fontChoiceNum[2], size: CGFloat(fontSizeChoice.value))
        textChange.font=UIFont(name: fontChoiceNum[2], size: CGFloat(fontSizeChoice.value))
        fontCapitlization.font=UIFont(name: fontChoiceNum[2], size: CGFloat(fontSizeChoice.value))
        fontChooser.font=UIFont(name: fontChoiceNum[2], size: CGFloat(fontSizeChoice.value))
            break;
        case 3: fontSize.font=UIFont(name: fontChoiceNum[3], size: CGFloat(fontSizeChoice.value))
        textChange.font=UIFont(name: fontChoiceNum[3], size: CGFloat(fontSizeChoice.value))
        fontCapitlization.font=UIFont(name: fontChoiceNum[3], size: CGFloat(fontSizeChoice.value))
        fontChooser.font=UIFont(name: fontChoiceNum[3], size: CGFloat(fontSizeChoice.value))
            break;
        default: fontSize.font=UIFont.systemFont(ofSize: CGFloat(fontSizeChoice.value))
        textChange.font=UIFont.systemFont(ofSize: CGFloat(fontSizeChoice.value))
        fontCapitlization.font=UIFont.systemFont(ofSize: CGFloat(fontSizeChoice.value))
        fontChooser.font=UIFont.systemFont(ofSize: CGFloat(fontSizeChoice.value))
            
        }
    }
    
    func CapsCheck()
    {
        if capChoice.isOn
        {
            textChange.text=textChange.text?.uppercased()
        }
        else
        {
            textChange.text=textChange.text?.lowercased()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


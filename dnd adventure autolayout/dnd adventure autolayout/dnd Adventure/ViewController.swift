//
//  ViewController.swift
//  daVinci
//
//  Created by Aileen Pierce
//  Copyright © Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dndImage: UIImageView!
    @IBOutlet weak var labelChange: UILabel!
    
    @IBAction func chooseArt(_ sender: UIButton) {
        if sender.tag == 1 {
            dndImage.image=UIImage(named: "griffin")
            labelChange.text="You chose to fight the griffin!"
        }
        else if sender.tag == 2 {
            dndImage.image=UIImage(named: "dragon")
            labelChange.text="You chose to fight the dragon!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


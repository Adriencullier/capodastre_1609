//
//  CapodastreViewController.swift
//  capodastreUIKIT
//
//  Created by Adrien Cullier on 29/06/2021.
//

import UIKit

class CapodastreViewController: UIViewController {
    
    @IBOutlet weak var capoLabel: UILabel!
    
    @IBOutlet weak var capoStepperOutlet: UIStepper!
    
    @IBAction func capoStepper(_ sender: Any) {
        capoLabel.text = Int(capoStepperOutlet.value).description
    }
    @IBAction func backCapodastreVC (segue : UIStoryboardSegue){
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}

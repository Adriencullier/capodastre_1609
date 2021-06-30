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
       
        displayTransposedNotes(capo: Int(capoStepperOutlet.value))
        
        
    }
    
    
    @IBOutlet weak var labelTransposeNotes: UILabel!
    
    
    @IBAction func backCapodastreVC (segue : UIStoryboardSegue){
      displayNotesChoose()
        displayTransposedNotes(capo: Int(capoStepperOutlet.value))

    }
    
    
    
   
    
    @IBOutlet weak var labelNotesChoose: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayNotesChoose()
        displayTransposedNotes(capo: Int(capoStepperOutlet.value))
    }
    
    func displayNotesChoose(){
    var textTot = ""
    labelNotesChoose.text = textTot
    for element in NotesGestion.shared.notesChoose {
        
        textTot += "\(element)        "
        
        labelNotesChoose.text = textTot
    }

   

}
    func displayTransposedNotes(capo : Int){
    var textTot = ""
    labelTransposeNotes.text = textTot
    for element in NotesGestion.shared.notesChoose {
        
        textTot += "\(NotesGestion.shared.transpose(note: element, capo: capo))        "
        
        labelTransposeNotes.text = textTot
    }

   

}
}

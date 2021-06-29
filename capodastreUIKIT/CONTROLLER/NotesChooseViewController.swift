//
//  NotesChooseViewController.swift
//  capodastreUIKIT
//
//  Created by Adrien Cullier on 29/06/2021.
//

import UIKit

class NotesChooseViewController: UIViewController {


    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var majorNotesCollectionV: UICollectionView!
    
    @IBOutlet weak var minorNotesCollectionV: UICollectionView!
    
    @IBOutlet weak var labelNotesChoose: UILabel!
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayNotesChoose()
       
        
        
        
    }
    

    

}

extension NotesChooseViewController : UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NotesGestion.shared.majorNoteArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let majorNote = NotesGestion.shared.majorNoteArray[indexPath.item]
        
        let minorNote = NotesGestion.shared.minorNoteArray[indexPath.item]
        
        
        guard let majorNoteCell = majorNotesCollectionV.dequeueReusableCell(withReuseIdentifier: "MajorNoteToChooseCell", for: indexPath) as? MajorNotesCollectionViewCell else {return UICollectionViewCell()}
       
        majorNoteCell.buttonMajorNotesToChoose.setTitle(majorNote.name, for: .normal)
        
        guard let minorNoteCell = minorNotesCollectionV.dequeueReusableCell(withReuseIdentifier: "MinorNoteToChooseCell", for: indexPath) as? MinorNotesCollectionViewCell else {return UICollectionViewCell()}
        
        
        
        minorNoteCell.buttonMinorNotesToChoose.setTitle(minorNote.name, for: .normal)
        
        minorNoteCell.buttonMinorNotesToChoose.addTarget(self, action: #selector(printSomething), for: .touchUpInside)
        
        if collectionView.tag == 1 {
            return majorNoteCell
        }
        else  {
            return minorNoteCell
        }
        
        
        
        
    }
    
    func displayNotesChoose(){
    var textTot = ""
    labelNotesChoose.text = textTot
    for element in NotesGestion.shared.notesChoose {
        
        textTot += " \(element)"
        
        labelNotesChoose.text = textTot
    }
    }
    
    @objc func printSomething(sender : UIButton) {
        NotesGestion.shared.chooseNote(note: sender.title(for: .normal)!)
        print (NotesGestion.shared.notesChoose)
        labelNotesChoose.reloadInputViews()
        displayNotesChoose()
    }
   
 
    
    
}

extension NotesChooseViewController : UICollectionViewDelegate {
    
   
   
    
    
    
}

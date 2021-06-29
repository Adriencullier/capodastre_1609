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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        
        
        if collectionView.tag == 1 {
            return majorNoteCell
        }
        else  {
            return minorNoteCell
        }
        
        
        
        
    }
    
    
}

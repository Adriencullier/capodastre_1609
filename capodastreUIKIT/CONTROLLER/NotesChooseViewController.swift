//
//  NotesChooseViewController.swift
//  capodastreUIKIT
//
//  Created by Adrien Cullier on 29/06/2021.
//

import UIKit

class NotesChooseViewController: UIViewController {

    @IBOutlet weak var notesToChooseViewContainer: UIView!
    @IBOutlet weak var notesChooseViewContainer: UIView!
    @IBOutlet weak var notesChooseCollectionView: UICollectionView!
    @IBOutlet weak var segmentedControlNotesToChoose: UISegmentedControl!
    
    @IBOutlet weak var noteToChooseCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        noteToChooseCollectionView.backgroundColor = .clear
        notesChooseCollectionView.backgroundColor = .clear
        notesChooseViewContainer.backgroundColor = UIColor(red: 92/250, green: 142/250, blue: 200/250, alpha: 0.3)
        notesChooseViewContainer.layer.cornerRadius = 20
        
        notesToChooseViewContainer.backgroundColor = UIColor(red: 243/250, green: 134/250, blue: 148/250, alpha: 0.3)
        notesToChooseViewContainer.layer.cornerRadius = 20
        
        let notesChooseNameArray = UserDefaults.standard.object(forKey: "notesChooseName") as? [String] ?? [""]
        guard  NotesGestion.shared.notesChoose.count < 8
        else {
            return
        }
        NotesGestion.shared.notesChoose.removeAll()
        for element in notesChooseNameArray{
            NotesGestion.shared.notesChoose.append(Note(name: element))}
        
        
        
    }
    
    @IBAction func segmentedAction(_ sender: Any) {
        noteToChooseCollectionView.reloadData()
    }
    
    @IBAction func delButton(_ sender: Any) {
        NotesGestion.shared.delLastNote()
        notesChooseCollectionView.reloadData()
    }
    
    @IBAction func validateButton(_ sender: Any) {
        var noteChooseNameArray = [String]()
        for note in NotesGestion.shared.notesChoose {
            noteChooseNameArray.append(note.name)
        }
        UserDefaults.standard.setValue(noteChooseNameArray, forKey: "notesChooseName")
    }
    
}

extension NotesChooseViewController : UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1 {
            
            return NotesGestion.shared.notesChoose.count
        }
        else if collectionView.tag == 2 {
            return 12
        }
        else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            let notesChoose = notesChooseCollectionView.dequeueReusableCell(withReuseIdentifier: "chooseCell", for: indexPath) as! NotesChooseCustomCell
            
            notesChoose.backgroundColor = .clear
            
            notesChoose.notesChooseTextView.text = NotesGestion.shared.notesChoose[indexPath.item].name
            return notesChoose
        }
       
        if collectionView.tag == 2 {
        let cellNotesToChoose = noteToChooseCollectionView.dequeueReusableCell(withReuseIdentifier: "NoteToChooseCell", for: indexPath) as! NoteToChooseCustomCell
        cellNotesToChoose.backgroundColor = .clear
        
        if segmentedControlNotesToChoose.selectedSegmentIndex == 0 {
            cellNotesToChoose.textView.text = NotesGestion.shared.majorNoteArray[indexPath.item].name
        }
        else if segmentedControlNotesToChoose.selectedSegmentIndex == 1 {
            cellNotesToChoose.textView.text = NotesGestion.shared.minorNoteArray[indexPath.item].name
        }
        else if segmentedControlNotesToChoose.selectedSegmentIndex == 2 {
            cellNotesToChoose.textView.text = NotesGestion.shared.maj7NoteArray[indexPath.item].name
        }
        else if segmentedControlNotesToChoose.selectedSegmentIndex == 3 {
            cellNotesToChoose.textView.text = NotesGestion.shared.min7NoteArray[indexPath.item].name
        }
        else {
            cellNotesToChoose.textView.text = "Error"
        }
            return cellNotesToChoose
        }
        
        
        else {
            let cellNotesToChoose = noteToChooseCollectionView.dequeueReusableCell(withReuseIdentifier: "NoteToChooseCell", for: indexPath) as! NoteToChooseCustomCell
            cellNotesToChoose.textView.text = "Error"
            return cellNotesToChoose
        }
    }
    

   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
       
       if collectionView.tag == 2 {
            if segmentedControlNotesToChoose.selectedSegmentIndex == 0 {
                NotesGestion.shared.chooseNote(note: NotesGestion.shared.majorNoteArray[indexPath.item])
                notesChooseCollectionView.reloadData()
            }
            else if segmentedControlNotesToChoose.selectedSegmentIndex == 1 {
                NotesGestion.shared.chooseNote(note: NotesGestion.shared.minorNoteArray[indexPath.item])
                notesChooseCollectionView.reloadData()

            }
            else if segmentedControlNotesToChoose.selectedSegmentIndex == 2 {
                NotesGestion.shared.chooseNote(note: NotesGestion.shared.maj7NoteArray[indexPath.item])
                notesChooseCollectionView.reloadData()

            }
            else if segmentedControlNotesToChoose.selectedSegmentIndex == 3 {
                NotesGestion.shared.chooseNote(note: NotesGestion.shared.min7NoteArray[indexPath.item])
                notesChooseCollectionView.reloadData()

            }
            else {
                print("Error")
            }
            
        }
        else {
            print("error")
        }
       
    }
    
    
}

extension NotesChooseViewController : UICollectionViewDelegate {
    
  
    
    
    
}

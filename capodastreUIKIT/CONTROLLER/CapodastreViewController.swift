//
//  CapodastreViewController.swift
//  capodastreUIKIT
//
//  Created by Adrien Cullier on 29/06/2021.
//

import UIKit

class CapodastreViewController: UIViewController {
    

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var capoLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var capoStepperOutlet: UIStepper!
    
    @IBOutlet weak var viewContainer: UIView!
    
    
    
   
    
    
    @IBAction func backCapodastreVC (segue : UIStoryboardSegue){
        collectionView.reloadData()
    }
    
    
    
   
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewContainer.backgroundColor = UIColor(red: 92/250, green: 142/250, blue: 200/250, alpha: 0.3)
        viewContainer.layer.cornerRadius = 20
        
        collectionView.backgroundColor = .clear
        
        capoStepperOutlet.value = 1
        capoLabel.text = "Capodastre : \(Int(capoStepperOutlet.value))"
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = UIColor(red: 92/250, green: 142/250, blue: 200/250, alpha: 1)
        capoLabel.isHidden = true
        capoStepperOutlet.isHidden = true
        collectionView.reloadData()
        
        
        
        
        
       
    }
    
    @IBAction func capoStepper(_ sender: Any) {
        
        capoLabel.text = "Capodastre : \(Int(capoStepperOutlet.value))"
        collectionView.reloadData()
       
        
    }
    
    @IBAction func segmentedControlAction(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0 {
            capoLabel.isHidden = true
            capoStepperOutlet.isHidden = true
            collectionView.reloadData()
            segmentedControl.selectedSegmentTintColor = UIColor(red: 92/250, green: 142/250, blue: 200/250, alpha: 1)
            viewContainer.backgroundColor = UIColor(red: 92/250, green: 142/250, blue: 200/250, alpha: 0.3)
            
           
        }
        else if segmentedControl.selectedSegmentIndex == 1 {
            capoLabel.isHidden = false
            capoStepperOutlet.isHidden = false
            collectionView.reloadData()
            segmentedControl.selectedSegmentTintColor = UIColor(red: 243/250, green: 134/250, blue: 148/250, alpha: 1)
            viewContainer.backgroundColor = UIColor(red: 243/250, green: 134/250, blue: 148/250, alpha: 0.3)
           
            
            
        }
    }
    

}

extension CapodastreViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        let notesChooseNameArray = UserDefaults.standard.object(forKey: "notesChooseName") as? [String]
        return notesChooseNameArray?.count ?? 0
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if segmentedControl.selectedSegmentIndex == 0 {
        let notesChooseNameArray = UserDefaults.standard.object(forKey: "notesChooseName") as! [String]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CapodastreCustomCell
        
        cell.backgroundColor = .clear
        cell.textView.text = notesChooseNameArray[indexPath.item]
        
        
        return cell
    }
        else if segmentedControl.selectedSegmentIndex == 1 {
            let notesChooseNameArray = UserDefaults.standard.object(forKey: "notesChooseName") as! [String]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CapodastreCustomCell
            
            cell.backgroundColor = .clear
            cell.textView.text = NotesGestion.shared.transpose(note: notesChooseNameArray[indexPath.item], capo: Int(capoStepperOutlet.value))
            
            
            return cell
        }
        else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CapodastreCustomCell
            return cell
        }
        
    }
}

extension CapodastreViewController : UICollectionViewDelegate {}

   


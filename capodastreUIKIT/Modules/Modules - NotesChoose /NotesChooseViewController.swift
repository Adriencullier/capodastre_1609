//
//  NotesChooseViewController.swift
//  capodastreUIKIT
//
//  Created by Adrien Cullier on 29/06/2021.
//

import UIKit

class NotesChooseViewController: UIViewController {
    
    private var notesChooseViewModel : NotesChooseViewModel
    init (notesChooseViewModel : NotesChooseViewModel) {
        self.notesChooseViewModel = notesChooseViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var delegate : ViewControllersDelegate?
    private var notesChooseView : NotesChooseView!


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        notesChooseView.collectionView.delegate = self
        notesChooseView.collectionView.dataSource = self
        
}
    private func setupView() {
        
        notesChooseView = NotesChooseView(frame: view.frame)
        notesChooseView?.configureNotesChooseView(notesChooseViewModel)
        view.addSubview(notesChooseView)
        
        notesChooseView.segmentedControl.addTarget(self, action: #selector(segmentedControlIndexChange), for: .valueChanged)
        notesChooseView.deleteButton.addTarget(self, action: #selector(deleteLastNote), for: .touchUpInside)
        notesChooseView.validateButton.addTarget(self, action: #selector(validateButtonTapped), for: .touchUpInside)


    }
    @objc func segmentedControlIndexChange() {
        print (notesChooseView.segmentedControl.selectedSegmentIndex)
        notesChooseViewModel.segmentedControlSelectedIndex = notesChooseView.segmentedControl.selectedSegmentIndex
        reloadView()
    }
    @objc func deleteLastNote() {
        notesChooseViewModel.removeLastNote()
        reloadView()
    }
    @objc func validateButtonTapped() {
        delegate?.validateButtonTapped(notesChooseViewModel.selectedNotes)
        reloadView()
    }
    public func reloadView() {
        notesChooseView?.configureNotesChooseView(notesChooseViewModel)
        view.addSubview(notesChooseView)
        notesChooseView.collectionView.reloadData()
    }
}

extension NotesChooseViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        notesChooseViewModel.selectNote(notesChooseViewModel.notesToSelect[indexPath.item])
        reloadView()
    }
}

extension NotesChooseViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return notesChooseViewModel.notesToSelect.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = notesChooseView.collectionView.dequeueReusableCell(withReuseIdentifier: "NoteChooseCustomCVCell", for: indexPath) as! NoteChooseCustomCVCell
        
        cell.configureCell(notesChooseViewModel.notesToSelect[indexPath.item])
        
        return cell
        
        
        
    }
    
    
}

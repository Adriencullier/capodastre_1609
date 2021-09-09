//
//  NotesChooseView.swift
//  NotesChooseView
//
//  Created by Adrien Cullier on 09/09/2021.
//

import Foundation
import UIKit

class NotesChooseView : UIView {
    
    
    public let selectedNotes : UITextView = {
        let selectedNotes = UITextView()
        selectedNotes.backgroundColor = .clear
        selectedNotes.layer.cornerRadius = 10
        selectedNotes.layer.borderWidth = 2
        selectedNotes.layer.borderColor = UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00).cgColor
        selectedNotes.isUserInteractionEnabled = false
        selectedNotes.isScrollEnabled = false
        selectedNotes.textAlignment = .center
        selectedNotes.font = UIFont(name: "arial", size: 17)
        return selectedNotes
    }()
    
    public let deleteButton : UIButton = {
        let deleteButton = UIButton()
        deleteButton.setImage(UIImage(systemName: "delete.left"), for: .normal)
        deleteButton.backgroundColor = UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00)
        deleteButton.layer.cornerRadius = 5
        deleteButton.tintColor = .white
        return deleteButton
    }()
    
    public let segmentedControl : UISegmentedControl = {
        let items = ["maj", "maj7", "min", "min7"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = .white
        segmentedControl.selectedSegmentTintColor = UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00)
        
        return segmentedControl
    }()

    public let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(NoteChooseCustomCVCell.self, forCellWithReuseIdentifier: "NoteChooseCustomCVCell")
        collectionView.backgroundColor = .clear
        collectionView.layer.cornerRadius = 5
        return collectionView
    }()
    
    public lazy var validateButton : UIButton = {
        let validateButton = UIButton()
        validateButton.setTitle("valider", for: .normal)
        validateButton.backgroundColor = UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00)
        validateButton.layer.cornerRadius = 10
        validateButton.setTitleColor(.white, for: .normal)
        return validateButton
    }()
    
    
    override init (frame : CGRect) {
        super.init(frame: frame)
       
        addSubview(selectedNotes)
        addSubview(deleteButton)
        addSubview(segmentedControl)
        addSubview(collectionView)
        addSubview(validateButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureNotesChooseView (_ viewModel : NotesChooseViewModel) {
        setupConstraints ()
        
        selectedNotes.text = viewModel.stringSelectedNotes
        self.backgroundColor = .white
    }
    
    private func setupConstraints () {
        selectedNotes.anchor(
            top: self.topAnchor,
            bottom: nil,
            leading: self.leadingAnchor,
            trailing: self.trailingAnchor,
            padding: .init(top: 30, left: 20, bottom: 0, right: 20),
            size: CGSize(width: 0, height: 60))
        selectedNotes.centerAnchor(
            centerX: self.centerXAnchor,
            centerY: nil)
        
        deleteButton.anchor(
            top: nil,
            bottom: nil,
            leading: nil,
            trailing: selectedNotes.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 10),
            size: CGSize(width: 35, height: 35))
        deleteButton.centerAnchor(
            centerX: nil,
            centerY: selectedNotes.centerYAnchor)
        
        segmentedControl.anchor(
            top: nil,
            bottom: collectionView.topAnchor,
            leading: self.leadingAnchor,
            trailing: self.trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 10, right: 20))
        segmentedControl.centerAnchor(
            centerX: self.centerXAnchor,
            centerY: nil)
        
        collectionView.anchor(
            top: nil,
            bottom: nil,
            leading: self.leadingAnchor,
            trailing: self.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: CGSize(width: 0, height: 270))
        collectionView.centerAnchor(
            centerX: self.centerXAnchor,
            centerY: self.centerYAnchor)
        
        validateButton.anchor(
            top: collectionView.bottomAnchor,
            bottom: nil,
            leading: self.leadingAnchor,
            trailing: self.trailingAnchor,
            padding: .init(top: 10, left: 20, bottom: 0, right: 20),
            size: CGSize(width: 0, height: 40))
        validateButton.centerAnchor(
            centerX: self.centerXAnchor,
            centerY: nil)
    }
    
    
}

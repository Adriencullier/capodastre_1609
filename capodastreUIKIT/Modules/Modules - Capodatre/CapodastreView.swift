//
//  CapodastreView.swift
//  CapodastreView
//
//  Created by Adrien Cullier on 08/09/2021.
//

import Foundation
import UIKit

class CapodastreView : UIView {
    
    
    public let selectNotesButton : UIButton = {
        let selectNotesButton = UIButton()
        selectNotesButton.backgroundColor = .blue
        selectNotesButton.tintColor = .white
        selectNotesButton.setImage(UIImage(systemName: "music.note.list"), for: .normal)
        selectNotesButton.layer.cornerRadius = 5
        return selectNotesButton
    }()
    
    public let segmentedControl : UISegmentedControl = {
        let items = ["tonalité originale", "transposition"]
        let segmentedControl = UISegmentedControl(items: items)
        return segmentedControl
    }()
    
    public let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(CustomCVCell.self, forCellWithReuseIdentifier: "CustomCVCell")
        collectionView.backgroundColor = .clear
        collectionView.layer.cornerRadius = 5
        return collectionView
    }()
    
    public lazy var transpositionLabel : UILabel = {
        let transpositionLabel = UILabel()
        transpositionLabel.text = Int(transpositionStepper.value).description
        transpositionLabel.textAlignment = .center
        return transpositionLabel
    }()
    
    public let transpositionStepper : UIStepper = {
        let transpositionStepper = UIStepper()
        transpositionStepper.minimumValue = 0
        transpositionStepper.maximumValue = 12
        return transpositionStepper
    }()
    
    override init (frame : CGRect) {
        super.init(frame: frame)
       
        addSubview(selectNotesButton)
        addSubview(segmentedControl)
        addSubview(collectionView)
        addSubview(transpositionLabel)
        addSubview(transpositionStepper)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCapodastreView (_ viewModel : CapodastreViewModel) {
        self.backgroundColor = .white
        setupConstraints ()
    }
    
    private func setupConstraints () {
        selectNotesButton.anchor(
            top: self.topAnchor,
            bottom: nil,
            leading: nil,
            trailing: self.trailingAnchor,
            padding: .init(top: 30, left: 0, bottom: 0, right: 20),
            size: CGSize(width: 45, height: 45))
        
        segmentedControl.anchor(
            top: nil,
            bottom: collectionView.topAnchor,
            leading: nil,
            trailing: nil,
            padding: .init(top: 0, left: 0, bottom: 10, right: 0) )
        segmentedControl.centerAnchor(
            centerX: self.centerXAnchor,
            centerY: nil)
        
        transpositionLabel.anchor(
            top: collectionView.bottomAnchor,
            bottom: nil,
            leading: nil,
            trailing: nil,
            padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        transpositionLabel.centerAnchor(
            centerX: self.centerXAnchor,
            centerY: nil)
        
        transpositionStepper.anchor(
            top: transpositionLabel.bottomAnchor,
            bottom: nil,
            leading: nil,
            trailing: nil,
            padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        transpositionStepper.centerAnchor(
            centerX: self.centerXAnchor,
            centerY: nil)
        
        collectionView.anchor(top: nil, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 135))
        collectionView.centerAnchor(
            centerX: self.centerXAnchor,
            centerY: self.centerYAnchor)
    }
    
    
}

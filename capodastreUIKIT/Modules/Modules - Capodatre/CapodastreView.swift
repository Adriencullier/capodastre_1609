//
//  CapodastreView.swift
//  CapodastreView
//
//  Created by Adrien Cullier on 08/09/2021.
//

import Foundation
import UIKit

class CapodastreView : UIView {
    
    
    private var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Capodastre"
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00)
        titleLabel.font = UIFont(name: "arial", size: 50)
        return titleLabel
    }()
    
    public let selectNotesButton : UIButton = {
        let selectNotesButton = UIButton()
        selectNotesButton.backgroundColor = UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00)
        selectNotesButton.tintColor = .white
        selectNotesButton.setTitle("+", for: .normal)
        selectNotesButton.layer.cornerRadius = 23
        return selectNotesButton
    }()

    public let viewContainer : UIView =  {
        let viewContainer = UIView()

        viewContainer.backgroundColor = .clear
        viewContainer.layer.cornerRadius = 10
        viewContainer.layer.borderWidth = 2
        viewContainer.layer.borderColor = UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00).cgColor
        viewContainer.layer.opacity = 0.7
        return viewContainer
    }()
    
    public let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(CustomCVCell.self, forCellWithReuseIdentifier: "CustomCVCell")
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    public lazy var transpositionLabel : UILabel = {
        let transpositionLabel = UILabel()
        transpositionLabel.text = Int(transpositionStepper.value).description
        transpositionLabel.textAlignment = .center
        transpositionLabel.textColor = .black
        return transpositionLabel
    }()
    
    public let transpositionStepper : UIStepper = {
        let transpositionStepper = UIStepper()
        transpositionStepper.minimumValue = 0
        transpositionStepper.maximumValue = 12
        transpositionStepper.backgroundColor = UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00)
        transpositionStepper.tintColor = .white
        transpositionStepper.setDecrementImage(UIImage(systemName: "minus"), for: .normal)
        transpositionStepper.setIncrementImage(UIImage(systemName: "plus"), for: .normal)
        transpositionStepper.layer.cornerRadius = 10
        return transpositionStepper
    }()
    
    override init (frame : CGRect) {
        super.init(frame: frame)
       
        addSubview(titleLabel)
        addSubview(viewContainer)
        addSubview(selectNotesButton)
        addSubview(collectionView)
        addSubview(transpositionLabel)
        addSubview(transpositionStepper)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCapodastreView (_ viewModel : CapodastreViewModel) {
        setupConstraints ()
        self.backgroundColor = .white
        
        guard viewModel.capoNumber != 0 && viewModel.capoNumber != 12  else {
            self.transpositionLabel.text = "Tonalité originale"
            return
        }
        transpositionLabel.text = "Capo : \(viewModel.capoNumber.description)"

    }
    
    private func setupConstraints () {
        titleLabel.anchor(
            top: self.topAnchor,
            bottom: nil,
            leading: self.leadingAnchor,
            trailing: self.trailingAnchor,
            padding: .init(top: 60, left: 0, bottom: 0, right: 0))
        titleLabel.centerAnchor(
            centerX: self.centerXAnchor,
            centerY: nil)
        
        selectNotesButton.anchor(
            top: viewContainer.bottomAnchor,
            bottom: nil,
            leading: nil,
            trailing: nil,
            padding: .init(top: 20, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 45, height: 45))
        selectNotesButton.centerAnchor(
            centerX: self.centerXAnchor,
            centerY: nil)
        
        transpositionLabel.anchor(
            top: nil,
            bottom: transpositionStepper.topAnchor,
            leading: nil,
            trailing: nil,
            padding: .init(top: 0, left: 0, bottom: 10, right: 0))
        transpositionLabel.centerAnchor(
            centerX: self.centerXAnchor,
            centerY: nil)
        
        transpositionStepper.anchor(
            top: nil,
            bottom: collectionView.topAnchor,
            leading: nil,
            trailing: nil,
            padding: .init(top: 0, left: 0, bottom: 20, right: 0))
        transpositionStepper.centerAnchor(
            centerX: self.centerXAnchor,
            centerY: nil)
        
        viewContainer.anchor(
            top: collectionView.topAnchor,
            bottom: collectionView.bottomAnchor,
            leading: collectionView.leadingAnchor,
            trailing: collectionView.trailingAnchor)
        
        collectionView.anchor(
            top: self.centerYAnchor,
            bottom: nil,
            leading: self.leadingAnchor,
            trailing: self.trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20),
            size: CGSize(width: 0, height: 135))
        collectionView.centerAnchor(
            centerX: self.centerXAnchor,
            centerY: nil)
    }
    
    
}

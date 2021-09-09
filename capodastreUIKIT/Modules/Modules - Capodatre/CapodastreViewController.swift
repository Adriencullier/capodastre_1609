//
//  CapodastreViewController.swift
//  capodastreUIKIT
//
//  Created by Adrien Cullier on 29/06/2021.
//

import UIKit

class CapodastreViewController: UIViewController {
    

    private var capodastreViewModel : CapodastreViewModel
    init (capodastreViewModel : CapodastreViewModel) {
        self.capodastreViewModel = capodastreViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var capodastreView : CapodastreView!
    public var delegate : ViewControllersDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        capodastreView.collectionView.delegate = self
        capodastreView.collectionView.dataSource = self
    }
    

    private func setupView() {
        
        capodastreView = CapodastreView(frame: view.frame)
        capodastreView?.configureCapodastreView(capodastreViewModel)
        view.addSubview(capodastreView)

        
        capodastreView.transpositionStepper.addTarget(self, action: #selector(stepperTapped), for: .touchUpInside)
        
        capodastreView.selectNotesButton.addTarget(self, action: #selector(selectNotesButtonTapped), for: .touchUpInside)

    }
    
    @objc func stepperTapped() {
        capodastreViewModel.capoNumber =  Int(capodastreView.transpositionStepper.value)
        
        reloadView()
    }
    
    @objc func selectNotesButtonTapped() {
        print("Tapped")
        delegate?.plusButtonTapped()
        
    }
    
    
    public func reloadView() {
        capodastreView?.configureCapodastreView(capodastreViewModel)
        view.addSubview(capodastreView)
        capodastreView.collectionView.reloadData()
    }
    
}

extension CapodastreViewController  : UICollectionViewDelegate {
    
}

extension CapodastreViewController  : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        capodastreViewModel.transposedNotes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = capodastreView.collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCVCell", for: indexPath) as! CustomCVCell
        cell.configureCell(capodastreViewModel.transposedNotes[indexPath.item])
        return cell
        
    }
    
    
}


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
    

    private func setupView()
    {
        capodastreView = CapodastreView(frame: view.frame)
        capodastreView?.configureCapodastreView(capodastreViewModel)
        view.addSubview(capodastreView)
        capodastreView.transpositionStepper.addTarget(self, action: #selector(stepperTapped), for: .touchUpInside)
    }
    
    @objc func stepperTapped() {
        capodastreView.transpositionLabel.text =  Int(capodastreView.transpositionStepper.value).description
        reloadView()
        
    }
    private func reloadView() {
        capodastreView?.configureCapodastreView(capodastreViewModel)
        view.addSubview(capodastreView)
    }
    
}

extension CapodastreViewController  : UICollectionViewDelegate {
    
}

extension CapodastreViewController  : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        capodastreViewModel.selectedNotes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = capodastreView.collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCVCell", for: indexPath) as! CustomCVCell
        cell.configureCell(capodastreViewModel.selectedNotes[indexPath.item])
        return cell
        
    }
    
    
}


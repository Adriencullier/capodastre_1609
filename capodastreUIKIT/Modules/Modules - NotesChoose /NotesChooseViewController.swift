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


    override func viewDidLoad() {
        super.viewDidLoad()
        
}
}

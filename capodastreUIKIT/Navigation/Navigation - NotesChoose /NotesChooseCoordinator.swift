//
//  NotesChooseCoordinator.swift
//  NotesChooseCoordinator
//
//  Created by Adrien Cullier on 08/09/2021.
//

import Foundation
import UIKit

class NotesChooseCoordinator : Coordinator {
    
    lazy var notesChooseViewController : NotesChooseViewController = {
        let notesChooseViewController = NotesChooseViewController(notesChooseViewModel: NotesChooseViewModel(dataStore: dataStore))
        notesChooseViewController.delegate = self
        return notesChooseViewController
    }()
    
    var navigationController: UINavigationController
    var dataStore: NotesDataStore
    init(navigationController: UINavigationController, dataStore: NotesDataStore) {
        self.navigationController = navigationController
        self.dataStore = dataStore
    }
    
    public var delegate : CoordinatorDelegate?

    
    func start() {
        
    }
    
    
}

extension NotesChooseCoordinator : ViewControllersDelegate {
    
}

//
//  AppCoordinator.swift
//  AppCoordinator
//
//  Created by Adrien Cullier on 08/09/2021.
//

protocol Coordinator {
    var navigationController : UINavigationController {get}
    var dataStore : NotesDataStore {get}
    func start ()
}

import Foundation
import UIKit

class AppCoordinator : Coordinator {
    
    lazy var dataStore: NotesDataStore = {
        let dataStore = NotesDataStore()
        return dataStore
    }()
    
    lazy var capodastreCoordinator : CapodastreCoordinator = {
        let capodastreCoordinator = CapodastreCoordinator(navigationController: navigationController, dataStore: dataStore)
        capodastreCoordinator.delegate = self
        return capodastreCoordinator
    }()
    
    lazy var notesChooseCoordinator : NotesChooseCoordinator = {
        let notesChooseCoordinator = NotesChooseCoordinator(navigationController: navigationController, dataStore: dataStore)
        notesChooseCoordinator.delegate = self
        return notesChooseCoordinator
    }()
    
    var navigationController: UINavigationController
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        capodastreCoordinator.start()
    }
    
    
}

extension AppCoordinator : CoordinatorDelegate {
    
}

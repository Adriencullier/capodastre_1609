//
//  AppCoordinator.swift
//  AppCoordinator
//
//  Created by Adrien Cullier on 08/09/2021.
//

import Foundation
import UIKit

// Define the protocol for each coordinator
protocol Coordinator {
    var navigationController : UINavigationController {get}
    /// Each coordinator needs the dataStore variable to be instantiated
    var dataStore : NotesDataStore {get}
    func start ()
}

// The main coordinator application 
class AppCoordinator : Coordinator {
    /// Get the dataStore variable
    lazy var dataStore: NotesDataStore = {
        let dataStore = NotesDataStore()
        return dataStore
    }()
    /// Instantiate CapodastreCoordinator
    lazy var capodastreCoordinator : CapodastreCoordinator = {
        let capodastreCoordinator = CapodastreCoordinator(navigationController: navigationController, dataStore: dataStore)
        capodastreCoordinator.delegate = self
        return capodastreCoordinator
    }()
    /// Instantiate NotesChooseCoordinator
    lazy var notesChooseCoordinator : NotesChooseCoordinator = {
        let notesChooseCoordinator = NotesChooseCoordinator(navigationController: navigationController, dataStore: dataStore)
        notesChooseCoordinator.delegate = self
        return notesChooseCoordinator
    }()
    /// NavigationController getting when init from sceneDelegate
    var navigationController: UINavigationController
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    /// Start the coordinator of the first viewController
    func start() {
        capodastreCoordinator.start()
    }
}

// Conformed the appCordinator to the Coordinator Delegate
extension AppCoordinator : CoordinatorDelegate {
    /// Update dataStore with the new selectedNotes
    /// - Parameter selectedNotes: new selected notes getting after users validation on NotesChooseViewController
    func updateDataStoreAndDismiss(_ selectedNotes: [Note]) {
        dataStore.selectedNotes = selectedNotes
        notesChooseCoordinator.notesChooseViewController.dismiss(animated: true) {
            self.capodastreCoordinator.capodastreViewController.reloadView()
        }
    }
    /// Call the notesChooseCoordinator' start method to present notesChooseCoordinatorViewController modally
    func presentNotesChooseViewController() {
        notesChooseCoordinator.start()
    }
}

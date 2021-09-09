//
//  NotesChooseCoordinator.swift
//  NotesChooseCoordinator
//
//  Created by Adrien Cullier on 08/09/2021.
//

import Foundation
import UIKit

class NotesChooseCoordinator : Coordinator {
    /// Intialize NotesChooseViewController with his viewModel
    lazy var notesChooseViewController : NotesChooseViewController = {
        let notesChooseViewController = NotesChooseViewController(notesChooseViewModel: NotesChooseViewModel(dataStore: dataStore))
        notesChooseViewController.delegate = self
        return notesChooseViewController
    }()
    /// NavigationController and dataStore getting when init from AppCoordinator
    var navigationController: UINavigationController
    var dataStore: NotesDataStore
    init(navigationController: UINavigationController, dataStore: NotesDataStore) {
        self.navigationController = navigationController
        self.dataStore = dataStore
    }
    ///
    public var delegate : CoordinatorDelegate?
    /// Present modally the NotesChooseViewController
    func start() {
        navigationController.present(notesChooseViewController, animated: true)
    }
}

// Conformed the NotesChooseCoordinator to the ViewController Delegate
extension NotesChooseCoordinator : ViewControllersDelegate {
    /// Method called when the validateButton (NotesChooseViewController) is tapped
    /// - Parameter selectedNotes: New selectedNotes getting from NotesChooseViewModel
    func validateButtonTapped(_ selectedNotes: [Note]) {
        /// This method tells to AppCordinator to update the selected notes' datastore with selectedNotes' parameter and dismiss the the NotesChooseViewController
        delegate?.updateDataStoreAndDismiss(selectedNotes)
    }
    /// This method isn't use here
    func plusButtonTapped() {} 
}

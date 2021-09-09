//
//  CapodastreCoordinator.swift
//  CapodastreCoordinator
//
//  Created by Adrien Cullier on 08/09/2021.
//

import Foundation
import UIKit

class CapodastreCoordinator : Coordinator {
    /// Intialize CapodastreViewController with his viewModel
    lazy var capodastreViewController : CapodastreViewController = {
        let capodastreViewController = CapodastreViewController(capodastreViewModel: CapodastreViewModel(dataStore: dataStore))
        capodastreViewController.delegate = self
        return capodastreViewController
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
    /// Push capodatreViewController
    func start() {
        navigationController.pushViewController(capodastreViewController, animated: false)
    }
}

// Conformed the CapodastreCoordinator to the ViewController Delegate
extension CapodastreCoordinator : ViewControllersDelegate {
    /// Method called when the plusButton (capodastreViewController) is tapped
    func plusButtonTapped() {
        /// This Method tells to AppCoordinator to present NotesChooseViewController
        delegate?.presentNotesChooseViewController()
    }
    /// This method isn't use here
    func validateButtonTapped(_ selectedNotes: [Note]) {}
    
    
    
}


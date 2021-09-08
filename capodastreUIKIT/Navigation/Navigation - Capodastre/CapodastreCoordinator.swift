//
//  CapodastreCoordinator.swift
//  CapodastreCoordinator
//
//  Created by Adrien Cullier on 08/09/2021.
//

import Foundation
import UIKit

class CapodastreCoordinator : Coordinator {
    
    lazy var capodastreViewController : CapodastreViewController = {
        let capodastreViewController = CapodastreViewController(capodastreViewModel: CapodastreViewModel(dataStore: dataStore))
        capodastreViewController.delegate = self
        return capodastreViewController
    }()
    
    var navigationController: UINavigationController
    var dataStore: NotesDataStore
    init(navigationController: UINavigationController, dataStore: NotesDataStore) {
        self.navigationController = navigationController
        self.dataStore = dataStore
    }
    
    public var delegate : CoordinatorDelegate?
    
    func start() {
        navigationController.pushViewController(capodastreViewController, animated: false)
    }
    
    
}
extension CapodastreCoordinator : ViewControllersDelegate {
    
}


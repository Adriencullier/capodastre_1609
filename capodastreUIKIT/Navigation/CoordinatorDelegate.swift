//
//  CoordinatorDelegate.swift
//  CoordinatorDelegate
//
//  Created by Adrien Cullier on 08/09/2021.
//

import Foundation

// Coordinator delegate protocol
protocol CoordinatorDelegate {
    func presentNotesChooseViewController()
    func updateDataStoreAndDismiss(_ selectedNotes : [Note])
}

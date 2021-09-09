//
//  ViewControllersDelegate.swift
//  ViewControllersDelegate
//
//  Created by Adrien Cullier on 08/09/2021.
//

import Foundation
import UIKit

protocol ViewControllersDelegate {
    func plusButtonTapped()
    func validateButtonTapped(_ selectedNotes : [Note])
}

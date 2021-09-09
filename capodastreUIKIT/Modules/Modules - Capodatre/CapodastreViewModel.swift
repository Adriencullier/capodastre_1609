//
//  CapodastreViewModel.swift
//  CapodastreViewModel
//
//  Created by Adrien Cullier on 08/09/2021.
//

import Foundation
import UIKit

class CapodastreViewModel {
    
    private var dataStore : NotesDataStore
    init (dataStore : NotesDataStore) {
        self.dataStore = dataStore
    }
    
    public var selectedNotes : [Note] {
        dataStore.selectedNotes ?? dataStore.selectedNotesMock
    }
    
    public var transposedNotes : [Note] {
        dataStore.transposeSelectedNotes(selectedNotes, capoNumber)
    }
    
    public var capoNumber : Int = 0
}

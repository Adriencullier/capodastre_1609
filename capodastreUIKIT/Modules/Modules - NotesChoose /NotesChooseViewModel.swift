//
//  NotesChooseViewModel.swift
//  NotesChooseViewModel
//
//  Created by Adrien Cullier on 08/09/2021.
//

import Foundation
import UIKit

class NotesChooseViewModel {
    private var dataStore : NotesDataStore
    init (dataStore : NotesDataStore) {
        self.dataStore = dataStore
    }
    
    public lazy var selectedNotes : [Note] = {
        dataStore.selectedNotes ?? dataStore.selectedNotesMock
    }()
    
    public var stringSelectedNotes : String {
        var stringSelectedNotes = ""
        var noteNumber = 0
        for note in selectedNotes {
            if noteNumber == 4 {
                stringSelectedNotes += "\n"
            }
            stringSelectedNotes += note.name + "   "
            noteNumber += 1
        }
        return stringSelectedNotes
    }
    
    public var segmentedControlSelectedIndex : Int = 0
    
    public var notesToSelect : [Note] {
        var notesToSelect : [Note] = []
        switch segmentedControlSelectedIndex {
        case 0 : notesToSelect = dataStore.majorNotes
        case 1 : notesToSelect = dataStore.maj7Notes
        case 2 : notesToSelect = dataStore.minorNotes
        case 3 : notesToSelect = dataStore.min7Notes
        default : notesToSelect = []
           
        }
        return notesToSelect
    }
    
    public func selectNote (_ note : Note) {
        guard selectedNotes.count < 8 else {
            print ("8 notes maximum !!")
            return
        }
        selectedNotes.append(note)
    }
    
    public func removeLastNote () {
        guard selectedNotes.count > 0 else {return}
        selectedNotes.removeLast()
    }
 
}

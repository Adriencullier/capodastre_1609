//
//  NotesDataStoreTest.swift
//  NotesDataStoreTest
//
//  Created by Adrien Cullier on 16/09/2021.
//

import XCTest
@testable import capodastreUIKIT

class NotesDataStoreTest: XCTestCase {

    func testGivenSelectedNotesIsEmpty_WhenNoteIsAdded_ThenSelectedNotesCountIsOne () {
        
        let notesDataStore = NotesDataStore()
        notesDataStore.selectedNotes = []
        
        notesDataStore.chooseNote(note: Note(name: "Am"))
        
        XCTAssertEqual(notesDataStore.selectedNotes?.count, 1)
    }
    
    func testGivenSelectedNotesCountIsEight_WhenNoteIsAdded_ThenSelectedNotesCountIsEight () {
        
        let notesDataStore = NotesDataStore()
        let note = Note(name: "Am")
        for _ in 1...8 {
            notesDataStore.selectedNotes?.append(note)
        }
        
        notesDataStore.chooseNote(note: note)
        
        XCTAssertEqual(notesDataStore.selectedNotes?.count, 8)
    }
    
    func testGivenSelectedNotesIsEmpty_WhenAmNoteIsAdded_ThenSelectedNotesContainsAmNote () {
        
        let notesDataStore = NotesDataStore()
        let note = Note(name: "Am")
           
        notesDataStore.chooseNote(note: note)
        
        XCTAssertEqual(notesDataStore.selectedNotes?.last?.name, "Am")
    }
    
    func testGivenSelectedNotesCountIsTwo_WhenLastNoteIsDeleted_ThenSelectedNotesCountIsOne () {
        
        let notesDataStore = NotesDataStore()
        let note = Note(name: "Am")
        for _ in 1...2 {
            notesDataStore.selectedNotes?.append(note)
        }
        
        notesDataStore.delLastNote()
        
        XCTAssertEqual(notesDataStore.selectedNotes?.count, 1)
    }
    
    func testGivenSelectedNotesContainsAmAndGNotes_WhenLastNoteIsDeleted_ThenSelectedNotesLastElementIsAmNote () {
        
        let notesDataStore = NotesDataStore()
        let amNote = Note(name: "Am")
        let gNote = Note(name: "G")
        notesDataStore.selectedNotes = [
            amNote,
            gNote
        ]
        
        notesDataStore.delLastNote()
        
        XCTAssertEqual(notesDataStore.selectedNotes?.last?.name, "Am")
    }
    
    func testGivenSelectedNotesContainsAmNotes_WhenSelectedNotesIsTransposedAtCapoTwo_ThenTransposedNotesLastElementIsBmNote () {
        
        let notesDataStore = NotesDataStore()
        let amNote = Note(name: "Am")
        let capoTwo = 2
        notesDataStore.selectedNotes = [amNote]
        
        let transposedNotes = notesDataStore.transposeSelectedNotes(notesDataStore.selectedNotes!, capoTwo)
        
        XCTAssertEqual(transposedNotes.last?.name, "Bm")
    }
    func testGivenSelectedNotesContainsAm7Notes_WhenSelectedNotesIsTransposedAtCapoTwo_ThenTransposedNotesLastElementIsBm7Note () {
        
        let notesDataStore = NotesDataStore()
        let amNote = Note(name: "Am7")
        let capoTwo = 2
        notesDataStore.selectedNotes = [amNote]
        
        let transposedNotes = notesDataStore.transposeSelectedNotes(notesDataStore.selectedNotes!, capoTwo)
        
        XCTAssertEqual(transposedNotes.last?.name, "Bm7")
    }
    
    func testGivenSelectedNotesContainsANotes_WhenSelectedNotesIsTransposedAtCapoTwo_ThenTransposedNotesLastElementIsBNote () {
        
        let notesDataStore = NotesDataStore()
        let amNote = Note(name: "A")
        let capoTwo = 2
        notesDataStore.selectedNotes = [amNote]
        
        let transposedNotes = notesDataStore.transposeSelectedNotes(notesDataStore.selectedNotes!, capoTwo)
        
        XCTAssertEqual(transposedNotes.last?.name, "B")
    }
    
    func testGivenSelectedNotesCont7insAmNotes_WhenSelectedNotesIsTransposedAtCapoTwo_ThenTransposedNotesLastElementIsB7Note () {
        
        let notesDataStore = NotesDataStore()
        let amNote = Note(name: "A7")
        let capoTwo = 2
        notesDataStore.selectedNotes = [amNote]
        
        let transposedNotes = notesDataStore.transposeSelectedNotes(notesDataStore.selectedNotes!, capoTwo)
        
        XCTAssertEqual(transposedNotes.last?.name, "B7")
    }
}

//
//  NotesGestion.swift
//  capodastreUIKIT
//
//  Created by Adrien Cullier on 29/06/2021.
//

import Foundation

class NotesDataStore {

    public var selectedNotes : [Note]? = []
    
    var selectedNotesMock : [Note] = [
        Note(name: "Am", image: ""),
        Note(name: "C", image: ""),
        Note(name: "G", image: ""),
        Note(name: "D", image: ""),
        Note(name: "Am", image: ""),
        Note(name: "C", image: ""),
        Note(name: "G", image: ""),
        Note(name: "D", image: "")
    ]
    
    let majorNotes : [Note] = [
        Note(name: "A", image: ""),
        Note(name: "A#", image: ""),
        Note(name: "B", image: ""),
        Note(name: "C", image: ""),
        Note(name: "C#", image: ""),
        Note(name: "D", image: ""),
        Note(name: "D#", image: ""),
        Note(name: "E", image: ""),
        Note(name: "F", image: ""),
        Note(name: "F#", image: ""),
        Note(name: "G", image: ""),
        Note(name: "G#", image: "")
    ]
    let minorNotes : [Note] = [
        Note(name: "Am", image: ""),
        Note(name: "Am#", image: ""),
        Note(name: "Bm", image: ""),
        Note(name: "Cm", image: ""),
        Note(name: "Cm#", image: ""),
        Note(name: "Dm", image: ""),
        Note(name: "Dm#", image: ""),
        Note(name: "Em", image: ""),
        Note(name: "Fm", image: ""),
        Note(name: "Fm#", image: ""),
        Note(name: "Gm", image: ""),
        Note(name: "Gm#", image: "")
    ]
    let maj7Notes : [Note] = [
        Note(name: "A7", image: ""),
        Note(name: "A7#", image: ""),
        Note(name: "B7", image: ""),
        Note(name: "C7", image: ""),
        Note(name: "C7#", image: ""),
        Note(name: "D7", image: ""),
        Note(name: "D7#", image: ""),
        Note(name: "E7", image: ""),
        Note(name: "F7", image: ""),
        Note(name: "F7#", image: ""),
        Note(name: "G7", image: ""),
        Note(name: "G7#", image: "")
    ]
    
    let min7Notes : [Note] = [
        Note(name: "Am7", image: ""),
        Note(name: "Am#7", image: ""),
        Note(name: "Bm7", image: ""),
        Note(name: "Cm7", image: ""),
        Note(name: "Cm#7", image: ""),
        Note(name: "Dm7", image: ""),
        Note(name: "Dm#7", image: ""),
        Note(name: "Em7", image: ""),
        Note(name: "Fm7", image: ""),
        Note(name: "Fm#7", image: ""),
        Note(name: "Gm7", image: ""),
        Note(name: "Gm#7", image: "")
    ]
    
    public func chooseNote (note : Note) {
        guard selectedNotes!.count < 8 else {
           print ("Message error : 8 notes max")
            return
        }
        selectedNotes!.append(note)
        print("La note \(note.name) a bien été ajoutée à notesChoose")
    }
    
    public func delLastNote (){
        var lastNoteNumber = 0
        if selectedNotes! .count >= 0 {
            lastNoteNumber = selectedNotes!.count-1
        }
        selectedNotes!.remove(at: lastNoteNumber)
    }

    public func transposeSelectedNotes (_ selectedNotes : [Note], _ capo : Int) -> [Note] {
        var transposedSelectedNotes : [Note] = []
        for note in selectedNotes {
            let transposeNote = transposeNote(note: note, capo: capo)
            transposedSelectedNotes.append(transposeNote)
        }
        return transposedSelectedNotes
    }
    
    //MARK:- Note transposition Method
    private func transposeNote (note : Note, capo : Int)-> Note {
        var indexMajor = 0
        var transposeNote = note
        var indexMinor = 0

        if note.name.contains("m") && note.name.contains("7") == false{
            for element in minorNotes {
                if element.name == note.name {
                    for _ in 0...capo {
                        
                        if indexMinor == 12 {
                            indexMinor = 0
                        }
                        indexMinor += 1

                        transposeNote = minorNotes[indexMinor-1]
                    }
                }
                indexMinor += 1
            }
        }
        else if note.name.contains("m") == false && note.name.contains("7"){
            for element in maj7Notes {
                if element.name == note.name {
                    for _ in 0...capo {
                        
                        if indexMajor == 12 {
                            indexMajor = 0
                        }
                        indexMajor += 1

                        transposeNote = maj7Notes[indexMajor-1]
                    }
                }
                indexMajor += 1
            }
           
            return transposeNote
             
                    }
        else if note.name.contains("m") && note.name.contains("7") {
            for element in min7Notes {
                if element.name == note.name {
                    for _ in 0...capo {
                        
                        if indexMajor == 12 {
                            indexMajor = 0
                        }
                        indexMajor += 1

                        transposeNote = min7Notes[indexMajor-1]
                    }
                }
                indexMajor += 1
            }
           
            return transposeNote
             
                    }
       
        for element in majorNotes {
            if element.name == note.name {
                for _ in 0...capo {
                    
                    if indexMajor == 12 {
                        indexMajor = 0
                    }
                    indexMajor += 1

                    transposeNote = majorNotes[indexMajor-1]
                }
            }
            indexMajor += 1
        }
       
        return transposeNote
        
 
}
}



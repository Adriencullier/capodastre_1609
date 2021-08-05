//
//  NotesGestion.swift
//  capodastreUIKIT
//
//  Created by Adrien Cullier on 29/06/2021.
//

import Foundation

class NotesGestion {
    static let shared = NotesGestion()
    private init (){}
    
    let majorNoteArray : [Note] = [
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
    let minorNoteArray : [Note] = [
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
    let maj7NoteArray : [Note] = [
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
    
    let min7NoteArray : [Note] = [
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
    
    
    var notesChoose = [Note]()
    
    func chooseNote (note : Note) {
        guard notesChoose.count < 8
        else {
           // TO DO : Print a message error (8 notes max)
           print ("Message error : 8 notes max")
            return
        }
        notesChoose.append(note)
        print("La note \(note.name) a bien été ajoutée à notesChoose")
    }
    
    func delLastNote (){
        
        let lastNoteNumber = notesChoose.count-1
        guard lastNoteNumber >= 0
        else{
            return
        }
        notesChoose.remove(at: lastNoteNumber)
    }

    //MARK:- fonction de transposition

    func transpose (note : String, capo : Int)->String {
        var indexMajor = 0
        var transposeNote = ""
        var indexMinor = 0

        if note.contains("m") && note.contains("7") == false{
            for element in minorNoteArray {
                if element.name == note {
                    for _ in 0...capo {
                        
                        if indexMinor == 12 {
                            indexMinor = 0
                        }
                        indexMinor += 1

                        transposeNote = minorNoteArray[indexMinor-1].name
                    }
                }
                indexMinor += 1
            }
        }
        else if note.contains("m") == false && note.contains("7"){
            for element in maj7NoteArray {
                if element.name == note {
                    for _ in 0...capo {
                        
                        if indexMajor == 12 {
                            indexMajor = 0
                        }
                        indexMajor += 1

                        transposeNote = maj7NoteArray[indexMajor-1].name
                    }
                }
                indexMajor += 1
            }
           
            return transposeNote
             
                    }
        else if note.contains("m") && note.contains("7") {
            for element in min7NoteArray {
                if element.name == note {
                    for _ in 0...capo {
                        
                        if indexMajor == 12 {
                            indexMajor = 0
                        }
                        indexMajor += 1

                        transposeNote = min7NoteArray[indexMajor-1].name
                    }
                }
                indexMajor += 1
            }
           
            return transposeNote
             
                    }
       
        for element in majorNoteArray {
            if element.name == note {
                for _ in 0...capo {
                    
                    if indexMajor == 12 {
                        indexMajor = 0
                    }
                    indexMajor += 1

                    transposeNote = majorNoteArray[indexMajor-1].name
                }
            }
            indexMajor += 1
        }
       
        return transposeNote
        
 
}
}



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
    private(set) var majorNoteArray : [Note] = [
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
    private(set) var minorNoteArray : [Note] = [
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

    //MARK:- fonction de transposition

    func transpose (note : String, capo : Int)->String {
        var indexMajor = 0
        var transposeNote = ""
        var indexMinor = 0

        if note.contains("m"){
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







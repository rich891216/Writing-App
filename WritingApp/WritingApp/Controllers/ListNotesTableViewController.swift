//
//  MyDocs.swift
//  WritingApp
//
//  Created by Richard Wang on 7/23/18.
//  Copyright © 2018 Richard Wang. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ListNotesTableViewController: UITableViewController {
    
    @IBAction func unwindWithSegue1 (_ segue: UIStoryboardSegue) {
    print("cancel button pressed")
    }
    
    var notes = [Note]() {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notes = CoreDataHelper.retrieveNote()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return notes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        
        let note = notes[indexPath.row]
        cell.noteTitleLabel.text = note.title
        
        cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString() ?? "unknown"
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayNote":
            // 1
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            // 2
            let note = notes[indexPath.row]
            // 3
            let destination = segue.destination as! DisplayNoteViewController
            //4
            destination.note = note
            
        case "addNote":
            print("create note bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let noteToDelete = notes[indexPath.row]
            CoreDataHelper.delete(note: noteToDelete)
            
            notes = CoreDataHelper.retrieveNote()
        }
    }

    
    
    
}

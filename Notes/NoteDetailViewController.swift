//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Marie on 07.10.17.
//  Copyright © 2017 Mariya. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    //@IBOutlet weak var titleTextField: UITextField!
    
    var note: Note!
    
    @IBOutlet weak var contentTextView: UITextView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //titleTextField.text = note.title
        //contentTextField.text = note.content
        contentTextView.text = note.content
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //note.title = titleTextField.text!
        note.title = contentTextView.text!
        //note.content = contentTextField.text!
        note.content = contentTextView.text!
    }
    
}

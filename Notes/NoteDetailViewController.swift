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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.navigationBar.prefersLargeTitles = false
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "paper.jpg")
        //let imageViewBackground = UIImageView(image: backgroundImage)
        self.contentTextView.backgroundColor = UIColor(patternImage: backgroundImage!)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
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

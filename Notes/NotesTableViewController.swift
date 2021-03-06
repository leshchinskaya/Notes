//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Marie on 07.10.17.
//  Copyright © 2017 Mariya. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import CloudKit

class NotesTableViewController: UITableViewController {

    var notes: [Note] = []
    var filteredNotes = [Note]()
    
    let searchController = UISearchController(searchResultsController: nil)
    let imageView = UIImageView()
    
    func isFiltering() -> Bool {
        //return searchController.isActive && !searchBarIsEmpty()
        return false
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Database.database().reference().setValue(85)
        
        //navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        /*
        imageView.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:400)
        imageView.image = UIImage.init(named: "title.png")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
         */
        
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "paper.jpg")
        let imageViewBackground = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageViewBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 600)
        imageView.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:height)
    }
    */
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltering() {
            return filteredNotes.count
        }
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as UITableViewCell
        let note: Note
        
        if isFiltering() {
            note = filteredNotes[indexPath.row]
        } else {
            note = notes[indexPath.row]
        }
        
        cell.textLabel!.text = notes[indexPath.row].title
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       /*
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
         */
        
        notes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier! == "showNote" {
            var noteDetailViewController = segue.destination as! NoteDetailViewController
            var selectedIndexPath = tableView.indexPathForSelectedRow
            noteDetailViewController.note = notes[selectedIndexPath!.row]
        } else if segue.identifier! == "addNote" {
            var note = Note()
            notes.append(note)
            var noteDetailViewController = segue.destination as! NoteDetailViewController
            noteDetailViewController.note = note
        }
    }
    

}

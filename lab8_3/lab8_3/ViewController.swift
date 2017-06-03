//
//  ViewController.swift
//  lab8_3
//
//  Created by Elena on 26.05.17.
//  Copyright © 2017 Elena. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var students = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell")! as UITableViewCell
        let student = students[indexPath.row]
        cell.textLabel?.text = student.value(forKey: "name") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt  indexPath: IndexPath)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            context.delete(students[indexPath.row])
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                let result = try context.fetch(Students.fetchRequest())
                students = result as! [Students]
                self.tableView.reloadData()
            } catch let error as NSError {
                print("Could not save \(error), \(error.userInfo)")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let result = try context.fetch(Students.fetchRequest())
            students = result as! [Students]
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func addStudent(_ sender: Any) {
        if studentNameTextField.text == "" || studentNameTextField.text == "Введите данные!" {
            studentNameTextField.text = "Введите данные!"
        }
        else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let student = Students(entity: Students.entity(), insertInto: context)
            student.setValue(studentNameTextField.text, forKey: "name")
            do {
                try context.save()
                students.append(student)
                studentNameTextField.text! = ""
                self.tableView.reloadData()
                self.view.endEditing(true)

            } catch let error as NSError {
                print("Data saving error: \(error), \(error.userInfo)")
            }
        }
    }

}


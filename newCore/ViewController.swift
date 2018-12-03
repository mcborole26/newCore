//
//  ViewController.swift
//  newCore
//
//  Created by Felix ITs 08 on 10/01/18.
//  Copyright © 2018 Felix. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let delegate=UIApplication.shared.delegate as! AppDelegate
        let context:NSManagedObjectContext=delegate.persistentContainer.viewContext
        let stud1:Student=NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        stud1.firstName="Dinesh"
        stud1.lastName="Sharma"
        stud1.age=20
        
        let Course1:Course=NSEntityDescription.insertNewObject(forEntityName: "Course", into: context) as! Course
        Course1.courseName="IOS"
        
        stud1.addToCourses(Course1)
        
        
        let stud2:Student=NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        stud2.firstName="Ramesh"
        stud2.lastName="Agrawal"
        stud2.age=21
        let Course2:Course=NSEntityDescription.insertNewObject(forEntityName: "Course", into: context) as! Course
        Course2.courseName="Android"
        
        stud2.addToCourses(Course2)
        
        
       
        
        //Fetch
        let fetchRequest:NSFetchRequest<Student>=Student.fetchRequest()
        let namePredicate:NSPredicate=NSPredicate(format: "firstName = %@","Ramesh")
        fetchRequest.predicate=namePredicate

        do
        {
        let searchResults=try context.fetch(fetchRequest)
            print("Total count=\(searchResults.count)")

            for result in searchResults as [Student]
            {
                print("First name:\(result.firstName)")
                print("Last name:\(result.lastName)")
                print("age:\(result.age)")
                print("Course:\(result.courses)")

                
            }
            context.delete(stud2)
            
            print("Stud 2 deleted")
            
            do
            {
                try context.save()
                print("Insert Success:")
            }
            catch
            {
                print(error.localizedDescription)
            }
        }
        catch
        {
            print(error.localizedDescription)
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


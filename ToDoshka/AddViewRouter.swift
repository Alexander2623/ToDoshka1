//
//  AddViewRouter.swift
//  ToDoshka
//
//  Created by Александр on 21.07.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import UIKit

protocol AddViewRouter: ViewRouter {
  func textFieldDidChange(text: String)
  func textViewDidChange(text: String)
}

class AddViewRouterImplamemtation: AddViewRouter {
  fileprivate var addTableViewController: AddTableViewController
  init(addTableViewController: AddTableViewController) {
    self.addTableViewController = addTableViewController
  }

  var task = Task(name: "", description: "")

  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let toDoTableViewController = segue.destination as? ToDoTableViewController
    if task.name != "" || task.description != "" {
      if TaskRepository.sharedInstance.addButtonFlag {
        toDoTableViewController!.taskList.append(Task(name: task.name, description: task.description))
      } else {
        toDoTableViewController!.didEditTask(task)
      }
    } else {
      showError("Ooops", message: "Not all fields are filled out")
    }
    
  }

  func showError (_ title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    addTableViewController.self.present(alert, animated: true, completion: nil)
  }
  func textFieldDidChange(text: String) {
    self.task.name = text
  }
  func textViewDidChange(text: String) {
    self.task.description = text
  }
}

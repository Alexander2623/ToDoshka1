//
//  ToDoRouter.swift
//  ToDoshka
//
//  Created by Александр on 20.07.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import UIKit
protocol ToDoRouter: ViewRouter {
  func addButtonPressed()
  func didSelectTask(indexPath: IndexPath)
}

class ToDoRouterImplamentation: ToDoRouter {
  fileprivate var toDoTableViewContriller: ToDoTableViewController
  init(toDoTableViewContriller: ToDoTableViewController) {
    self.toDoTableViewContriller = toDoTableViewContriller
  }
  
  //var buttonFlag = true
  
  func addButtonPressed() {
    TaskRepository.sharedInstance.addButtonFlag = true
    toDoTableViewContriller.performSegue(withIdentifier: "Add", sender: self)
  }
  
  func didSelectTask(indexPath: IndexPath) {
    TaskRepository.sharedInstance.addButtonFlag = false
    toDoTableViewContriller.performSegue(withIdentifier: "Add", sender: toDoTableViewContriller.taskList[indexPath.row])
    
  }
  
  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "Add"{
      let addTableViewController = segue.destination as? AddTableViewController
      addTableViewController!.configurator = AddViewConfiguratorImplamemtation()
      addTableViewController!.configurator.configure(addTableViewController: addTableViewController!)
      addTableViewController!.createButtonAddTableView(value: TaskRepository.sharedInstance.addButtonFlag)
      if let task = sender as? Task1 {
        addTableViewController!.configureWithTask(task)
      }
    }
  }
  
  
}

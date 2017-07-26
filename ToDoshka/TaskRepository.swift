//
//  TaskRepository.swift
//  ToDoshka
//
//  Created by Александр on 21.07.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import UIKit

class TaskRepository {
  
  static let sharedInstance = TaskRepository()

    var addButtonFlag = true
    var masOfTask = [Task]()
    
    func addTask(_ task: Task) {
        masOfTask.append(task)
    }
    
    func editTask(_ task: Task) {
        masOfTask.append(task)
    }
    
    func removeTask(_ task: Task) {
        masOfTask.append(task)
    }
}

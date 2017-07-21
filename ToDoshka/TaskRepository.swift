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
  var masOfTask = [Task1]()
  
  func addTask(_ task:Task1) {
    masOfTask.append(task)
  }
}

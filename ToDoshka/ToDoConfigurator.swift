//
//  ToDoConfigurator.swift
//  ToDoshka
//
//  Created by Александр on 20.07.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import Foundation
protocol ToDoConfigurator {
  func configure(toDoTableViewController: ToDoTableViewController)
}

class ToDoConfiguratorImplamentation: ToDoConfigurator {
  func configure(toDoTableViewController: ToDoTableViewController) {
    let router = ToDoRouterImplamentation(toDoTableViewContriller: toDoTableViewController)
    let presenter = ToDoPresenterImplamentation(router: router)
    toDoTableViewController.presenter = presenter
  }

  
  }

  

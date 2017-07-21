//
//  ToDoPresenter.swift
//  ToDoshka
//
//  Created by Александр on 20.07.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import Foundation

protocol ToDoPresenter {
  func addButtonPressed()
  var router: ToDoRouter{ get }
  func didSelectTask(indexPath: IndexPath)
}

class ToDoPresenterImplamentation: ToDoPresenter {
  var router: ToDoRouter
  init (router: ToDoRouter){
    self.router = router
  }
  func addButtonPressed() {
    router.addButtonPressed()
  }
  func didSelectTask(indexPath: IndexPath) {
    router.didSelectTask(indexPath: indexPath)
  }
}

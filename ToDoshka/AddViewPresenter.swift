//
//  AddViewPresenter.swift
//  ToDoshka
//
//  Created by Александр on 21.07.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import Foundation

protocol AddViewPresenter {
  var router: AddViewRouter { get }
  func textFieldDidChange(text: String)
  func textViewDidChange(text: String)
  
  
}

class AddViewPresenterImplamentation: AddViewPresenter {
  var router: AddViewRouter
  init(router: AddViewRouter) {
    self.router = router
  }
  func textFieldDidChange(text: String) {
    router.textFieldDidChange(text: text)
  }
  func textViewDidChange(text: String) {
    router.textViewDidChange(text: text)
  }
}

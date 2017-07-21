//
//  AddViewConfigurator.swift
//  ToDoshka
//
//  Created by Александр on 21.07.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import Foundation

protocol AddViewConfigurator {
  func configure(addTableViewController: AddTableViewController)
}

class AddViewConfiguratorImplamemtation: AddViewConfigurator {
  func configure(addTableViewController: AddTableViewController) {
    let router = AddViewRouterImplamemtation(addTableViewController: addTableViewController)
    let presenter = AddViewPresenterImplamentation(router: router)
    addTableViewController.presenter = presenter
  }
}

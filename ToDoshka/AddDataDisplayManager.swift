//
//  AddDataDisplayManager.swift
//  ToDoshka
//
//  Created by Александр on 21.07.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import UIKit

protocol AddDataDisplayManagerDelegate: class {
  
}

class AddDataDisplayManager: NSObject {
  //weak var delegate1: AddDataDisplayManagerDelegate?
  
}

extension AddDataDisplayManager: UITableViewDelegate {
  
}

extension AddDataDisplayManager: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cotigoriesCell", for: indexPath)
    cell.textLabel?.text = nil
    cell.detailTextLabel?.text = nil
    return cell
  }

}

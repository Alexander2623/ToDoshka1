//
//  AddViewController.swift
//  ToDoshka
//
//  Created by Александр on 21.07.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import UIKit
class AddTableViewController: UITableViewController {
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var textView: UITextView!
  
  var presenter: AddViewPresenter!
  //var configurator: AddViewConfigurator = AddViewConfiguratorImplamemtation()
  var configurator: AddViewConfiguratorImplamemtation!
  var displayManager = AddDataDisplayManager()
  var task: Task1 = Task1(name: "", description: "")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //configurator.configure(addTableViewController: self)
    textView.delegate = self
//    tableView.dataSource = displayManager
//    tableView.delegate = displayManager
//    displayManager.delegate1 = self
  }
  
  // MARK: IBActions
  
  @IBAction func unwindfor(segue: UIStoryboardSegue) {
  }
  
  @IBAction func goBack(sender: Any) {
    performSegue(withIdentifier: "backToMain", sender: self)
  }
  
  @IBAction func textFieldDidChange(_ sender: UITextField) {
    if let unwrappedText = textField.text {
      presenter.textFieldDidChange(text: unwrappedText)
      
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    presenter.router.prepare(for: segue, sender: sender)
  }
  func createButtonAddTableView(value: Bool) {
    if value {
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add",
                                                          style: .plain,
                                                          target: self,
                                                          action: #selector(goBack))
      navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                         style: .plain,
                                                         target: self,
                                                         action: #selector(cancelButton))
    } else {
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit",
                                                          style: .plain,
                                                          target: self,
                                                          action: #selector(goBack))
      navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                         style: .plain,
                                                         target: self,
                                                         action: #selector(cancelButton))
    }
  }
  
  func cancelButton() {
    navigationController?.popViewController(animated: true)
  }
  func configureWithTask(_ task: Task1) {
  self.task = task
  }
}
extension AddTableViewController: UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    if let unwrappedText = textView.text {
      presenter.textViewDidChange(text: unwrappedText)
    }
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellName", for: indexPath)
    
    return cell
  }
}

//extension AddTableViewController: AddDataDisplayManagerDelegate {
//  
//}

//
//  ViewController.swift
//  ToDoshka
//
//  Created by Александр on 20.07.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    @IBAction func addTaskButton(_ sender: UIBarButtonItem) {
        presenter.addButtonPressed()
    }
    @IBAction func unwindfor(segue: UIStoryboardSegue) {
    }
    var presenter: ToDoPresenter!
    var configurator: ToDoConfigurator = ToDoConfiguratorImplamentation()
    var displayManager: ToDoDataDisplayManager!
    var selectedIndexPath: IndexPath?
    var taskList = [Task] () {
        didSet{
            displayManager.setupWithTasks(taskList)
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurator.configure(toDoTableViewController: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
    
    func didEditTask(_ task: Task) {
        guard let indexPath = selectedIndexPath else {
            return
        }
        taskList[indexPath.row] = task
    }
}

extension ToDoTableViewController: ToDoDataDisplayManagerDelegate {
    func didSelectTask(indexPath: IndexPath) {
        presenter.didSelectTask(indexPath: indexPath)
        selectedIndexPath = indexPath
        
    }
}

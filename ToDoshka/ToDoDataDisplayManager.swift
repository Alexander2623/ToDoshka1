//
//  ToDoDataDisplayManager.swift
//  ToDoshka
//
//  Created by Александр on 20.07.17.
//  Copyright © 2017 Александр. All rights reserved.
//

import UIKit

protocol ToDoDataDisplayManagerDelegate: class {
    func didSelectTask(indexPath: IndexPath)
}

class ToDoDataDisplayManager: NSObject {
    weak var delegate: ToDoDataDisplayManagerDelegate?
    weak var tableView: UITableView?
    init(tableView: UITableView) {
        self.tableView = tableView
        
        super.init()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    var tasks: [Task] = []
    func setupWithTasks(_ tasks: [Task]) {
        self.tasks = tasks
    }
}

// MARK: UITableViewDelegate

extension ToDoDataDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let index = indexPath.row
        if editingStyle == .delete {
            tasks.remove(at: index)
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectTask(indexPath: indexPath)
    }
    
}

// MARK: UITableViewDataSourse

extension ToDoDataDisplayManager: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].name
        cell.detailTextLabel?.text = tasks[indexPath.row].description
        return cell
    }
    
}

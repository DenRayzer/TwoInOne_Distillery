//
//  PopTableViewController.swift
//  TwoInOne
//
//  Created by Елизавета on 08.04.2020.
//  Copyright © 2020 Елизавета. All rights reserved.
//

import UIKit

class PopTableViewController: UITableViewController {
    
    var eventManager: RecordsListEventManager? = nil
    let sortingOptinsNames = ["attempts number",
                              "guessed number"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isScrollEnabled = false
    }
    
    override func viewWillLayoutSubviews() {
        preferredContentSize = CGSize(width: 250, height: tableView.contentSize.height)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortingOptinsNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let sortingOptionName = sortingOptinsNames[indexPath.row]
        cell.textLabel?.text = sortingOptionName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        PopTableViewController.self.accessibilityElementDidLoseFocus()
        switch indexPath.row {
        case 0:
            eventManager?.notifyAttemptItemSelected()
        default:
            eventManager?.notifyNumberItemSelected()
        }
    }
    
}

//
//  RecordsViewController.swift
//  TwoInOne
//
//  Created by Елизавета on 08.04.2020.
//  Copyright © 2020 Елизавета. All rights reserved.
//

import UIKit

class RecordsViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, RecordsListObserver {
    
    var simpleRecordsArray = [RecordModel]()
    var secondRecordsArray = [RecordModel]()
    var arrayToDisplay = [RecordModel]()
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var recordsTableView: UITableView!
    @IBOutlet weak var sortButton: UIButton!
    var popTableViewControllerBuf: PopTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        simpleRecordsArray = getRecords(forGame: "Simple")
        arrayToDisplay = simpleRecordsArray
        setupGestures()
    }
    
    // MARK: SegmentControl
    @IBAction func handleSegmentChanged(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            arrayToDisplay = simpleRecordsArray
        default:
            secondRecordsArray = getRecords(forGame: "Second")
            arrayToDisplay = secondRecordsArray
        }
        recordsTableView.reloadData()
    }
    
    // MARK: Pop over menu
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTouchesRequired = 1
        sortButton.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func tapped(){
        guard let  popVC = storyboard?.instantiateViewController(withIdentifier: "popVC") as? PopTableViewController else { return }
        popVC.eventManager = RecordsListEventManager(self)
        popVC.modalPresentationStyle = .popover
        guard let popOverVC = popVC.popoverPresentationController else { return }
        popOverVC.delegate  = self
        popOverVC.sourceView = self.sortButton
        popOverVC.sourceRect = CGRect(x:self.sortButton.bounds.minX, y: self.sortButton.bounds.midY, width: 0, height: 0)
        popVC.preferredContentSize = CGSize(width: 250, height: 250)
        self.present(popVC,animated: true)
        popTableViewControllerBuf = popVC
    }
    
    func sortByAttemptsCount() {
        arrayToDisplay.sort(by: { $0.attempt < $1.attempt })
        recordsTableView.reloadData()
        popTableViewControllerBuf?.dismiss(animated: true)
    }
    
    func sortByGuessNumber() {
        arrayToDisplay.sort(by: { $0.number < $1.number })
        recordsTableView.reloadData()
        popTableViewControllerBuf?.dismiss(animated: true)
    }
    
    // MARK: tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)
        let data = arrayToDisplay[indexPath.row]
        cell.textLabel?.text = "Количество попыток: \(data.attempt)"
        cell.detailTextLabel?.text = "Угаданное число: \(data.number)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension RecordsViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

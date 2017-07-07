//
//  AccidentReportsTableViewController.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class AccidentReportsTableViewController: UITableViewController, AccidentReportTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AccidentReportsController.shared.accidentReports.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "accidentReportCell", for: indexPath) as? AccidentReportTableViewCell else { return UITableViewCell() }
        
        let accidentReports = AccidentReportsController.shared.accidentReports[indexPath.row]
        
        cell.updateAccidentReport(accidentReport: accidentReports)
        cell.delegate = self

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let accidentReports = AccidentReportsController.shared.accidentReports[indexPath.row]
            AccidentReportsController.shared.delete(accidentReport: accidentReports)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let destinationVC = segue.destination as? AccidentReportDetailTableViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            destinationVC.accidentReport = AccidentReportsController.shared.accidentReports[indexPath.row]
        }
    }
    

    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

//
//  AccidentReportTableViewCell.swift
//  CrashAssistant
//
//  Created by Luis Puentes on 6/28/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class AccidentReportTableViewCell: UITableViewCell {

    var step3: AccidentReports?
    
    var delegate: AccidentReportTableViewCellDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var makeAndModelLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statementTextView: UITextView!
}

extension AccidentReportTableViewCell {
    func updateAccidentReport(accidentReport: AccidentReports) {
    
        nameLabel.text = accidentReport.name
        makeAndModelLabel.text = accidentReport.makeAndModel
        statementTextView.text = accidentReport.statement
        dateLabel.text = accidentReport.date?.toString(dateFormat: "dd-MMM-yyyy")
    }
}

protocol AccidentReportTableViewCellDelegate {
    
}

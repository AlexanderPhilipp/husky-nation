//
//  ViewController.swift
//  HuskyNation
//
//  Created by Alexander Philipp on 12/8/21.
//

import UIKit

class AssignmentPageView : UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var assignmentTableView: UITableView!
    @IBOutlet weak var TopicDate: UILabel!
    @IBOutlet weak var LogoImage: UIImageView!
    
    let data : [AssignmentData] = [
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),
        AssignmentData(id: 0, aDate: Date.now, dDate: Date.now, desc: "", disc: false),

    ];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.assignmentTableView.dataSource = self
        self.assignmentTableView.delegate = self
        
        self.registerAssignmentTableCell()
        
        
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.timeZone = .current
        // formatter.locale = .current
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        TopicDate.text = formatter.string(from: currentDate)
        
        
        MainInterfaceController.apiHelper.GetAssignments()
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AssignmentTableCell") as! AssignmentTableCell
        
        if (indexPath.row % 2 == 0){
            cell.contentView.backgroundColor = UIColor(red: 0.184, green: 0.333, blue: 0.208, alpha: 0.7)
        }
        else{
            cell.contentView.backgroundColor = UIColor(red: 0.42, green: 0.675, blue: 0.329, alpha: 0.4)
        }
        return cell
    }
    
    private func registerAssignmentTableCell() {
        let assignmentCell = UINib(nibName: "AssignmentTableCell",
                                  bundle: nil)
        self.assignmentTableView.register(assignmentCell,
                                forCellReuseIdentifier: "AssignmentTableCell")
    }
}


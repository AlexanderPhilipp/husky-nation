//
//  HomePageView.swift
//  HuskyNation
//
//  Created by Alexander Philipp on 12/12/21.
//

import UIKit

class HomePageView : UIViewController {
    @IBOutlet weak var topicDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.timeZone = .current
        // formatter.locale = .current
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        topicDate.text = formatter.string(from: currentDate)
                
    }
    
    func refreshAssignments(assignments : [AssignmentData]){
        for assignment in assignments {
            print(assignment.assignmentID);
        }
    }
}

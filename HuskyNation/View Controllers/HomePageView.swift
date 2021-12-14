//
//  HomePageView.swift
//  HuskyNation
//
//  Created by Alexander Philipp on 12/12/21.
//

import UIKit

class HomePageView : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func refreshAssignments(assignments : [AssignmentData]){
        for assignment in assignments {
            print(assignment.assignmentID);
        }
    }
}

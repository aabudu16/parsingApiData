//
//  UserDetailedViewController.swift
//  ParsingJson
//
//  Created by Mr Wonderful on 8/29/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class UserDetailedViewController: UIViewController {
    var info:UserResult!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userEmail: UILabel!
    @IBOutlet var userDOB: UILabel!
    @IBOutlet var userPhoneNumber: UILabel!
    @IBOutlet var userAddress: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDetailedUserVC()
    }
    
    func setupDetailedUserVC(){
        userName.text = "\(info.name.title) \(info.name.first) \(info.name.last)"
        userEmail.text = "Email: \(info.email)"
        userDOB.text = "D.O.B: \(info.dob.date)"
        userPhoneNumber.text = "Phone #: \(info.phone)"
        userAddress.text = "Address: \(info.location.street)"
        
    }

  

}

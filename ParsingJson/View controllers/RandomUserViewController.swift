//
//  RandomUserViewController.swift
//  ParsingJson
//
//  Created by Mr Wonderful on 8/29/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController {
    
    @IBOutlet var userTableView: UITableView!
    var randomUser = [UserResult]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
    
    func setup(){
        userTableView.delegate = self
        userTableView.dataSource = self
    }
    func fetchData(){
        RandomUserAPIClient.shared.fetchRandomData { (result) in
            switch result{
            case .failure(let error):
                print("Couldnt retrieve data \(error)")
            case .success(let User):
                self.randomUser = User.results
                DispatchQueue.main.async {
                    self.userTableView.reloadData()
                }
            }
        }
    }
}

extension RandomUserViewController: UITableViewDelegate{}
extension RandomUserViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomUserCell", for: indexPath)
        let info = randomUser[indexPath.row]
        cell.textLabel?.text = "\(info.name.title) \(info.name.first) \(info.name.last)"
        cell.detailTextLabel?.text = "Email:  \(info.email)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userDetailedVC = storyboard?.instantiateViewController(withIdentifier: "randomUserViewController") as! UserDetailedViewController
        let detailedInfo = randomUser[indexPath.row]
        
        userDetailedVC.info = detailedInfo
        
        self.navigationController?.pushViewController(userDetailedVC, animated: true)
    }
}

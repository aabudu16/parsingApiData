//
//  ViewController.swift
//  ParsingJson
//
//  Created by Mr Wonderful on 8/28/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    var mycolor:[Color]!
    @IBOutlet var colorTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchColor()
        colorTableView.delegate = self
        colorTableView.dataSource = self
        
    }
    
    func fetchColor(){
        ColorAPIClient.shared.fetchColorData { (result) in
            switch result{
            case .failure(let error):
                print("Cant fetch color value \(error)")
            case .success(let color):
                self.mycolor = color.colors
                DispatchQueue.main.async {
                    self.colorTableView.reloadData()
                }

            }
        }
    }
}

extension ColorViewController: UITableViewDelegate{}
extension ColorViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard mycolor != nil else {return 0}
    
        return mycolor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        
        cell.textLabel?.text = mycolor[indexPath.row].name.value
        
            cell.backgroundColor = mycolor[indexPath.row].rgb.fraction.colorGenerator()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let colorDetailedViewController = storyboard?.instantiateViewController(withIdentifier: "colorDetailViewController") as! ColorDetailViewController
        
        let info = mycolor[indexPath.row]
        
        colorDetailedViewController.myDetailedColor = info
        
        self.navigationController?.pushViewController(colorDetailedViewController, animated: true)
    }
    
}

//
//  WeatherViewController.swift
//  ParsingJson
//
//  Created by Mr Wonderful on 8/28/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet var weatherTableView: UITableView!
    var weatherData = [List](){
        didSet{
            DispatchQueue.main.async {
                self.weatherTableView.reloadData()
    
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
    func  setup(){
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
    }
    func fetchData(){
        WeatherAPIClient.shared.fetchWeatherData { (result) in
            switch result{
            case .failure(let error):
                print("failure to get data \(error)")
            case .success(let weather):
                self.weatherData = weather.list
            }
        }
    }
}

extension WeatherViewController: UITableViewDelegate{}
extension WeatherViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        cell.textLabel?.text = weatherData[indexPath.row].name
        cell.detailTextLabel?.text = weatherData[indexPath.row].weather[0].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weatherDetailedViewController = storyboard?.instantiateViewController(withIdentifier: "weatherDetailedViewController") as! WeatherDetailedViewController
        
        let detailInfo = weatherData[indexPath.row]
        
        weatherDetailedViewController.info = detailInfo
        
        self.navigationController?.pushViewController(weatherDetailedViewController, animated: true)
    }
}

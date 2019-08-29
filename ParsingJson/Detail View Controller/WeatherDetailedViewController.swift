//
//  WeatherViewController.swift
//  ParsingJson
//
//  Created by Mr Wonderful on 8/29/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class WeatherDetailedViewController: UIViewController {
    var info:List!
    @IBOutlet var locationName: UILabel!
    @IBOutlet var temp: UILabel!
    @IBOutlet var weatherDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    setupWeatherDetailVC()
    }
    
    func setupWeatherDetailVC(){
        locationName.text = info.name
        temp.text = "Temperature: \(info.main.temp)"
        weatherDescription.text = info.weather[0].description
    }
}

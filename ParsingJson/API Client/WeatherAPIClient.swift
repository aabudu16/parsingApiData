//
//  WeatherAPIClient.swift
//  ParsingJson
//
//  Created by Mr Wonderful on 8/28/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

struct WeatherAPIClient{
    static var shared = WeatherAPIClient()
    
    let weatherURL = "https://samples.openweathermap.org/data/2.5/box/city?bbox=12,32,15,37,10&appid=b6907d289e10d714a6e88b30761fae22"
    
    func fetchWeatherData(completion:@escaping (Result<ListWrapper,Error>) -> ()){
        
        guard let url = URL(string: weatherURL) else {return}
        
        URLSession.shared.dataTask(with: url) {(data, response, err) in
            //Error handler
            if let err = err{
                completion(.failure(err))
            }
            //success
            do {
                let weather = try JSONDecoder().decode(ListWrapper.self, from: data!)
                completion(.success(weather))
                
            }catch let jsonError{
                completion(.failure(jsonError))
            }
        
        }.resume()
    }
}

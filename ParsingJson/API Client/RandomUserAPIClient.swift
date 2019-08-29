//
//  RandomUserAPIClient.swift
//  ParsingJson
//
//  Created by Mr Wonderful on 8/29/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

struct RandomUserAPIClient{
   static let shared = RandomUserAPIClient()
let randomUserURL = "https://randomuser.me/api/?results=50"

    func fetchRandomData(complition:@escaping (Result<RandomUserWrapper, Error>) -> ()) {
        
        guard let url = URL(string: randomUserURL) else {return}
        
        URLSession.shared.dataTask(with: url) {(data, response, err) in
            
            if let err = err {
                complition(.failure(err))
            }
            
            do{
                let randomUser = try JSONDecoder().decode(RandomUserWrapper.self, from: data!)
                complition(.success(randomUser))
            }catch let jasonError{
                complition(.failure(jasonError))
            }
        }.resume()
        
    }
    
}

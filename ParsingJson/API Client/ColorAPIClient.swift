//
//  ColorAPIClient.swift
//  ParsingJson
//
//  Created by Mr Wonderful on 8/28/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

struct ColorAPIClient{
    static var shared = ColorAPIClient()
    
    let colorURL = "http://thecolorapi.com/scheme?hex=0047AB&rgb=0,71,171&hsl=215,100%25,34%25&cmyk=100,58,0,33&format=json&mode=analogic&count=6"
    
    func fetchColorData(completion: @escaping (Result<ColorWrapper,Error>) -> Void) {
        
        guard let url = URL(string: colorURL) else { return }
                
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                completion(.failure(err))
            }
            //success
            do {
                let color = try JSONDecoder().decode(ColorWrapper.self, from: data!)
                completion(.success(color))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
}

//
//  weatherModel.swift
//  ParsingJson
//
//  Created by Mr Wonderful on 8/28/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

struct ListWrapper:Codable{
    let list:[List]
}

struct List:Codable{
    let name:String
    let coord:Coord
    let main:Main
    let wind:Wind
   let weather: [Weather]
    
}

struct Coord:Codable{
    let lon:Double
    let lat:Double
}
struct Main:Codable{
    let temp:Double
    let humidity:Int
}

struct Wind:Codable{
    let deg:Double
}
struct Weather:Codable{
    let description:String
}

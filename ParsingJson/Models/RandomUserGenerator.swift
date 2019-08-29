//
//  RandomUserGenerator.swift
//  ParsingJson
//
//  Created by Mr Wonderful on 8/29/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

struct RandomUserWrapper:Codable{
    let results:[UserResult]
}

struct UserResult:Codable{
    let gender:String
    let name:Name
    let location:Location
    let email:String
    let dob:DOB
    let phone:String
}

struct Name:Codable{
    let title:String
    let first:String
    let last:String
}

struct Location:Codable{
    let street:String
    let city:String
    let state:String
   // let postcode:Int
}

struct DOB:Codable{
    let date:String
    let age:Int
}

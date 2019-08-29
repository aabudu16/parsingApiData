//
//  ColorModel.swift
//  ParsingJson
//
//  Created by Mr Wonderful on 8/28/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

struct ColorWrapper:Codable{
    let colors:[Color]
}

struct Color:Codable{
    let hex:Hex
    let rgb:Fraction
    let name:ColorName
}

struct Hex:Codable{
    let value:String
    let clean:String
}

struct Fraction:Codable {
    let fraction:Rgb
}

struct Rgb:Codable{
    let r:CGFloat
    let g:CGFloat
    let b:CGFloat
    
    func colorGenerator() -> UIColor {
        let uicolor = UIColor(red: r, green: g, blue: b, alpha: 1)
        return uicolor
    }
}

struct ColorName:Codable{
    let value:String
}

//
//  ColorDetailViewController.swift
//  ParsingJson
//
//  Created by Mr Wonderful on 8/29/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
var myDetailedColor:Color!
    
    @IBOutlet var colorName: UILabel!
    @IBOutlet var colorView: UIView!
    @IBOutlet var rgbValues: UILabel!
    @IBOutlet var hexValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupDetailedView()
    }
  func setupDetailedView(){
    colorName.text = myDetailedColor.name.value
    colorView.backgroundColor = myDetailedColor.rgb.fraction.colorGenerator()
    //rgbValues.text = "RGB Value: R:\(myDetailedColor.rgb.fraction.r) G:\(myDetailedColor.rgb.fraction.g) B:\(myDetailedColor.rgb.fraction.b)"
    hexValue.text = "HEX Value: \(myDetailedColor.hex.value)"
    }

}

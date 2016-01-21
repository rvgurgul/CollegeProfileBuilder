//
//  College.swift
//  CollegeProfileBuilder
//
//  Created by Richie Gurgul on 1/20/16.
//  Copyright © 2016 Richie Gurgul. All rights reserved.
//

import Foundation
import UIKit

class College
{
    var name: String
    var loc: String
    var num: Int
    var pic: UIImage
    
    init(Name: String, Loc: String, Pic: String, Num: Int)
    {
        name = Name
        loc = Loc
        num = Num
        pic = UIImage(named: Pic)!
    }
    
    init(Name: String, Loc: String, Num: Int)
    {
        name = Name
        loc = Loc
        num = Num
        pic = UIImage(named: "default")!
    }
    
}
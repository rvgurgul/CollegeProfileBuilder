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
    var page: String
    var name: String
    var loc: String
    var num: Int
    var pic: UIImage
    
    init(Name: String, Loc: String, Pic: String, Num: Int)
    {
        page = ""
        name = Name
        loc = Loc
        num = Num
        pic = UIImage(named: Pic)!
    }
    
    init(Page: String, Name: String, Loc: String, Pic: String, Num: Int)
    {
        page = Page
        name = Name
        loc = Loc
        num = Num
        pic = UIImage(named: Pic)!
    }
    
    init(Page: String, Name: String, Loc: String, Num: Int)
    {
        page = Page
        name = Name
        loc = Loc
        num = Num
        pic = UIImage(named: "default")!
    }
    
    init(Name: String, Loc: String, Num: Int)
    {
        page = ""
        name = Name
        loc = Loc
        num = Num
        pic = UIImage(named: "default")!
    }
    
}
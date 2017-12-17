//
//  CalendarCell.swift
//  calender
//
//  Created by Ikai Masahiro on 2017/12/17.
//  Copyright © 2017年 Ikai Masahiro. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    var textLabel: UILabel?
    var dailyItems:[Item]?
    var itemTitleLabel: UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textLabel = UILabel(frame: CGRect(x:0, y:5, width:self.frame.width, height:15))
        textLabel?.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        textLabel?.textAlignment = NSTextAlignment.center
        textLabel?.text = "none"
        
        itemTitleLabel  = UILabel()
        itemTitleLabel?.frame  = CGRect(x: 0, y: 20, width: self.frame.width, height: 10)
        itemTitleLabel?.font  = UIFont(name: "HiraKakuProN-W3", size: 9)
        itemTitleLabel?.textAlignment = NSTextAlignment.center
        itemTitleLabel?.lineBreakMode  = .byClipping
        setTitleLabelIsHidden(true)
        
        self.addSubview(textLabel!)
        self.addSubview(itemTitleLabel!)
    }
    func setItemNameLabel(){
        self.itemTitleLabel?.text  = ""
        
        if let items = self.dailyItems{
            for (index, item) in items.enumerated(){
                if index == 0 {
                    self.itemTitleLabel?.text = item.author
                }
            }
        }
    }
    
    func setTitleLabelIsHidden(_ bool:Bool){
        itemTitleLabel?.isHidden  = bool;
    }
    
}

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
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // UILabelを生成
        textLabel = UILabel(frame: CGRect(x:0, y:0, width:self.frame.width, height:self.frame.height))
        textLabel?.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        textLabel?.textAlignment = NSTextAlignment.center
        textLabel?.text = "none"
        
        // Cellに追加
        self.addSubview(textLabel!)
    }
    
}

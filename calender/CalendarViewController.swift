//
//  CalendarViewController.swift
//  calender
//
//  Created by Ikai Masahiro on 2017/12/17.
//  Copyright © 2017年 Ikai Masahiro. All rights reserved.
//

import UIKit

class CalnendarViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let dateManager = DateManager()
    let daysPerWeek: Int = 7
    let cellMargin: CGFloat = 2.0
    let weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    let headerDateFormat = "yyyy M"
    var selectedDate = Date()
    var today: NSDate!
    
    var headerTitle: UILabel!
    var calenderHeaderView: UIView!
    var calenderCollectionView: UICollectionView!
    
    init(){
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.white
        self.tabBarItem = UITabBarItem(title: "カレンダー", image:UIImage(named: "calendar-tab.png") , tag: 1)
        self.tabBarItem.selectedImage = UIImage(named: "calendar-tab-selected.png")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headerPrevButton = UIBarButtonItem(image: UIImage(named: "arrow-prev.png"), style: .plain, target: self, action: #selector(self.tappedHeaderPrevButton))
        let headerNextButton = UIBarButtonItem(image: UIImage(named: "arrow-next.png"), style: .plain, target: self, action: #selector(self.tappedHeaderNextButton))

        headerPrevButton.tintColor = .theme
        headerNextButton.tintColor = .theme
        
        self.navigationItem.leftBarButtonItem = headerPrevButton
        self.navigationItem.rightBarButtonItem = headerNextButton
        
        let layout = UICollectionViewFlowLayout()
        
        calenderCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        calenderCollectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "cell")
        calenderCollectionView.delegate = self
        calenderCollectionView.dataSource = self
        calenderCollectionView.backgroundColor = UIColor.white
        
        self.navigationItem.title = currentHeaderTitle(headerDateFormat)
        self.view.addSubview(calenderCollectionView)
    }

    
    
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Section毎にCellの総数を変える.
        if section == 0 {
            return 7
        } else {
            return dateManager.daysAcquisition()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CalendarCell
        
        if (indexPath.row % 7 == 0) {
            cell.textLabel?.textColor = .lightRed
        } else if (indexPath.row % 7 == 6) {
            cell.textLabel?.textColor = .lightBlue
        } else {
            cell.textLabel?.textColor = UIColor.gray
        }
        
        if indexPath.section == 0 {
            cell.textLabel?.text = weekArray[indexPath.row]
        } else {
            let dayLabelText:String = dateManager.conversionDateFormat(indexPath: indexPath, dateFormat: "d")
            cell.textLabel?.text = dayLabelText
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfMargin: CGFloat = 8.0
        let width: CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin) / CGFloat(daysPerWeek)
        let height: CGFloat = width * 1.25
        return CGSize(width:width, height:height)
        
    }
    
    //選択した時
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    //セルの垂直方向のマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    
    //セルの水平方向のマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
    
    func currentHeaderTitle(_ dateFormat:String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let selectMonth = formatter.string(from: selectedDate)
        return selectMonth
    }
    
    func tappedHeaderPrevButton() {
        selectedDate = dateManager.prevMonth(date: selectedDate)
        calenderCollectionView.reloadData()
        self.navigationItem.title = currentHeaderTitle(headerDateFormat)
    }
    
    func tappedHeaderNextButton() {
        selectedDate = dateManager.nextMonth(date: selectedDate)
        calenderCollectionView.reloadData()
        self.navigationItem.title = currentHeaderTitle(headerDateFormat)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

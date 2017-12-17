//
//  CalendarPageViewController.swift
//  calender
//
//  Created by Ikai Masahiro on 2017/12/17.
//  Copyright © 2017年 Ikai Masahiro. All rights reserved.
//

import UIKit

class CalendarPageViewController: UIPageViewController {
    var selectedDate = Date()
    let dateManager = DateManager()
    var pageViewControllers: [UIViewController] = []
    
    private var beforeIndex: Int = 0
    private var currentIndex: Int? {
        guard let viewController = viewControllers?.first else {
            return nil
        }
        return pageViewControllers.index(of: viewController)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentViewController = CalnendarViewController(dateManager)
        let yearAndMonth:String = currentViewController.yearAndMonth
        self.navigationItem.title = yearAndMonth
        // 初期化処理など
        dataSource = self
        delegate = self as? UIPageViewControllerDelegate
        automaticallyAdjustsScrollViewInsets = false
        
        setViewControllers(
            [currentViewController],
            direction: .forward,
            animated: false,
            completion: nil)
    }
}

// MARK: - UIPageViewControllerDataSource
extension CalendarPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        return makeNextViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return makePrevViewController()
    }
    
    func makePrevViewController() -> UIViewController{
        //selectedDate = dateManager.prevMonth(date: selectedDate)
        let prevViewController = CalnendarViewController(dateManager);
        prevViewController.tappedHeaderPrevButton()
        let yearAndMonth:String = prevViewController.yearAndMonth
        self.navigationItem.title = yearAndMonth
        return prevViewController;
    }
    
    func makeNextViewController() -> UIViewController{
        //selectedDate = dateManager.nextMonth(date: selectedDate)
        let nextViewController = CalnendarViewController(dateManager);
        nextViewController.tappedHeaderNextButton()
        let yearAndMonth:String = nextViewController.yearAndMonth
        self.navigationItem.title = yearAndMonth
        return nextViewController;
    }
    
}

//
//  BRBarTabControllerViewController.swift
//  BottleRocket
//
//  Created by Aleksandar Stojanovic on 12/10/21.
//

import UIKit


class BRBarTabController: UITabBarController, UITabBarControllerDelegate {
    private let internetsVC = InternetsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let barItem1 = UITabBarItem(title: "Internets", image: UIImage(systemName: "house"), tag: 1)
        internetsVC.tabBarItem = barItem1
        self.viewControllers?.append(internetsVC)
    }
    
   

}

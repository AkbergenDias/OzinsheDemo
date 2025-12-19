//
//  TabBarViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 07.12.2025.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
    }
    
    func setupTabs() {
        let HomeVC = HomeViewController()
        let SearchVC = SearchViewController()
        let FavoriteVC = FavoriteViewController()
        let ProfileVC = ProfileViewController()

        HomeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Home"), selectedImage: UIImage(named: "HomeSelected"))
        
        FavoriteVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Favorite"), selectedImage: UIImage(named: "FavoriteSelected"))
        
        SearchVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Search"), selectedImage: UIImage(named: "SearchSelected"))
        
        ProfileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Profile"), selectedImage: UIImage(named: "ProfileSelected"))
        
        setViewControllers([HomeVC, SearchVC, FavoriteVC, ProfileVC], animated: true)
    }
    


}

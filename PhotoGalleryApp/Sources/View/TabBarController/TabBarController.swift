//
//  TabBarController.swift
//  PhotoGalleryApp
//
//  Created by Виталик Молоков on 19.02.2023.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarController()
        setupTabBarViewControllers()
    }
    
    // MARK: - Setups
    
    func setupTabBarController() {
        tabBar.tintColor = .systemGray2
        tabBar.backgroundColor = .systemGray3
        tabBar.alpha = 0.8
    }
    
    func setupTabBarViewControllers() {
        let libraryController = LibraryViewController()
        let libraryIcon = UITabBarItem(title: "Library", 
                                       image: UIImage(systemName: "photo.fill.on.rectangle.fill"), 
                                       selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        libraryController.tabBarItem = libraryIcon
        let libraryNavigationController = UINavigationController(rootViewController: libraryController)
        
        let forYouController = ForYouViewController()
        let forYouIcon = UITabBarItem(title: "For You", 
                                      image: UIImage(systemName: "heart.text.square.fill"), 
                                      selectedImage: UIImage(systemName: "heart.text.square.fill"))
        forYouController.tabBarItem = forYouIcon
        let forYouNavigationController = UINavigationController(rootViewController: forYouController)
        
        let albumsController = AlbumsViewController()
        let albumsIcon = UITabBarItem(title: "Albums", 
                                      image: UIImage(systemName: "rectangle.stack.fill"), 
                                      selectedImage: UIImage(systemName: "rectangle.stack.fill"))
        albumsController.tabBarItem = albumsIcon
        let albumsNavigationController = UINavigationController(rootViewController: albumsController)
        
        let searchController = SearchViewController()
        let searchIcon = UITabBarItem(title: "Search", 
                                      image: UIImage(systemName: "magnifyingglass"), 
                                      selectedImage: UIImage(systemName: "magnifyingglass"))
        searchController.tabBarItem = searchIcon
        let searchNavigationController = UINavigationController(rootViewController: searchController)
        
        let controllers = [libraryNavigationController, forYouNavigationController, albumsNavigationController, searchNavigationController]
        self.setViewControllers(controllers, animated: true)
    }
}

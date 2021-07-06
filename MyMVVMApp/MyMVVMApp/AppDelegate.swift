//
//  AppDelegate.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 15/06/2021.
//

import UIKit
import FLEX

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let sextupleTap = UITapGestureRecognizer(target: self, action: #selector(showFLEXExplorer))
        sextupleTap.numberOfTapsRequired = 6
        self.window?.addGestureRecognizer(sextupleTap)
        window?.addGestureRecognizer(sextupleTap)

        if let window = window {

            let storyboard = UIStoryboard(name: "PokemonList", bundle: nil)
            guard let initialViewController = storyboard.instantiateViewController(withIdentifier: "PokemonList") as? PokemonListViewController else {
                return true
            }
            
            let viewModel = PokemonListViewModel(networkingService: DataManager.shared.networkingService, navigator: Navigator(initialViewController))

            initialViewController.viewModel = viewModel
            
            window.rootViewController = UINavigationController(rootViewController: initialViewController)
            window.makeKeyAndVisible()
        }

        return true
    }
    
    @objc private func showFLEXExplorer() {
        FLEXManager.shared.showExplorer()
    }
}


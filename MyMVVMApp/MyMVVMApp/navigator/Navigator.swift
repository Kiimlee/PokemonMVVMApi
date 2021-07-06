//
//  Navigator.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 28/06/2021.
//

import UIKit

class Navigator: NavigatorProtocol {
    
    // MARK: Dependencies
    
    private weak var viewController: UIViewController?
    
    // MARK: Init
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func toPokemonDetails(with id: Int) {
        let storyboard = UIStoryboard(name: "PokemonDetails", bundle: nil)
        
        guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: "PokemonDetails") as? PokemonDetailsViewController else {
            return
        }
        
        // Avoir qu'une seule instance du NetworkingApi
        let viewModel = PokemonDetailsViewModel(networkingService: DataManager.shared.networkingService, pokemonId: id)
        
        detailsViewController.viewModel = viewModel
        detailsViewController.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

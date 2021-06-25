//
//  PokemonDetailsViewController.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 25/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class PokemonDetailsViewController: UIViewController {
    var pokemon: Pokemon?
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    private func prepareView() {
        guard let pokemon = pokemon else {
            return
        }
        
        nameLabel.text = pokemon.name
        pokemonImageView.load(urlString: pokemon.imageUrl)
    }
}

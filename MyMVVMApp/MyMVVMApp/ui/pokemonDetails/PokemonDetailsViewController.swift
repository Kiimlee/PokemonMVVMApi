//
//  PokemonDetailsViewController.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 25/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class PokemonDetailsViewController: UIViewController, Subscribable {
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    private var pokemon: Pokemon?
    var viewModel: PokemonDetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        observeViewData()
        viewModel?.onViewDidLoad()
    }
    
    private func prepareView(with pokemon: Pokemon?) {
        guard let pokemon = pokemon else {
            return
        }
        
        nameLabel.text = pokemon.name
        if let url = URL(string: pokemon.imageUrl) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.pokemonImageView.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
        
    private func observeViewData() {
        guard let viewModel = viewModel else {
            return
        }
        
        sub(viewModel.stateSubject.subscribe(onNext: { [weak self] state in
            switch state {
            case .loading:
                print("loading")
                
            case .loaded(let pokemon):
                self?.prepareView(with: pokemon)
            }
        }))
    }

}

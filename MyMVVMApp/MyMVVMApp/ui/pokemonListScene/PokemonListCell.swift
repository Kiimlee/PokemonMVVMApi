//
//  PokemonListCell.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 23/06/2021.
//

import UIKit

class PokemonListCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    func configure(with pokemon: Pokemon) {
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
}

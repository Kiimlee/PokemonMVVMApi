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
        pokemonImageView.load(urlString: pokemon.imageUrl)
    }
}

extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

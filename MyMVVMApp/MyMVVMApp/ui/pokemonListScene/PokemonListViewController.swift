//
//  PokemonListViewController.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 23/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class PokemonListViewController: UIViewController, Subscribable {
    var viewModel: PokemonListViewModel?
    private var pokemons: [Pokemon] = []

    @IBOutlet weak var pokemonTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        observeViewData()
        viewModel?.onViewDidLoad()
    }
    
    private func observeViewData() {
        guard let viewModel = viewModel else {
            return
        }
        
        sub(viewModel.stateSubject.subscribe(onNext: { [weak self] state in
            switch state {
            case .loading:
                print("loading")
                
            case .loaded(let pokemons):
                self?.updateTableView(with: pokemons)
            }
        }))
    }
}

extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                              withIdentifier: "PokemonListCell",
                for: indexPath) as? PokemonListCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: pokemons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.goToDetails(with: pokemons[indexPath.row].id)
    }
    
    private func updateTableView(with pokemons: [Pokemon]) {
        self.pokemons = pokemons
        pokemonTableView.reloadData()
    }
}

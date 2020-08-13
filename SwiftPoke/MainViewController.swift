//
//  ViewController.swift
//  SwiftPoke
//
//  Created by kengo kato on 2020/08/08.
//  Copyright © 2020 K K. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var pokemonList: [PokeMon]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "PokeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PokeCollectionViewCell")
        
        
        
        getAddress {
            self.collectionView.reloadData()
        }
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width, height: 100)
        collectionView.collectionViewLayout = layout
    }
    
    
    
    private func getAddress(complete: @escaping(() -> ())) {
        let baseUrl = "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/pokedex.json"
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        AF.request(baseUrl, method: .get, encoding: URLEncoding(destination: .queryString), headers: headers).responseJSON { response in
            guard let data = response.data else {
                return
            }
            do {
                self.pokemonList =  try JSONDecoder().decode([PokeMon].self, from: data)
                complete()
             } catch let error {
                print("Error: \(error)")
                complete()
            }
        }
    }


}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let pokemonList = self.pokemonList else {
            return 0
        }
        return pokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCollectionViewCell", for: indexPath)

        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {

        return 0.0

    }
    
    /// 縦のスペース
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {

        return 0.0

    }
    
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? PokeCollectionViewCell, let model = self.pokemonList {
            cell.setupCell(model: model[indexPath.row])
        }
    }
}


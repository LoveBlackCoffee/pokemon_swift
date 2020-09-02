//
//  PokemonDetailViewController.swift
//  SwiftPoke
//
//  Created by kengo kato on 2020/08/30.
//  Copyright © 2020 K K. All rights reserved.
//

import UIKit
import Alamofire

class PokeMonDetailViewController: UIViewController {
    private var data: PokeMon!
    @IBOutlet weak var charactorImage: UIImageView!
    
    
    func config(data: PokeMon) {
        self.data = data
        
        let url = "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/"
        let png = ".png"
        let imageURL = url + String(format:"%03d", data.id) + png
        
        AF.request(imageURL).response { (data) in
            if let data = data.data {
                self.charactorImage.image = UIImage(data: data)
            }
        }
    }
    
}

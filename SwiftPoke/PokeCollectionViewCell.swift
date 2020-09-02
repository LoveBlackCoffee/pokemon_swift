//
//  PokeCollectionViewCell.swift
//  SwiftPoke
//
//  Created by kengo kato on 2020/08/09.
//  Copyright © 2020 K K. All rights reserved.
//

import UIKit
import Alamofire

class PokeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var charactorImage: UIImageView!
    @IBOutlet weak var charactorNoLabel: UILabel!
    @IBOutlet weak var charactorNameLabel: UILabel!
    @IBOutlet weak var typeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
                // Initialization code
    }
    
    func setupCell(model: PokeMon) {
        let url = "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/sprites/"
        let png = "MS.png"
        let imageURL = url + String(format:"%03d", model.id) + png
        
        AF.request(imageURL).response { (data) in
            if let data = data.data {
                self.charactorImage.image = UIImage(data: data)
            }
        }
        
        charactorNoLabel.text = "No." + String(format:"%03d", model.id)
        charactorNameLabel.text = model.name.japanese
        
    }
}

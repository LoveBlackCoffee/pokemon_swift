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
    
    func reset() {
        charactorImage.image = nil
        charactorNoLabel.text = nil
        charactorNameLabel.text = nil
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
        
        typeColor()
    }
    
    func typeColor() {
        let startColor = UIColor.red.cgColor
        let endColor = UIColor.blue.cgColor
        let layer = CAGradientLayer()
        layer.colors = [startColor, endColor]
        layer.frame = typeView.bounds
        layer.startPoint = CGPoint(x: 1, y: 0.5)
        layer.endPoint = CGPoint(x: 0, y: 0.5)
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 200, y: 100))
        linePath.addLine(to: CGPoint(x: 300, y: 100))
        let lineLayer = CAShapeLayer()
        lineLayer.path = linePath.cgPath
        lineLayer.strokeColor = UIColor.black.cgColor
        lineLayer.lineWidth = 5
        
        
        typeView.layer.addSublayer(layer)
        
        
        
    }

}

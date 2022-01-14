//
//  CelulaBanner.swift
//  Animais
//
//  Created by Jardel on 06/12/21.
//

import UIKit



class CelulaBanner: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var shadowView: UIView! {
        didSet {
            self.shadowView.backgroundColor = .clear
            self.shadowView.layer.cornerRadius = 10.0
        }
    }
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel! {
        didSet {
            self.productNameLabel.textColor = .white
            self.productNameLabel.isHidden = true
        }
    }
    
    // MARK: - Cell Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        CAGradientLayer.setDropShadow(layer: self.shadowView.layer, radius: 4.0, opacity: 0.8)
    }
    
    func configure(product: String, tamanho: Bool) {
     
        DispatchQueue.main.async {
            print("entrei aqui ", tamanho)
            UIView.transition(with: self.bannerImage, duration: 0.2, options:
                                [.transitionCrossDissolve], animations: {

                self.bannerImage.image =  tamanho ? UIImage (named: "Bannerp") : UIImage (named: "Bannerr")
                self.bannerImage.layoutIfNeeded()
            })
                   
            
//            UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 5 , animations: {
//
//                self.bannerImage.image =  tamanho ? UIImage (named: "Bannerp") : UIImage (named: "Bannerr")
//                self.bannerImage.layoutIfNeeded()
//            })
        }
        
        
    }
    
    func nova(tamanho: Bool){
        print("o tamanho que vem ", tamanho)
    }

}


extension CALayer {
    
//    public class var charcoalGray : UIColor {
//        return UIColor(hex: "484848")
//    }
    
    public static func setDropShadow(layer : CALayer, radius : CGFloat, opacity : Float) {
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowRadius = radius
      //  layer.shadowColor = UIColor.charcoalGray.withAlphaComponent(0.3).cgColor
        layer.shadowOpacity = opacity
    }
    
    public static func setDropShadowBottom(layer : CALayer, opacity : Float, color : UIColor? = nil) {
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = opacity
        layer.shadowRadius = 5.0
     //   layer.shadowColor = color != nil ? color?.withAlphaComponent(1.0).cgColor : UIColor.charcoalGray.withAlphaComponent(0.3).cgColor
    }
    
    public static func removeDropShadow(layer: CALayer){
        CALayer.setDropShadow(layer: layer, radius: 10, opacity: 0)
    }
}



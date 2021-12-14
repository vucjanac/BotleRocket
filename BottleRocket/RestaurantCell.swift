//
//  RestaurantCell.swift
//  BottleRocket
//
//  Created by Aleksandar Stojanovic on 12/10/21.
//

import UIKit

class RestaurantCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var restaurantName: UILabel?
    @IBOutlet var restaurantCategory: UILabel?
    
    
    func updateCellWith(_ restaurants: RestaurantModel) {
        restaurantName?.text = restaurants.name
        restaurantCategory?.text = restaurants.category
        
        if let imageData = UserDefaults.standard.data(forKey: restaurants.backgroundImageURL!) {
            imageView?.image = UIImage(data: imageData)
        } else {
            if let url = URL(string: restaurants.backgroundImageURL!) {
                URLSession.shared.dataTask(with: url) { [weak self] imageData, _, _ in
                    if let data = imageData {
                        DispatchQueue.main.async {
                            self?.imageView?.image = UIImage(data: data)
                            
                            UserDefaults.standard.set(data, forKey: restaurants.backgroundImageURL!)
                        }
                    }
                }.resume()
            }
        }
    }
}

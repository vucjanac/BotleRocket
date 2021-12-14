//
//  ViewController.swift
//  BottleRocket
//
//  Created by Aleksandar Stojanovic on 12/10/21.
//

import UIKit


class ViewController: UICollectionViewController {
    
    var restaurants = [RestaurantModel]()
    
    var flowLayout = UICollectionViewFlowLayout()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        let urlString = "https://s3.amazonaws.com/br-codingexams/restaurants.json"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                self.parse(json: data)
            }
        }
        let mapImage = UIImage(named: "icon_map")
        let barButtonItem = UIBarButtonItem(image: mapImage, style: .plain, target: self, action: #selector(goToMapView))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func goToMapView() {
        let vc = MapViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonRestaurants = try? decoder.decode(Restaurants.self, from: json) {
            restaurants = jsonRestaurants.restaurants
            collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Restaurants", for: indexPath) as? RestaurantCell
        else {
            fatalError("Diet time!")
        }
//        cell.restaurantName?.text = restaurants[indexPath.row].name
//        cell.restaurantCategory?.text = restaurants[indexPath.row].category
        let model = restaurants[indexPath.row]
        cell.updateCellWith(model)
        cell.backgroundColor = .gray
        
        return cell
    }
    
   
    

}

extension ViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 180)
    }
    
}

//
//  RecipesViewController.swift
//  project1-foodrecipes
//
//  Created by Tomas Mateo Perotti on 21/05/2019.
//  Copyright © 2019 Tomas Mateo Perotti. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {

    private var recipesImagesList: [String]!
    private var recipesTitlesList: [String]!
    private var recipesDescriptionList: [String]!
    
    @IBAction func tapOnRecipe(_ sender: Any) {
       
    }
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        recipesImagesList = ["pork", "pasta", "fish", "burguer"]
        recipesTitlesList = ["Pork with vegetables", "Pasta with cheese", "Fish with cilantro", "Burguer with potatoes"]
        recipesDescriptionList = ["An amazing pork with selected vegetables.", "An italian sauce and a good pasta, the perfect match.", "Fish with amazing herbs and flavour.", "The classic burguer with potatoes made easy."]
    }
}

extension RecipesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipesCell", for: indexPath) as! RecipesCollectionViewCell
        cell.dishImageVIew.image = UIImage(named: recipesImagesList[indexPath.row])
        cell.dishTitleLabel.text = recipesTitlesList[indexPath.row]
        cell.descriptionLabel.text = recipesDescriptionList[indexPath.row]
        //This creates the shadows and modifies the cards a little bit
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    
}

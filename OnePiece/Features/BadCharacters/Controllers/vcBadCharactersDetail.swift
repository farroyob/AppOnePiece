//
//  vcBadCharactersDetailViewController.swift
//  OnePiece
//
//  Created by Freddy A. on 7/10/21.
//

import UIKit

class vcBadCharactersDetail: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var mgCharacter: UIImageView!
    @IBOutlet weak var tvInfo: UITextView!
    @IBOutlet weak var lbName: UILabel!
    
    // MARK: IBActions
    
    // MARK: Public properties
    
    var character: eCharacter?
    
    // MARK: Private properties
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "clApp")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.navigationItem.title = "Personaje"
        
        tabBarController?.tabBar.barTintColor = UIColor(named: "clApp")
        tabBarController?.tabBar.tintColor = UIColor.white
        
        tvInfo.layer.cornerRadius = 8.0
        tvInfo.layer.shadowColor = UIColor.gray.cgColor
        tvInfo.layer.shadowOffset = CGSize.zero
        tvInfo.layer.shadowOpacity = 0.7
        tvInfo.layer.shadowRadius = 4.0
        
        guard let vlcImage = character?.bigImage else { return }
        
        mgCharacter.image = UIImage(named: vlcImage)
        tvInfo.text = character?.information
        lbName.text = character?.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //navigationController?.isNavigationBarHidden = true
    }
    // MARK: Public Funcionts
    
    // MARK: Private Funcionts
    
}

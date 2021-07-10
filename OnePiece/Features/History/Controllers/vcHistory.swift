//
//  vcHistory.swift
//  OnePiece
//
//  Created by Freddy A. on 7/8/21.
//

import UIKit

class vcHistory: UIViewController {
    
    // MARK: IBOutlets
    
    // MARK: IBActions
    
    // MARK: Public properties
    
    // MARK: Private properties
    
    // MARK: Public Funcionts
    
    // MARK: Private Funcionts//
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "clApp")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        self.navigationItem.title = "Historial"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
    }
}

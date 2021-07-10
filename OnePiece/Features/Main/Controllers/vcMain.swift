//
//  ViewController.swift
//  OnePiece
//
//  Created by Freddy A. on 6/30/21.
//

import UIKit

class vcMain: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var btQuit: UIButton!
    
    // MARK: IBActions
    @IBAction func btQuitAction(_ sender: Any) {
        exit(0)
    }
    
    // MARK: Public properties
    
    // MARK: Private properties
    
    // MARK: Public Funcionts
    
    // MARK: Private Funcionts//
          
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
}

//
//  vc_Splash.swift
//  OnePiece
//
//  Created by Freddy A. on 7/8/21.
//

import UIKit

class vcSplash: UIViewController {
    
    // MARK: IBOutlets
        
    @IBOutlet weak var aiWait: UIActivityIndicatorView!
    
    
    // MARK: IBActions
    
    // MARK: Public properties
    
    // MARK: Private properties
        
    // MARK: Public Funcionts
    
    // MARK: Private Funcionts//
    
    private func loadData(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) { [weak self] in
            //self?.performSegue(withIdentifier: "sgSplashToMain", sender: nil)
                      
            
            let sbMain = UIStoryboard(name: "sbMain", bundle: nil);
            
            if let vvcDestination = sbMain.instantiateInitialViewController(){
                self?.navigationController?.setViewControllers([vvcDestination]
                                                               , animated: true)
            }
        }
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true;
        
        aiWait.startAnimating();
        
        loadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
        aiWait.stopAnimating()
    }
    
}

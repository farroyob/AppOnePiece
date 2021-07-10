//
//  vcBadCharacters.swift
//  OnePiece
//
//  Created by Freddy A. on 7/8/21.
//

import UIKit

class vcBadCharacters: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tdData: UITableView!
    
    // MARK: IBActions
    
    // MARK: Public properties
    
    // MARK: Private properties
    
    private var characters: eCharacters = []
    private let charactersData = Character()
    
    // MARK: Public Funcionts
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? vcBadCharactersDetail,
              let character = sender as? eCharacter else        {
            return
            
        }
        
        destination.character = character
    }
    
    //si se quiere hacer el enlace directamente --> sin el tercer metodo seria
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? {NombreViewControllerDetalle --> ejemplo vcBadCharactersDetail},
              let character = sender as? UITableViewCell else        {
            return
            
        }
        
         if let indexPath = tdData.indexPath(for: characterSelected),
         indexPath.row < characters.count {
         let character = characters[indexPath.row]
         destination.character = character
         }
         
        
        destination.character = character
    }
         */
    // MARK: Private Funcionts//
    
    private func loadData(){
        characters = charactersData.badCharacterSample
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "clApp")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.navigationItem.title = "Otros Personajes"
        
        tabBarController?.tabBar.barTintColor = UIColor(named: "clApp")
        tabBarController?.tabBar.tintColor = UIColor.white
        
        tdData.delegate = self
        tdData.dataSource = self
        
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //navigationController?.isNavigationBarHidden = false
    }
}

extension vcBadCharacters: UITableViewDelegate, UITableViewDataSource{
    
    //Cuantas filas tiene cada seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: vcBadCharacterCell.cellIdentifier
                                                 , for: indexPath) as? vcBadCharacterCell
        
        if indexPath.row < characters.count {
            let character = characters[indexPath.row]
            
            cell?.configureView(pvoCharacter: character)
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < characters.count {
            let character = characters[indexPath.row]
            
            // Option 1: Segue
            performSegue(withIdentifier: "SG_FROM_BADCHARACTER_TO_DETAILS"
                         , sender: character)
        }
    }
}

//
//  vcGoodCharacters.swift
//  OnePiece
//
//  Created by Freddy A. on 7/8/21.
//

import UIKit

class vcGoodCharacters: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tbData: UITableView!
    
    // MARK: IBActions
    
    // MARK: Public properties
    
    // MARK: Private properties
    
    private var characters: eCharacters = []
    private let charactersData = Character()
    
    // MARK: Public Funcions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? vcGoodCharactersDetail,
              let character = sender as? eCharacter else        {
            return
            
        }
        
        destination.character = character
    }
    
    // MARK: Private Funcions
    
    private func loadData(){
        characters = charactersData.mainCharacterSample
    }
        
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
            Registramos la vista creada en el XIB vcGoodCharacterCell.xib
            y la asociamos al identificador "vcGoodCharacterCell" para
            que la tabla sepa que existe esa vista y la podamos utilizar
         
            tableView?.register(UINib(nibName: "{NombreDeLaClase}",
                                        bundle: nil),
                                    forCellReuseIdentifier: "{NombreIdentifier de la Celda (Static)}")
         */
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "clApp")
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.navigationItem.title = "Tripulación de Luffy"
        
        tabBarController?.tabBar.barTintColor = UIColor(named: "clApp")
        tabBarController?.tabBar.tintColor = UIColor.white
        
        tbData.delegate = self
        tbData.dataSource = self
        
        loadData()
        //tbData.reloadData()
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

// MARK: Extensions

extension vcGoodCharacters: UITableViewDelegate, UITableViewDataSource{
    
    //Cuantas filas tiene cada seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: vcGoodCharacterCell.cellIdentifier
                                                 , for: indexPath) as? vcGoodCharacterCell
        
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
            
            performSegue(withIdentifier: "SG_FROM_GOODCHARACTER_TO_DETAILS"
                         , sender: character)
            
            
            // Opcion 2: Navigation Controller
            /*
            let sbDetails = UIStoryboard(name: "Destination", bundle: nil)
            
            if let destination = sbDetails.instantiateInitialViewController() as? vcGoodCharactersDetail{
                destination.character = character
                navigationController?.pushViewController(destination, animated: true)
            }
 */
        }
    }
}



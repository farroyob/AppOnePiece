//
//  vcBadCharacterCell.swift
//  OnePiece
//
//  Created by Freddy A. on 7/10/21.
//

import UIKit

class vcBadCharacterCell: UITableViewCell{
    static let cellIdentifier: String = String(describing: vcBadCharacterCell.self)
    
    // MARK: IBOutlets
    
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var mgCharacter: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbType: UILabel!
    @IBOutlet weak var lbPosition: UILabel!
    
    // MARK: IBActions
    
    // MARK: Public properties
    
    // MARK: Private properties
    
    // MARK: Lifecycle
    
    /// Se llama cuando se crea la celda, la primera vez
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        vwContainer.layer.cornerRadius = 4.0
        vwContainer.layer.shadowColor = UIColor.gray.cgColor
        vwContainer.layer.shadowOffset = CGSize.zero
        vwContainer.layer.shadowOpacity = 0.7
        vwContainer.layer.shadowRadius = 4.0
        
        mgCharacter.layer.cornerRadius = 4.0
        mgCharacter.layer.shadowColor = UIColor.gray.cgColor
        mgCharacter.layer.shadowOffset = CGSize.zero
        mgCharacter.layer.shadowOpacity = 0.7
        mgCharacter.layer.shadowRadius = 4.0
    }
    
    /// se llama cuando se reutiliza la celda
    override func prepareForReuse() {
        super.prepareForReuse()
        
        mgCharacter.image = nil
        lbName.text = nil
        lbType.text = nil
        lbPosition.text = nil
    }
    
    // MARK: Public Funcionts
    func configureView(pvoCharacter: eCharacter){
        assignValue(pvcImage: pvoCharacter.image)
        assignValue(pvcname: pvoCharacter.name)
        assignValue(pvcType: pvoCharacter.type)
        assignValue(pvcPosition: pvoCharacter.position)
    }
    
    // MARK: Private Funcionts
    
    private func assignValue(pvcImage: String?){
        self.mgCharacter.image = UIImage(named: pvcImage ?? "")
    }
    
    private func assignValue(pvcname: String?){
        self.lbName.text = pvcname
    }
    
    private func assignValue(pvcType: String?){
        self.lbType.text = pvcType
    }
    
    private func assignValue(pvcPosition: String?){
        self.lbPosition.text = pvcPosition
    }
}

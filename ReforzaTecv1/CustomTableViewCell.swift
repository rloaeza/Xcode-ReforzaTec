//
//  CustomTableViewCell.swift
//  ReforzaTecv1
//
//  Created by Omar Rico on 7/17/17.
//  Copyright © 2017 TecUruapan. All rights reserved.
//

import UIKit

protocol BtnBorrarMateriaDelegate : class {
    func eliminarMateria (_ materia: CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {
    var referenciaCD : Materia?
    weak var delegate:BtnBorrarMateriaDelegate?
    var cellExists : Bool = false
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var detailsView: UIView! {
        didSet {
            detailsView?.isHidden = true
            detailsView?.alpha = 0
        }
    }
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var openButton: UIButton!
   
    
    @IBOutlet weak var descripcionTextView: UITextView!
    @IBOutlet weak var removeButton: UIButton!
//    @IBOutlet weak var alturaConstrain: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       self.selectionStyle = UITableViewCellSelectionStyle.none
        
    }
    
    func animate(duration : Double, c: @escaping () -> Void) {
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModePaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: duration, animations: {
                self.detailsView.isHidden = !self.detailsView.isHidden
                if self.detailsView.alpha == 1 {
                    self.detailsView.alpha = 0.5
                }else {
                    self.detailsView.alpha = 1
                }
            })
        }, completion: { (finished : Bool) in
            //print("Animation completed")
            c()
            
        })
    }
    
    @IBAction func removeMateria(_ sender: Any) {
       // print("\(nombreLabel.text!) is goiong to be deleted")
        delegate?.eliminarMateria(self)
        
    }
    
}



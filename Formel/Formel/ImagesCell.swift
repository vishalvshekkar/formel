//
//  ImagesCell.swift
//  Formel
//
//  Created by Vishal V Shekkar on 29/05/16.
//  Copyright © 2016 Vishal V. Shekkar. All rights reserved.
//

import UIKit

class ImagesCell: UITableViewCell, Reusable {

    static var nib: UINib? {
        return UINib(nibName: String(ImagesCell.self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
}

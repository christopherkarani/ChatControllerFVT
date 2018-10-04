//
//  ChatCell.swift
//  ChatDesign
//
//  Created by Chris Karani on 10/3/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit
import SnapKit

class ChatCell: UICollectionViewCell {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        backgroundColor = .yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

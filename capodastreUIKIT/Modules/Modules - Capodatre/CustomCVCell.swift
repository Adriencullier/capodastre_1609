//
//  CustomCVCell.swift
//  CustomCVCell
//
//  Created by Adrien Cullier on 08/09/2021.
//

import Foundation
import UIKit

class CustomCVCell : UICollectionViewCell {
    
    private var cellLabel : UILabel = {
        let cellLabel = UILabel()
        cellLabel.textAlignment = .center
        return cellLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cellLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCell (_ note : Note) {
        setupConstraints()
        self.backgroundColor = .gray
        self.layer.cornerRadius = 10
        cellLabel.text = note.name
    }
    
    private func setupConstraints() {
        cellLabel.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor)
    }
}

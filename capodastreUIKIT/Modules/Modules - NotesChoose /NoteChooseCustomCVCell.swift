//
//  NoteChooseCustomCVCell.swift
//  NoteChooseCustomCVCell
//
//  Created by Adrien Cullier on 09/09/2021.
//

import Foundation
import UIKit

class NoteChooseCustomCVCell : UICollectionViewCell {
    
    private var cellLabel : UILabel = {
        let cellLabel = UILabel()
        cellLabel.textAlignment = .center
        cellLabel.textColor = .white
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
        self.backgroundColor = UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00)
        self.layer.cornerRadius = 10
        cellLabel.text = note.name
    }
    
    private func setupConstraints() {
        cellLabel.anchor(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor)
    }
}

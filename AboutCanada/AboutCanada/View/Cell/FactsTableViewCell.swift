//
//  FactsTableViewCell.swift
//  AboutCanada
//
//  Created by Mohd Prophet on 06/12/21.
//

import UIKit

class FactsTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }

    lazy var factImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.backgroundColor = UIColor.lightGray
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 40
        img.clipsToBounds = true
        return img
    }()
    
    lazy var factTitleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var factDescriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        setupCellView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
        
}

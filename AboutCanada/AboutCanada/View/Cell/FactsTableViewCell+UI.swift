//
//  FactsTableViewCell+UI.swift
//  AboutCanada
//
//  Created by Mohd Prophet on 06/12/21.
//

extension FactsTableViewCell {
    func setupCellView(){
            //Add ImageView and labels to contentView
        contentView.addSubview(factImageView)
        contentView.addSubview(factTitleLabel)
        contentView.addSubview(factDescriptionLabel)
        addConstraints()
    }
    
    private func addConstraints(){
            //FactImageView Constraints
        factImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        factImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        factImageView.widthAnchor.constraint(equalToConstant:80).isActive = true
        factImageView.heightAnchor.constraint(equalToConstant:80).isActive = true
        factImageView.bottomAnchor.constraint(lessThanOrEqualTo:self.contentView.bottomAnchor, constant:-10).isActive = true
        
            //FactTitleLabel Constraints
        factTitleLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor,constant: 10).isActive = true
        factTitleLabel.leadingAnchor.constraint(equalTo:self.factImageView.trailingAnchor,constant: 10).isActive = true
        factTitleLabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor,constant: -10).isActive = true
        
            //FactDescriptionLabel Constraints
        factDescriptionLabel.topAnchor.constraint(equalTo:self.factTitleLabel.bottomAnchor,constant: 4).isActive = true
        factDescriptionLabel.leadingAnchor.constraint(equalTo:self.factTitleLabel.leadingAnchor).isActive = true
        factDescriptionLabel.trailingAnchor.constraint(equalTo:self.factTitleLabel.trailingAnchor).isActive = true
        factDescriptionLabel.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor,constant: -10).isActive = true
        
    }
    
}

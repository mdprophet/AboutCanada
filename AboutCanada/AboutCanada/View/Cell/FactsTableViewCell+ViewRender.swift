//
//  FactsTableViewCell+ViewRender.swift
//  AboutCanada
//
//  Created by Mohd Prophet on 06/12/21.
//

extension FactsTableViewCell{
    func populateCell(data: Fact){
        self.factTitleLabel.text = (data.title != nil) ? data.title : "Title Not Available"
        self.factDescriptionLabel.text = (data.description != nil) ? data.description : "Description Not Available"
        if let factImageUrl = data.imageHref {
            self.factImageView.setImageFromUrl(urlSting: factImageUrl)
        }
    }
}

//
//  DocumentCell.swift
//  Sample Project
//
//  Created by Dhawal Mahajan on 21/03/24.
//

import UIKit

class DocumentCell: UITableViewCell {
    
    //MARK: Properties
    private struct K {
        static let defaultSpacing: CGFloat = 8
        static let defaultWidthAndHeight: CGFloat = 72
        static let BASE_URL = "https://static01.nyt.com/"
    }
    static let identifier = "TableCell"
    
    lazy var documentImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        return iv
    }()
    lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(documentImage)
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        subtitle.text = nil
        documentImage.image = nil
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate(
            [
                documentImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: K.defaultSpacing),
                documentImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: K.defaultSpacing),
            documentImage.widthAnchor.constraint(equalToConstant: K.defaultWidthAndHeight),
                documentImage.heightAnchor.constraint(equalToConstant: K.defaultWidthAndHeight),
            
            title.leadingAnchor.constraint(equalTo: documentImage.trailingAnchor,constant: K.defaultSpacing),
                title.topAnchor.constraint(equalTo: contentView.topAnchor),
                title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor ,constant: -K.defaultSpacing),
            
            
            subtitle.leadingAnchor.constraint(equalTo: documentImage.trailingAnchor,constant: K.defaultSpacing),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor),
                subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -K.defaultSpacing),
                subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -K.defaultSpacing)
        ])
    }
    
    func configureCell(doc:Doc) {
        title.text = doc.headline.main
        subtitle.text = doc.abstract
        let urlString = K.BASE_URL + (doc.multimedia.first?.url ?? "")
        documentImage.setImageFromUrl(ImageURL: urlString)
    }
    
}




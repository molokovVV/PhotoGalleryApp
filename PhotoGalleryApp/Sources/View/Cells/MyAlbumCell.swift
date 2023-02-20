//
//  MyAlbumCell.swift
//  PhotoGalleryApp
//
//  Created by Виталик Молоков on 01.02.2023.
//

import UIKit

class MyAlbumCell: UICollectionViewCell {
    
    static let identifier = "MyAlbumCell"
    
    // MARK: - Outlets
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let footerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        contentView.addSubview(containerView)
        contentView.addSubview(image)
        containerView.addSubview(footerLabel)
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(17)
        }
        
        image.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(180)
        }
        footerLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Configuration
    
    func configure(model: CompositionalModel) {
        self.image.image = model.image
        self.footerLabel.text = model.description
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        self.footerLabel.text = nil
    }
}

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
        contentView.addSubview(image)
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(contentView)
        }
    }
    
    // MARK: - Configuration
    
    func configure(model: CompositionalModel) {
        self.image.image = model.image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
}

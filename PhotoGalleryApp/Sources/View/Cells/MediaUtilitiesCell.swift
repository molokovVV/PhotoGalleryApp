//
//  MediaTypesCell.swift
//  PhotoGalleryApp
//
//  Created by Виталик Молоков on 01.02.2023.
//

import UIKit

class MediaUtilitiesCell: UICollectionViewCell {
    
    static let identifier = "MediaUtilitiesCell"
    
    // MARK: - Outlets
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemGray2
        imageView.contentMode = .scaleAspectFit
        imageView.image = .init(systemName: "chevron.right")
        return imageView
    }()
    
    let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()
    
    //MARK: - Setups
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.addSubview(chevronImageView)
        contentView.addSubview(separatorLine)
        contentView.addSubview(iconImageView)
        contentView.clipsToBounds = true
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(-2)
            make.bottom.equalToSuperview()
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
        
        label.snp.makeConstraints { make in
            make.left.equalTo(iconImageView).offset(50)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        chevronImageView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }

        separatorLine.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview()
            make.leading.equalToSuperview().offset(50)
            make.height.equalTo(1.0)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        chevronImageView.image = nil
        label.text = nil
    }
    
    public func configure(model: CompositionalModel) {
        label.text = model.description
        iconImageView.image = model.image
    }
}

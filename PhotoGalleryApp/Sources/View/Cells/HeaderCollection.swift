//
//  HeadersAndFootersCell.swift
//  PhotoGalleryApp
//
//  Created by Виталик Молоков on 09.02.2023.
//

import UIKit

class HeaderCollection: UICollectionReusableView {
    
    static let identifier = "HeaderCollection"
    
    // MARK: - Outlets
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        return label
    }()
    
    private let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
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
        addSubview(title)
        addSubview(separatorLine)
    }
    
    private func setupLayout() {
        title.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }
        
        separatorLine.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(1.0)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}

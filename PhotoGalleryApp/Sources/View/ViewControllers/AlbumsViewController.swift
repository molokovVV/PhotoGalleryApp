//
//  ViewController.swift
//  PhotoGalleryApp
//
//  Created by Виталик Молоков on 31.01.2023.
//

import UIKit
import SnapKit

class AlbumsViewController: UIViewController {
    
    //MARK: - Properties
    
    let navigation = UINavigationController()
    
    // MARK: - Outlets
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, 
                                              collectionViewLayout: layout)
        collectionView.register(MediaUtilitiesCell.self, 
                                forCellWithReuseIdentifier: MediaUtilitiesCell.identifier)
        collectionView.register(MyAlbumCell.self, 
                                forCellWithReuseIdentifier: MyAlbumCell.identifier)
        collectionView.register(HeaderCollection.self, 
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, 
                                withReuseIdentifier: HeaderCollection.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.right.bottom.left.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection in 
            switch section {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                   leading: 5,
                                                                   bottom: 10,
                                                                   trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(180),
                                                       heightDimension: .estimated(220))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, 
                                                                   repeatingSubitem: layoutItem, 
                                                                   count: 2)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 12,
                                                                      bottom: 20,
                                                                      trailing: 0)
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), 
                                                                     heightDimension: .estimated(40))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, 
                                                                                      elementKind: UICollectionView.elementKindSectionHeader, 
                                                                                      alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
                
            default:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                   leading: 0,
                                                                   bottom: 5,
                                                                   trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(44))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                   subitems: [layoutItem])
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                    leading: 4,
                                                                    bottom: 0,
                                                                    trailing: 10)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, 
                                                                      leading: 10, 
                                                                      bottom: 30, 
                                                                      trailing: 10)
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), 
                                                                     heightDimension: .estimated(40))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, 
                                                                                      elementKind: UICollectionView.elementKindSectionHeader, 
                                                                                      alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
            }
        }
    }
}
    // MARK: - Collection Setup
    
extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CompositionalModel.modelsArray[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumCell.identifier, for: indexPath) as! MyAlbumCell
            item.configure(model: CompositionalModel.modelsArray[indexPath.section][indexPath.item])
            return item
        case 1:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MediaUtilitiesCell.identifier, for: indexPath) as! MediaUtilitiesCell
            item.configure(model: CompositionalModel.modelsArray[indexPath.section][indexPath.item])
            
            if indexPath.item == 0 {
                item.separatorLine.isHidden = true
            } else {
                item.separatorLine.isHidden = false
            }
            
            return item
        default:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MediaUtilitiesCell.identifier, for: indexPath) as! MediaUtilitiesCell
            item.configure(model: CompositionalModel.modelsArray[indexPath.section][indexPath.item])
            
            if indexPath.item == 0 {
                item.separatorLine.isHidden = true
            } else {
                item.separatorLine.isHidden = false
            }
            
            return item
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollection.identifier, for: indexPath) as! HeaderCollection
            header.title.text = "My Albums"
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollection.identifier, for: indexPath) as! HeaderCollection
            header.title.text = "Media types"
            return header
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollection.identifier, for: indexPath) as! HeaderCollection
            header.title.text = "Utilities"
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            return header
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 20, height: 10)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return CompositionalModel.modelsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}

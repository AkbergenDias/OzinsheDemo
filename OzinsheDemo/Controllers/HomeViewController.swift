//
//  HomeViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 07.12.2025.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    
    var sectionDataSource: [[UIImage]] = [
        [UIImage(named: "Image-6")!, UIImage(named: "Image-67")!, UIImage(named: "Image-67")!],
        [UIImage(named: "Image-2")!, UIImage(named: "Image-67")!, UIImage(named: "Image-67")!],
        [UIImage(named: "Image-3")!, UIImage(named: "Image-4")!, UIImage(named: "Image-5")!]
    ]
    
    var sectionHeaderData: [String] = ["", "Қарауды жалғастырыңыз", "Трендтегілер"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupCollectionview()
    }

    
    func setupUI() {
        view.addSubview(homeView)
        
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    private func setupCollectionview() {
        registerCells()
        registerCollectionReusableView()
        homeView.collectionView.dataSource = self
        homeView.collectionView.delegate = self
        homeView.collectionView.setCollectionViewLayout(createLayout(), animated: false)
        
    }
    
    //Cell registration
    private func registerCells() {
        homeView.collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.self.description())
    }
    
    //Headers registration
    private func registerCollectionReusableView() {
        homeView.collectionView.register(HomeCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionReusableView.self.description())
    }

}
// MARK: Compositional Layouts
extension HomeViewController {
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] index, env in
            return self?.getSectionFor(index: index)
        }
        return layout
    }
    private func getSectionFor(index: Int) -> NSCollectionLayoutSection {
        switch index {
        case 0:
            return createSection(height: 240, peakWidth: 0.8, showHeader: false)
        case 1:
            return createSection(height: 196, peakWidth: 0.5, showHeader: true)
        default:
            return createSection(height: 264, peakWidth: 0.3, showHeader: true)
        }
    }
  


    //This creates sections
    private func createSection(height: CGFloat, peakWidth: CGFloat, showHeader: Bool) -> NSCollectionLayoutSection {
        
        
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
      
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(peakWidth),
                                               heightDimension: .absolute(height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
      
        let section = NSCollectionLayoutSection(group: group)
        
        if showHeader {
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(24))
            
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                     elementKind: UICollectionView.elementKindSectionHeader,
                                                                     alignment: .top)
            header.contentInsets.bottom = 16
                        
            section.boundarySupplementaryItems = [header]
        }
        
        
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets.bottom = 32
        section.contentInsets.leading = 24
        section.interGroupSpacing = 16
        
        return section
    }
    
}


// MARK: CollectionView DataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionDataSource[section].count
    }
    
    //Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.self.description(), for: indexPath) as! HomeCollectionViewCell
        
        let CurrentImage = sectionDataSource[indexPath.section][indexPath.row]
        
        cell.setupImage(CurrentImage)
        return cell
    }
    
    //Section Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeCollectionReusableView.self.description(), for: indexPath)
        as! HomeCollectionReusableView
        
        if indexPath.section < sectionHeaderData.count {
            header.titleLabel.text = sectionHeaderData[indexPath.section]
        }
        
        switch indexPath.section {
        case 0:
            header.seeAllButton.isHidden = true
        case 1:
            header.seeAllButton.isHidden = true
        default:
            header.seeAllButton.isHidden = false
        }
        
        return header
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionDataSource.count
    }
}

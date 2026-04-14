//
//  DetailsViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 05.04.2026.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {
    
    let detailsView = DetailsView()
    
    var sectionDataSource: [[UIImage]] = [
        [UIImage(named: "Image-Screenshot-1")!, UIImage(named: "Image-Screenshot-2")!],
        [UIImage(named: "Image-2")!, UIImage(named: "Image-67")!, UIImage(named: "Image-67")!]
    ]
    
    var sectionHeaderData: [String] = ["Скриншоттар", "Ұқсас телехикаялар"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupCollectionview()
        
        
        detailsView.playButtonTapped = { [weak self] in
            let vc = SeriesViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
        }

    }

    func setupUI() {
        view.addSubview(detailsView)
        
        detailsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private func setupCollectionview() {
        registerCells()
        registerCollectionReusableView()
        detailsView.collectionView.dataSource = self
        detailsView.collectionView.delegate = self
        detailsView.collectionView.setCollectionViewLayout(createLayout(), animated: false)
        
    }
    
    //Cell registration
    private func registerCells() {
        detailsView.collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.self.description())
    }
    
    //Headers registration
    private func registerCollectionReusableView() {
        detailsView.collectionView.register(HomeCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionReusableView.self.description())
    }
    
}

// MARK: Compositional Layouts
extension DetailsViewController {
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] index, env in
            return self?.getSectionFor(index: index)
        }
        return layout
    }
    private func getSectionFor(index: Int) -> NSCollectionLayoutSection {
        switch index {
        case 0:
            return createSection(height: 184, peakWidth: 0.5, showHeader: true)
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
extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
        default:
            header.seeAllButton.isHidden = false
        }
        
        return header
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionDataSource.count
    }
}


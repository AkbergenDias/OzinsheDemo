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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupCollectionview()

    }
    
    var sectionDataSource: [[UIImage]] = [
        [UIImage(named: "Splash Screen")!, UIImage(named: "Image-67")!, UIImage(named: "Image-67")!],
        [UIImage(named: "Splash Screen")!, UIImage(named: "Splash Screen")!, UIImage(named: "Splash Screen")!]
    ]
    
    func setupUI() {
        view.addSubview(homeView)
        
        homeView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.center.equalToSuperview()
        }
        
    }
    private func setupCollectionview() {
        registerCells()
        homeView.collectionView.dataSource = self
        homeView.collectionView.delegate = self
        homeView.collectionView.setCollectionViewLayout(createLayout(), animated: false)
        
    }
    
    private func registerCells() {
        homeView.collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.self.description())
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
        return createSection()
    }
    
    private func createSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
      
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(240))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
      
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}


// MARK: CollectionView DataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionDataSource[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.self.description(), for: indexPath) as! HomeCollectionViewCell
        
        let CurrentImage = sectionDataSource[indexPath.section][indexPath.row]
        
        cell.setupImage(CurrentImage)
        cell.layer.borderWidth = 5
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionDataSource.count
    }
}

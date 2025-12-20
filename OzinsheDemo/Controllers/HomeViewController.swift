//
//  HomeViewController.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 07.12.2025.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupCollectionview()

    }
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        return view
    }()
    
    var sectionDataSoucre: [[UIColor]] = [
        [.systemBlue, .black, .darkGray],
        [.systemRed, .orange, .yellow]
    ]
    
    func setupUI() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
    }
    private func setupCollectionview() {
        registerCells()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    private func registerCells() {
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.self.description())
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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
      
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
      
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}


// MARK: CollectionView DataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionDataSoucre[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.self.description(), for: indexPath) as! HomeCollectionViewCell
        cell.backgroundColor = sectionDataSoucre[indexPath.section][indexPath.item]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionDataSoucre.count
    }
}

//
//  HomeView.swift
//  OzinsheDemo
//
//  Created by Диас Акберген on 31.03.2026.
//

import UIKit
import SnapKit

class HomeView: UIView {

    lazy var logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo-2")
        return logo
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(logoImageView)
        addSubview(collectionView)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(16)
            make.left.equalToSuperview().inset(24)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(132)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    


}

//
//  MovieDetailView.swift
//  OMDB
//
//  Created by Emircan Aydın on 5.11.2021.
//

import UIKit

class MovieDetailView: GenericBaseView<MovieDetailViewData> {
    
    private lazy var collectionView: UICollectionView = {
        let layout = MovieDetailHeaderFlowLayout()
        layout.sectionInset = .init(top: 16, left: 16, bottom: 16, right: 16)
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 500)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.genericRegisterCell(MovieDetailInfoCellView.self)
        collection.register(MovieDetailHeaderReusableView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: MovieDetailHeaderReusableView.identifier)
        collection.register(MovieDetailFooterReusableView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                            withReuseIdentifier: MovieDetailFooterReusableView.identifier)
        return collection
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addCollectionView()
    }
    
    private func addCollectionView() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setData(to header: MovieDetailHeaderReusableView) {
        guard let data = returnData(), let headerViewData = data.headerViewData else { return }
        header.setRowData(data: headerViewData)
    }
    
    private func setData(to footer: MovieDetailFooterReusableView) {
        guard let data = returnData(), let footerViewData = data.footerViewData else { return }
        footer.setRowData(data: footerViewData)
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    private func getNumberOfItems() -> Int {
        guard let data = returnData() else { return 0}
        return data.infoViewData.count
    }
    
    private func getItem(at index: IndexPath) -> MovieDetailInfoViewData {
        guard let data = returnData() else { fatalError("If data does not exist, this method impossible to get called.")}
        return data.infoViewData[index.row]
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout -
extension MovieDetailView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MovieDetailHeaderReusableView.identifier, for: indexPath) as? MovieDetailHeaderReusableView else { return UICollectionReusableView() }
            setData(to: header)
            return header
            
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MovieDetailFooterReusableView.identifier, for: indexPath) as? MovieDetailFooterReusableView else { return UICollectionReusableView() }
            setData(to: footer)
            return footer
            
        default: assert(false, "Unexpected element kind")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 340)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailInfoCellView.identifier, for: indexPath) as? MovieDetailInfoCellView else { return UICollectionViewCell() }
        cell.setRowData(data: getItem(at: indexPath))
        return cell
    }
}

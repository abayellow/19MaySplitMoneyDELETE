import Foundation
import UIKit

class TipsView: UIView {
    
    let tipsLogo = UILabel(text: "Tips", fontName: "Avenir Next Bold", size: 13, tamic: false, color: .black)
    var viewCollection: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    
    let percentArray = ["5%", "10%", "15%", "20%"]
    
    var tipsValue = 0
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        
        
      layout = flowLayout()
        viewCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
       addSubview(viewCollection)
        addSubview(tipsLogo)
        
        
        viewCollection.backgroundColor = .white
        
        viewCollection.register(PercentCell.self, forCellWithReuseIdentifier: "cell")
        viewCollection.delegate = self
        viewCollection.dataSource = self
    }
    
    func flowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 10
        
        layout.minimumInteritemSpacing = 26
        
        layout.sectionInset = .init(top: 15, left: 12, bottom: .zero, right: .zero)
        
        layout.itemSize = .init(width: 65, height: 65)
        
        //layout.alignToCenter = true
        
        return layout
    }
    
    func setupConstraints() {
        viewCollection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
       
            
            viewCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewCollection.bottomAnchor.constraint(equalTo: bottomAnchor),
            viewCollection.heightAnchor.constraint(equalToConstant: 80),
            
            tipsLogo.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            tipsLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
        ])
        
        
        
    }
    var selectedIndexPath: IndexPath?
    
}

extension TipsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            let collectionViewWidth = collectionView.bounds.width
            let cellWidth = layout.itemSize.width
            let numberOfCells = CGFloat(percentArray.count)
            let horizontalSpacing = layout.minimumInteritemSpacing
            let totalCellWidth = cellWidth * numberOfCells
            let totalSpacingWidth = horizontalSpacing * (numberOfCells - 1)
            let inset = (collectionViewWidth - totalCellWidth - totalSpacingWidth) / 2.0

            return UIEdgeInsets(top: layout.sectionInset.top, left: inset, bottom: layout.sectionInset.bottom, right: inset)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        if let cell = collectionView.cellForItem(at: indexPath) {
                 cell.layer.borderWidth = 2.0
                 cell.layer.borderColor = UIColor.systemGreen.cgColor
             }

             if let selectedIndexPath = selectedIndexPath, selectedIndexPath != indexPath {
                 if let previousCell = collectionView.cellForItem(at: selectedIndexPath) {
                     previousCell.layer.borderWidth = 0.0
                 }
             }

             selectedIndexPath = indexPath

        
         print(indexPath.row)
        switch indexPath.row {
        case 0: tipsValue = 5
        case 1: tipsValue = 10
        case 2: tipsValue = 15
        case 3: tipsValue = 20
        default: tipsValue = 1
        }
 
    }
    
    
}

extension TipsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        percentArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PercentCell
        
        
        
        cell.backgroundColor = UIColor(named: "OtherColor")!
        
        cell.labelPercante.text = percentArray[indexPath.row]
        
        cell.layer.cornerRadius = 8
        return cell
    }
    

    
}

class PercentCell: UICollectionViewCell {
    
    let labelPercante = UILabel(text: "0", fontName: "Avenir Next Bold", size: 15, tamic: false, color: .black)
    
    
//    override var isSelected: Bool {
//            didSet {
//                contentView.backgroundColor = isSelected ? .systemGreen : .systemGray6
//            }
//        }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        contentView.addSubview(labelPercante)
        
        labelPercante.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        labelPercante.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}

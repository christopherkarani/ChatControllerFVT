//
//  ViewController.swift
//  ChatDesign
//
//  Created by Chris Karani on 10/3/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit

// Thr types we expect to recieve

/// A Class to handle most of our DataSource Needs
class CollectionDataSource<Model, Cell: UICollectionViewCell>: NSObject, UICollectionViewDataSource {
    
    typealias Configurator = (Model, Cell) -> ()
    
    let items : [Model]
    let reuseIdentifier: String
    let configurator : Configurator
    
    init(items: [Model], reuseIdentifier: String, configurator: @escaping Configurator) {
        self.items = items
        self.reuseIdentifier = reuseIdentifier
        self.configurator = configurator
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! Cell
        
        configurator(item, cell)
        
        return cell
    }
}



class ChatController : UICollectionViewController {
    let cellID = "CellID"
    var dataSource : CollectionDataSource<Int, ChatCell>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view .backgroundColor = .yellow
        let items = [Int].init(repeating: 6, count: 20)
        let source = CollectionDataSource<Int,ChatCell>(items: items, reuseIdentifier: cellID) { (_, cell) in
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 10
            cell.label.text = "Chris Rules All"
        }
        collectionView.backgroundColor = .red
        
        collectionView.register(ChatCell.self, forCellWithReuseIdentifier: cellID)
        // we must keep a strong reference since
        self.dataSource = source
        collectionView.dataSource = source
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

extension ChatController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.bounds.width * 0.95, height: view.frame.height * 0.65)
    }
}



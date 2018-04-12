//
//  photoController.swift
//  CodaGram
//
//  Created by christophe milliere on 09/04/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class PhotoController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let appareilNib = UINib(nibName: CAMERA_CELL, bundle: nil)
        let librairy = UINib(nibName: LIBRAIRY_CELL, bundle: nil)
        
        collectionView.register(appareilNib, forCellWithReuseIdentifier: CAMERA_CELL)
        collectionView.register(librairy, forCellWithReuseIdentifier: LIBRAIRY_CELL)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return segment.numberOfSegments
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if segment.selectedSegmentIndex == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CAMERA_CELL, for: indexPath) as! AppareilPhotoCell
            cell.addControllerDevice(controller: self)
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LIBRAIRY_CELL, for: indexPath) as! LibrairyCell
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: collectionView.frame.height)
    }
    
    @IBAction func segmentChoice(_ sender: Any) {
        let indexPath = IndexPath(item: segment.selectedSegmentIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
    }
    
    
    

  

}

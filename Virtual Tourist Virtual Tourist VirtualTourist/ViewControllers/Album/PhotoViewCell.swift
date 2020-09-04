//
//  PhotoViewCell.swift
//  Virtual Tourist Virtual Tourist VirtualTourist
//
//  Created by Mohammed on 22/08/2020.
//  Copyright © 2020 Alzuwayyid. All rights reserved.
//

import UIKit
import CoreData
class PhotoViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    static let reuseIdentifier = "PhotoViewCell"
    var urlString = ""
    


    func setPhotoImageView(imageView: UIImage, sizeFit: Bool) {
        photoImageView.image = imageView
        if sizeFit == true {
            photoImageView.sizeToFit()
        }
    }
    

    
}

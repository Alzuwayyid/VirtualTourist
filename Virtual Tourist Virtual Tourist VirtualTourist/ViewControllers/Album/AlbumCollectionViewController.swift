//
//  AlbumCollectionViewController.swift
//  Virtual Tourist Virtual Tourist VirtualTourist
//
//  Created by Mohammed on 22/08/2020.
//  Copyright © 2020 Alzuwayyid. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import Kingfisher

class AlbumCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var newCollectionButton: UIButton!
    @IBOutlet weak var nav: UINavigationItem!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    var fetchedResultsController: NSFetchedResultsController<Photo>!
    var pin: Pin!
    var dataController: DataController!
    
    

    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupFetchedResultsController()
        // check pin data or not
      guard let pin = pin else {
            showAlert(title: "Photo album cannot be loaded", message: "Try Again!")
            fatalError("No pin ")
        }
        
        nav.title = pin.locationName ?? "Album"
        setUpCollectionView()
        

      //  self.collectionView.register(nib, forCellWithReuseIdentifier: "PhotoViewCell")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoToDelete = fetchedResultsController.object(at: indexPath)
        deletePhoto(photoToDelete)
    }
    
    
    func deletePhoto(_ photo: Photo) {
        dataController.viewContext.delete(photo)
        do {
            try dataController.viewContext.save()
        } catch {
            print("Error saving")
        }
        
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpMapView()
//        setupFetchedResultsController()
        downloadPhotoData()
     
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        fetchedResultsController = nil
    }
    
    
    // Setting up fetched results controller
       fileprivate func setupFetchedResultsController() {
           let fetchRequest:NSFetchRequest<Photo> = Photo.fetchRequest()
          
           if let pin = pin {
               let predicate = NSPredicate(format: "pin == %@", pin)
               fetchRequest.predicate = predicate
            
               print("\(pin.latitude) \(pin.longitude)")
           }
           let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: true)
           fetchRequest.sortDescriptors = [sortDescriptor]
           
           fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                 managedObjectContext: dataController.viewContext,
                                                                 sectionNameKeyPath: nil, cacheName: "photo")
           fetchedResultsController.delegate = self
        print(fetchedResultsController.cacheName!)
        print(fetchedResultsController.fetchedObjects?.count ?? 0)

           do {
               try fetchedResultsController.performFetch()
           } catch {
               fatalError("The fetch could not be performed: \(error.localizedDescription)")
           }
       }
    
    
    func showAlert(title: String, message: String){
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    
    
    @IBAction func newCollection(_ sender: Any) {
        
        guard let imageObject = fetchedResultsController.fetchedObjects else { return }
        for image in imageObject {
            dataController.viewContext.delete(image)
           do {
               try dataController.viewContext.save()
           } catch {
                print("Unable to delete images")
            }
        }
       
    downloadPhotoData()
    }
    
    
    func downloadPhotoData() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        print("\(String(describing: fetchedResultsController.fetchedObjects?.count))")
        guard (fetchedResultsController.fetchedObjects?.isEmpty)! else {
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            print("image metadata is already present. no need to re download")
            return
        }

        let pagesCount = Int(self.pin.pages)
      //  let annotation = AnnotationPin(pin: pin)
        client.getPhotos(latitude: pin.latitude,longitude: pin.longitude,
                               totalPageAmount: pagesCount) { (photos, totalPages, error) in
                                
        if photos.count > 0 {
            DispatchQueue.main.async {
                if (pagesCount == 0) {
                    self.pin.pages = Int32(Int(totalPages))
                }
                for photo in photos {
                    let newPhoto = Photo(context: self.dataController.viewContext)
                    newPhoto.imageUrl = URL(string: photo.url_m)
                    newPhoto.imageData = nil
                    newPhoto.pin = self.pin
                    newPhoto.imageID = UUID().uuidString
                    do {
                        try self.dataController.viewContext.save()
                    } catch {
                        print("Unable to save the photo")
                    }
                }
                
                print("capi")
            }
        }
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
      }

    }
    
    
    @IBAction func DeleteOnPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func DoneOnPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    
    private func removeSelectedImages() {
      var imageIds: [String] = []
           
           // All the index paths for the selected images are returned
           if let selectedImagesIndexPaths = collectionView.indexPathsForSelectedItems {
               for indexPath in selectedImagesIndexPaths {
                   let selectedImageToRemove = fetchedResultsController.object(at: indexPath)
                   
                if let imageId = selectedImageToRemove.imageID {
                       imageIds.append(imageId)
                   }
               }
               
               for imageId in imageIds {
                   if let selectedImages = fetchedResultsController.fetchedObjects {
                       for image in selectedImages {
                           if image.imageID == imageId {
                               dataController.viewContext.delete(image)
                           }
                           do {
                               try dataController.viewContext.save()
                           } catch {
                               print("Unable to remove the photo")
                           }
                       }
                   }
               }
           }
        
    }
    
    
}

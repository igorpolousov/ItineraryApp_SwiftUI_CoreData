//
//  PhotoLibraryManager.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 12.04.2023.
//

import UIKit
import Photos

class PhotoLibraryManager: ObservableObject {
    @Published var photoLibraryPermissinGranted = false
    
    func requestPermission() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { status in
                DispatchQueue.main.async {
                    switch status {
                    case .authorized:
                        self.photoLibraryPermissinGranted = true
                    default:
                        break
                    }
                }
            }
        }
    }
}

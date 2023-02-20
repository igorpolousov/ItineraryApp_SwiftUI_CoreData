//
//  ImagePickerWithCrop.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 20.02.2023.
//

import Foundation
import SwiftUI

struct ImagePickerWithCrop: UIViewControllerRepresentable {
    
   var image: (UIImage)->()
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator 
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, onDismiss: {
            presentationMode.wrappedValue.dismiss()
        }, pickedImage: self.image)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePickerWithCrop
        let onDismiss: ()->()
        let pickedImage: (UIImage)->()
        
        init(parent: ImagePickerWithCrop, onDismiss: @escaping ()->(), pickedImage: @escaping (UIImage)->() ) {
            self.parent = parent
            self.onDismiss = onDismiss
            self.pickedImage = pickedImage
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage  = info[.editedImage] as? UIImage {
                self.pickedImage(pickedImage)
            } else if let pickedImage = info[.originalImage]  as? UIImage {
                self.pickedImage(pickedImage)

            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.onDismiss()
        }
    }
}

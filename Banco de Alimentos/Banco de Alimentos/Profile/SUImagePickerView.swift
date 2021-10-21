//
//  SUImagePickerView.swift
//  Banco de Alimentos
//
//  Created by Diego Mojarro on 20/10/21.
//

import SwiftUI
import UIKit

struct SUImagePickerView: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(image: $image, isPresented: $isPresented)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        return pickerController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to update here
    }

}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    init(image: Binding<Image?>, isPresented: Binding<Bool>) {
        self._image = image
        self._isPresented = isPresented
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let UiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = Image(uiImage: UiImage)
            if let data = UiImage.pngData() {
                let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                
                let url = documents.appendingPathComponent("fotoperfil.png")
                
                do{
                    try data.write(to: url)
                    
                }catch{
                    print("No pude guardar fotografia en el folder del sipositivo \(error)")
                }
                
            }

        }
        
    

        
        self.isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
    
}


//
//  petCamera.swift
//  wankoAlbum
//
//  Created by 笹倉 一也 on 2018/06/12.
//  Copyright © 2018年 笹倉 一也. All rights reserved.
//


import UIKit

class petCamera: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var petImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func petCameraTapped(_ sender: Any) {
        
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
        else{
            print("error")
            
        }
   
        
    }
    
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage]
            as? UIImage {
         
     
            petImage.contentMode = .scaleAspectFit
            petImage.image = pickedImage
            
        
            }
        
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
        
        print("Tap the [Save] to save a picture")
        
    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
        print("Canceled")
        
    }
    
    
    
    @IBAction func petAlbumTapped(_ sender: Any) {
        
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
            print("Tap the [Start] to save a picture")
        }
        else{
            print("error")
            
        }

        
    }
    
    
    
    @IBAction func petSavedTapped(_ sender: Any) {
        let image:UIImage! = petImage.image
        
        if image != nil {
            UIImageWriteToSavedPhotosAlbum(image, self,
                                           #selector(petCamera.image(_:didFinishSavingWithError:contextInfo:)),
                                           nil)
        }
        else{
//            label.text = "image Failed !"
        }
}


    // 書き込み完了結果の受け取り
    @objc func image(_ image: UIImage,
               didFinishSavingWithError error: NSError!,
               contextInfo: UnsafeMutableRawPointer) {
        
        if error != nil {
            print(error.code)
            //            label.text = "Save Failed !"
        }
        else{
            //            label.text = "Save Succeeded"
        }
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            
            let petCollection:petCollection = segue.destination as! petCollection
            
    
            petCollection.photoImages = [self.petImage.image]
        }
        
    
    }
    
    
    
    
}






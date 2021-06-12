//
//  ViewController.swift
//  Tim Viec Firebase
//
//  Created by Dark_Souls on 6/12/21.
//  Copyright © 2021 Dark_Souls. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgSelection: UIImageView!
    @IBOutlet weak var imageLoad: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            print("Loi")
            return
        }
        imgSelection.image = image;
    }

    @IBAction func btn_Upload(_ sender: UIButton) {
        let piker = UIImagePickerController()
        piker.sourceType = .photoLibrary
        piker.delegate = self
        present(piker, animated: true, completion: nil)
    }
    
    let storage = Storage.storage().reference()
    
    @IBAction func btn_Load(_ sender: UIButton) {
        let imgref = storage.child("Image/image.jpg")
        imgref.putData(imgSelection.image!.pngData()!, metadata: nil) { (_, error) in
            if error == nil {
                imgref.downloadURL { (url, erro) in
                    print(url)
                }
            }else{
                print("HUY")
            }
        }
    }
}


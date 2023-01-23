//
//  ViewController.swift
//  Dubut-Touroul_Quentin_1_code_source_012023
//
//  Created by Quentin Dubut-Touroul on 15/01/2023.
//

import UIKit

class ViewController: UIViewController {
    private var button: UIButton!
    var indexLayout: Int = 1
    var fullImage: [Bool] = [false,false,false,false]
    
    
    @IBAction func Buttons(_ sender: UIButton) {
        button = sender
        openGallery()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionWhenIndexChange()
//        NotificationCenter.default.addObserver(self,
//                                                       selector: #selector(changeDeviceOrientation),
//                                                       name: UIDevice.orientationDidChangeNotification,
//                                                       object: nil)

    }
    
    @IBOutlet var mainView: UIView!
    
    @IBAction func ShareGesture(_ sender: UIPanGestureRecognizer) {
        if allImageAreHere() {
            switch sender.state {
            case .began, .changed:
                transformViewWith(gesture: sender)
            case .ended:
                if UIDevice.current.orientation == .landscapeRight || UIDevice.current.orientation == .landscapeLeft {
                    if mainView.transform.tx < -80 {
                        share()
                    }
                } else {
                    if mainView.transform.ty < -80 {
                        share()
                    }
                }
            case .cancelled:
                mainView.transform = .identity
            default:
                break
            }
        }
    }

    // Check of all images presents to build the new image before sharing
    private func allImageAreHere() -> Bool {
        switch indexLayout {
        case 1:
            if fullImage[0] && fullImage[2] && fullImage[3] {
                return true
            }
        case 2:
            if fullImage[0] && fullImage[1] && fullImage[3] {
                return true
            }
        case 3:
            if fullImage[0] && fullImage[1] && fullImage[2] && fullImage[3] {
                return true
            }
        default:
            return false
        }
        return false
    }
        
    private func transformViewWith(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: mainView)
        if UIDevice.current.orientation == .landscapeRight || UIDevice.current.orientation == .landscapeLeft {
            if translation.x < -80 {
                mainView.transform = CGAffineTransform(translationX: 400, y: 400)
            } else {
                mainView.transform = .identity
            }
        } else {
            if translation.y < -80 {
                mainView.transform = CGAffineTransform(translationX: 400, y: 400)
            } else {
                mainView.transform = .identity
            }
        }
    }
    
    @IBOutlet weak var ButtonLayout1: UIButton!
    @IBOutlet weak var ButtonLayout2: UIButton!
    @IBOutlet weak var ButtonLayout3: UIButton!
    
    // Layouts Change
    @IBAction func ButtonsLayout(_ sender: UIButton) {
        print(sender.tag)
        indexLayout = sender.tag
        actionWhenIndexChange()
    }
    
    @IBOutlet weak var ImageBottomLeft: UIButton!
    @IBOutlet weak var ImageBottomRight: UIButton!
    @IBOutlet weak var ImageTopRight: UIButton!
    @IBOutlet weak var ImageTopLeft: UIButton!
    
    
    func actionWhenIndexChange() {
        let selected = UIImage(named: "Selected")
        
        switch indexLayout {
        case 1:
            ButtonLayout1.setImage(selected, for: .normal)
            ButtonLayout2.setImage(UIImage(named: "Default Image"), for: .normal)
            ButtonLayout3.setImage(UIImage(named: "Default Image"), for: .normal)
            ImageTopRight.isHidden = true
            ImageBottomLeft.isHidden = false
        case 2:
            ButtonLayout1.setImage(UIImage(named: "Default Image"), for: .normal)
            ButtonLayout3.setImage(UIImage(named: "Default Image"), for: .normal)
            ButtonLayout2.setImage(selected, for: .normal)
            ImageTopRight.isHidden = false
            ImageBottomLeft.isHidden = true
        default:
            ButtonLayout3.setImage(selected, for: .normal)
            ButtonLayout1.setImage(UIImage(named: "Default Image"), for: .normal)
            ButtonLayout2.setImage(UIImage(named: "Default Image"), for: .normal)
            ImageTopRight.isHidden = false
            ImageBottomLeft.isHidden = false
        }
    }
   
    
//    @IBOutlet weak var SwipeText: UILabel!
//
//    @objc func changeDeviceOrientation() {
//        if UIDevice.current.orientation == .landscapeRight || UIDevice.current.orientation == .landscapeLeft {
//            SwipeText.text = "Swipe left to share"
//        } else {
//            SwipeText.text = "Swipe up to share"
//        }
//    }

    private func combine() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 350, height: 350), false, 0.0)
            switch indexLayout {
            case 1:
                ImageBottomLeft.currentImage!.draw(in: CGRect(x: 0, y: 175, width: 175, height: 175))
                ImageBottomRight.currentImage!.draw(in: CGRect(x: 175, y: 175, width: 175, height: 175))
                ImageTopLeft.currentImage!.draw(in: CGRect(x: 0, y: 0, width: 350, height: 175))
            case 2:
                ImageTopLeft.currentImage!.draw(in: CGRect(x: 0, y: 0, width: 175, height: 175))
                ImageTopRight.currentImage!.draw(in: CGRect(x: 175, y: 0, width: 175, height: 175))
                ImageBottomRight.currentImage!.draw(in: CGRect(x: 0, y: 175, width: 350, height: 175))
            case 3:
                ImageTopLeft.currentImage!.draw(in: CGRect(x: 0, y: 0, width: 175, height: 175))
                ImageTopRight.currentImage!.draw(in: CGRect(x: 175, y: 0, width: 175, height: 175))
                ImageBottomLeft.currentImage!.draw(in: CGRect(x: 0, y: 175, width: 175, height: 175))
                ImageBottomRight.currentImage!.draw(in: CGRect(x: 175, y: 175, width: 175, height: 175))
            default:
                return UIImage(named: "Selected")!
            }
            let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    private func share() {
        let newImage = combine()
        let items = [newImage]
        let activity = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activity, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //  choose an image from the gallery and assign it to the button
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage]
        switch button.tag {
        case 4:
            ImageTopLeft.setImage(image as? UIImage, for: .normal)
            fullImage[0] = true
        case 5:
            ImageTopRight.setImage(image as? UIImage, for: .normal)
            fullImage[1] = true
        case 6:
            ImageBottomLeft.setImage(image as? UIImage, for: .normal)
            fullImage[2] = true
        case 7:
            ImageBottomRight.setImage(image as? UIImage, for: .normal)
            fullImage[3] = true
        default:
            print("erreurs maggle")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func openGallery() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
}

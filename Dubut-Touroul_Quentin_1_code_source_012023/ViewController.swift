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
    
//    @IBAction func ShareGesture(_ sender: UIPanGestureRecognizer) {
//        if allImageAreHere() {
//            Layout.bringSubviewToFront(Layout)
//
//            switch sender.state {
//            case .began, .changed:
//                transformLayoutViewWith(gesture: sender)
//            case .ended:
//                if UIDevice.current.orientation == .landscapeRight || UIDevice.current.orientation == .landscapeLeft {
//                    if Layout.transform.tx < -80 {
//                        share()
//                    }
//                } else {
//                    if Layout.transform.ty < -80 {
//                        share()
//                    }
//                }
//                Layout.transform = .identity
//                Layout.backgroundColor = UIColor(named: "AccentColor")
//            case .cancelled:
//                Layout.transform = .identity
//                Layout.backgroundColor = UIColor(named: "AccentColor")
//            default:
//                break
//            }
//        }
//    }

    // Check of all images presents to build the new image before sharing
//    private func allImageAreHere() -> Bool {
//        switch indexLayout {
//        case 1:
//            if ImageTopLeft.image == nil || ImageBottomLeft == nil || ImageBottomRight == nil {
//                return false
//            }
//        case 2:
//            if ImageTopLeft.image == nil || ImageTopRight.image == nil || ImageBottomRight.image == nil {
//                return false
//            }
//        case 3:
//            if ImageTopLeft.image == nil || ImageTopRight.image == nil || ImageBottomLeft.image == nil || ImageBottomRight.image == nil {
//                return false
//            }
//        default:
//            return true
//        }
//        return true
//    }
        
//    private func transformLayoutViewWith(gesture: UIPanGestureRecognizer) {
//        let translation = gesture.translation(in: Layout)
//        Layout.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
//        if UIDevice.current.orientation == .landscapeRight || UIDevice.current.orientation == .landscapeLeft {
//            if translation.x < -80 {
//                Layout.backgroundColor = UIColor(red: 0, green: 253, blue: 0, alpha: 1)
//            } else {
//                Layout.backgroundColor = UIColor(named: "AccentColor")
//            }
//        } else {
//            if translation.y < -80 {
//                Layout.backgroundColor = UIColor(red: 0, green: 253, blue: 0, alpha: 1)
//            } else {
//                Layout.backgroundColor = UIColor(named: "AccentColor")
//            }
//        }
//    }
    
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
        var selected = UIImage(named: "Selected")
        
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
//
//    private func combine() -> UIImage {
//        UIGraphicsBeginImageContextWithOptions(CGSize(width: 310, height: 310), false, 0.0)
//            switch indexLayout {
//            case 1:
//                ImageBottomLeft.image!.draw(in: CGRect(x: 0, y: 155, width: 155, height: 155))
//                ImageBottomRight.image!.draw(in: CGRect(x: 155, y: 155, width: 155, height: 155))
//                ImageTopLeft.image!.draw(in: CGRect(x: 0, y: 0, width: 310, height: 155))
//            case 2:
//                ImageTopLeft.image!.draw(in: CGRect(x: 0, y: 0, width: 155, height: 155))
//                ImageTopRight.image!.draw(in: CGRect(x: 155, y: 0, width: 155, height: 155))
//                ImageBottomLeft.image!.draw(in: CGRect(x: 0, y: 155, width: 310, height: 155))
//            case 3:
//                ImageTopLeft.image!.draw(in: CGRect(x: 0, y: 0, width: 155, height: 155))
//                ImageTopRight.image!.draw(in: CGRect(x: 155, y: 0, width: 155, height: 155))
//                ImageBottomLeft.image!.draw(in: CGRect(x: 0, y: 155, width: 155, height: 155))
//                ImageBottomRight.image!.draw(in: CGRect(x: 155, y: 155, width: 155, height: 155))
//            default:
//                return UIImage(named: "Selected")!
//            }
//            let newImage = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        return newImage
//    }
    
//    private func share() {
//        let newImage = combine()
//        let items = [newImage]
//        let activity = UIActivityViewController(activityItems: items, applicationActivities: nil)
//        present(activity, animated: true)
//    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //  choose an image from the gallery and assign it to the button
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage]
        switch button.tag {
        case 4:
            ImageTopLeft.setImage(image as? UIImage, for: .normal)
        case 5:
            ImageTopRight.setImage(image as? UIImage, for: .normal)
        case 6:
            ImageBottomLeft.setImage(image as? UIImage, for: .normal)
        case 7:
            ImageBottomRight.setImage(image as? UIImage, for: .normal)
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

//
//  ViewController.swift
//  Animation
//
//  Created by Айжан Замкенова on 18.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let newLogoView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector")
        return image
    }()
    
    private let newImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector2")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        view.backgroundColor = .black
        animation()
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .black
            setupUI()
           
       
    }
    
    func animation() {
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.newLogoView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.newImage.isHidden = true
        } completion: { _ in
            
            UIView.animate(withDuration: 0.5, delay: 0) {
                self.newLogoView.frame = CGRect(x: self.view.bounds.midX - self.newLogoView.frame.width / 2,
                                                  y: self.view.bounds.minY + self.newLogoView.frame.width,
                                                  width: self.newLogoView.frame.width,
                                                  height: self.newLogoView.frame.height)
                
            }completion: { _ in
                self.newImage.isHidden = false
                self.newImage.alpha = 0.1
                UIView.animate(withDuration: 0.5, delay: 0.3) {
                   self.newLogoView.frame = CGRect(x: self.view.bounds.minX + 16,
                                                   y: self.view.bounds.minY + self.newLogoView.frame.height,
                                                   width: self.newLogoView.frame.width,
                                                   height: self.newLogoView.frame.height)
                self.newImage.alpha = 3
        }
       }
    }
}
    
  func setupUI(){
      
        [newLogoView].forEach {
        $0.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview($0)
    }
        NSLayoutConstraint.activate([
            newLogoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newLogoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            newLogoView.widthAnchor.constraint(equalToConstant: 100),
            newLogoView.heightAnchor.constraint(equalToConstant: 100),
        ])
      
    [logoImage, newImage].forEach {
    $0.translatesAutoresizingMaskIntoConstraints = false
    newLogoView.addSubview($0)
}
    NSLayoutConstraint.activate([
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        logoImage.widthAnchor.constraint(equalToConstant: 100),
        logoImage.heightAnchor.constraint(equalToConstant: 100),
        
        
        newImage.leftAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
        newImage.heightAnchor.constraint(equalToConstant: 100),
    ])
      
   
      
     
    
}
}



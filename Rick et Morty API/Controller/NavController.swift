//
//  NavController.swift
//  Rick et Morty API
//
//  Created by Jeremy Piris on 20/02/2019.
//  Copyright © 2019 Jeremy Piris. All rights reserved.
//

import UIKit

class NavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = .darkGray
        navigationBar.tintColor = .white
        let image = UIImage(named: "Rick_and_Morty_logo")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: navigationBar.frame.width, height: navigationBar.frame.height)
        imageView.center.x = navigationBar.center.x
        imageView.contentMode = .scaleAspectFit
        navigationBar.addSubview(imageView)
        
    }
    

}

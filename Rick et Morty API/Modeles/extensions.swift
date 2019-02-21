//
//  extensions.swift
//  Rick et Morty API
//
//  Created by Jeremy Piris on 20/02/2019.
//  Copyright © 2019 Jeremy Piris. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func download(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data, let image = UIImage(data: imageData) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
            
        } .resume()
    }
    
}

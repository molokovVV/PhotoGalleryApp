//
//  File.swift
//  PhotoGalleryApp
//
//  Created by Виталик Молоков on 31.01.2023.
//

import UIKit

struct CompositionalModel: Hashable {
    var mainTitle: String?
    var description: String?
    var image: UIImage?
}

extension CompositionalModel {
    static let modelsArray = [
        [CompositionalModel(mainTitle: nil, description: nil, image: UIImage(named: "Recents")),
         CompositionalModel(mainTitle: nil, description: nil, image: UIImage(named: "Favourites")),
         CompositionalModel(mainTitle: nil, description: nil, image: UIImage(named: "GoPro")),
         CompositionalModel(mainTitle: nil, description: nil, image: UIImage(named: "DJI")),
         CompositionalModel(mainTitle: nil, description: nil, image: UIImage(named: "Instagram")),
         CompositionalModel(mainTitle: nil, description: nil, image: UIImage(named: "WhatsApp"))
        ],
        [CompositionalModel(mainTitle: nil, description: "Videos", image: UIImage(systemName: "video")),
         CompositionalModel(mainTitle: nil, description: "Selfies", image: UIImage(systemName: "person.crop.square")),
         CompositionalModel(mainTitle: nil, description: "Live Photo", image: UIImage(systemName: "livephoto")),
         CompositionalModel(mainTitle: nil, description: "Portrait", image: UIImage(systemName: "cube")),
         CompositionalModel(mainTitle: nil, description: "Panoramas", image: UIImage(systemName: "pano")),
         CompositionalModel(mainTitle: nil, description: "Slo-mo", image: UIImage(systemName: "slowmo")),
         CompositionalModel(mainTitle: nil, description: "Cinematic", image: UIImage(systemName: "video.square")),
         CompositionalModel(mainTitle: nil, description: "Bursts", image: UIImage(systemName: "square.3.layers.3d.down.right")),
         CompositionalModel(mainTitle: nil, description: "Screenshots", image: UIImage(systemName: "dot.circle.viewfinder")),
         CompositionalModel(mainTitle: nil, description: "Screen Recordings", image: UIImage(systemName: "smallcircle.filled.circle")),
         CompositionalModel(mainTitle: nil, description: "Animated", image: UIImage(systemName: "square.3.layers.3d.top.filled"))
        ],
        [CompositionalModel(mainTitle: nil, description: "Imports", image: UIImage(systemName: "square.and.arrow.down")),
         CompositionalModel(mainTitle: nil, description: "Dublicates", image: UIImage(systemName: "rectangle.on.rectangle")),
         CompositionalModel(mainTitle: nil, description: "Hidden", image: UIImage(systemName: "eye.slash")),
         CompositionalModel(mainTitle: nil, description: "Recently Deleted", image: UIImage(systemName: "trash"))
        ]
    ]
}

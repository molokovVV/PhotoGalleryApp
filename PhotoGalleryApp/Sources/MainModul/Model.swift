//
//  File.swift
//  PhotoGalleryApp
//
//  Created by Виталик Молоков on 31.01.2023.
//

import UIKit

struct CompositionalModel: Hashable {
    var description: String?
    var image: UIImage?
}

extension CompositionalModel {
    static let modelsArray = [
        [CompositionalModel(description: nil, image: UIImage(named: "Recents")),
         CompositionalModel(description: nil, image: UIImage(named: "Favourites")),
         CompositionalModel(description: nil, image: UIImage(named: "GoPro")),
         CompositionalModel(description: nil, image: UIImage(named: "DJI")),
         CompositionalModel(description: nil, image: UIImage(named: "Instagram")),
         CompositionalModel(description: nil, image: UIImage(named: "WhatsApp"))
        ],
        [CompositionalModel(description: "Videos", image: UIImage(systemName: "video")),
         CompositionalModel(description: "Selfies", image: UIImage(systemName: "person.crop.square")),
         CompositionalModel(description: "Live Photo", image: UIImage(systemName: "livephoto")),
         CompositionalModel(description: "Portrait", image: UIImage(systemName: "cube")),
         CompositionalModel(description: "Panoramas", image: UIImage(systemName: "pano")),
         CompositionalModel(description: "Slo-mo", image: UIImage(systemName: "slowmo")),
         CompositionalModel(description: "Cinematic", image: UIImage(systemName: "video.square")),
         CompositionalModel(description: "Bursts", image: UIImage(systemName: "square.3.layers.3d.down.right")),
         CompositionalModel(description: "Screenshots", image: UIImage(systemName: "dot.circle.viewfinder")),
         CompositionalModel(description: "Screen Recordings", image: UIImage(systemName: "smallcircle.filled.circle")),
         CompositionalModel(description: "Animated", image: UIImage(systemName: "square.3.layers.3d.top.filled"))
        ],
        [CompositionalModel(description: "Imports", image: UIImage(systemName: "square.and.arrow.down")),
         CompositionalModel(description: "Dublicates", image: UIImage(systemName: "rectangle.on.rectangle")),
         CompositionalModel(description: "Hidden", image: UIImage(systemName: "eye.slash")),
         CompositionalModel(description: "Recently Deleted", image: UIImage(systemName: "trash"))
        ]
    ]
}

//
//  VideoTableViewCell.swift
//  VideoPlayer
//
//  Created by apple on 02/09/19.
//  Copyright © 2019 Swiftter. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    var videoImageView: UIImageView!
    var titleLabel: UILabel!
    
    var videoInfo: VideoInfo? = nil {
        didSet {
            if let info = videoInfo {
                DispatchQueue.main.async {
                    self.videoImageView.imageFromURL(Constant.imageBaseUrl + info.thumb, placeHolder: nil)
                }
                titleLabel.text = info.description
            }
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellUI()
    }
    
    func setupCellUI() {
        videoImageView = UIImageView()
        videoImageView.clipsToBounds = true
        videoImageView.contentMode = .scaleAspectFit
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(videoImageView)
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Helvetica", size: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        videoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        videoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        videoImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        videoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: videoImageView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: videoImageView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

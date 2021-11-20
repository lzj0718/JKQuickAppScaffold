//
//  JKHomeTableCell.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/11/20.
//

import Foundation
import UIKit
import SnapKit

class JKHomeTableCell : UITableViewCell {
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.backgroundColor = .clear
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "home-cell-icon")
        return imageView
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize:16)
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        return label
    }()
    
    lazy var arrowView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "cell-arrow")
        return imageView
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView.init(frame: CGRect.zero)
        lineView.backgroundColor = .lightGray
        return lineView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI() {
        selectionStyle = .none
        
        contentView.addSubview(iconView)
        contentView.addSubview(infoLabel)
        contentView.addSubview(arrowView)
        contentView.addSubview(lineView)
        
        iconView.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
        }
        
        infoLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(10)
            make.centerY.equalToSuperview()
            make.height.equalTo(24)
            make.right.equalTo(-50)
        }
        
        arrowView.snp.makeConstraints { (make) in
            make.width.height.equalTo(15)
            make.centerY.equalToSuperview()
            make.right.equalTo(-10)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
}

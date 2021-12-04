//
//  GroupNameCollectionViewCell.swift
//  SwiftAccordion
//
//  Created by Yuki Okudera on 2021/12/04.
//

import UIKit

final class GroupNameCollectionViewCell: UICollectionViewCell {

    static let height = CGFloat(90)

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var groupNameLabel: UILabel!

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        let frame = CGRect.init(origin: attributes.frame.origin, size: .init(width: UIScreen.main.bounds.width - 32, height: attributes.frame.height))
        attributes.frame = frame
        return attributes
    }

    func configure(name: String, groupName: String) {
        nameLabel.text = name
        groupNameLabel.text = groupName
    }
}

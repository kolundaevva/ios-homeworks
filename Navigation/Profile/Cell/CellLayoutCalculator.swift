//
//  CellLayoutCalculator.swift
//  Navigation
//
//  Created by Владислав Колундаев on 01.10.2022.
//

import UIKit


struct Constants {
    static let feedInsets = UIEdgeInsets(top: 0, left: 16, bottom: 15, right: 16)
    static let topHeight: CGFloat = 40
    static let bottomHeight: CGFloat = 44
    static let postLabelInsets = UIEdgeInsets(top: topHeight + 8, left: 16, bottom: 8, right: 16)
    static let labelFont = UIFont.systemFont(ofSize: 14)

    static let viewHeight: CGFloat = 42
    static let viewWidth: CGFloat = 75

    static let imageSize: CGFloat = 26

    static let minifiedPostLimitLines: CGFloat = 8
    static let minifiedPostLines: CGFloat = 6

    static let moreTextButtonInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    static let moreTextButtonSize = CGSize(width: 170, height: 30)
}


private struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
    var bottomViewFrame: CGRect
    var totalHeight: CGFloat
}

protocol FeedCellSizes {
    var postLabelFrame: CGRect { get }
    var attachmentFrame: CGRect { get }
    var bottomViewFrame: CGRect { get }
    var totalHeight: CGFloat { get }
}

protocol CellLayoutCalculatorProtocol {
    func sizes(postText: String?, image: String?) -> FeedCellSizes
}

final class CellLayoutCalculator: CellLayoutCalculatorProtocol {

    private let screenWidth: CGFloat

    init(width: CGFloat = UIScreen.main.bounds.width) {
        self.screenWidth = width
    }

    func sizes(
        postText: String?,
        image: String?
    ) -> FeedCellSizes {
        let feedWidth = screenWidth

        // MARK: - Calculate post text height
        var postLabelFrame = CGRect(
            origin: CGPoint(
                x: Constants.postLabelInsets.left,
                y: Constants.postLabelInsets.top
            ), size: CGSize.zero
        )

        if let postText = postText, !postText.isEmpty {
            let width = feedWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            var height = postText.height(width: width, font: Constants.labelFont)

            let limitHeight = Constants.labelFont.lineHeight * Constants.minifiedPostLimitLines

            if  height > limitHeight {
                height = Constants.labelFont.lineHeight * Constants.minifiedPostLines
            }

            postLabelFrame.size = CGSize(width: width, height: height)
        }

        // MARK: - Calculate post image height
        let postImageTop = postLabelFrame.size == CGSize.zero ?
        Constants.postLabelInsets.top :  postLabelFrame.maxY + Constants.postLabelInsets.bottom

        var postImageFrame = CGRect(origin: CGPoint(x: 0, y: postImageTop), size: CGSize.zero)

        if !(image?.isEmpty ?? true) {
            postImageFrame.size = CGSize(width: screenWidth, height: screenWidth)
        }

        // MARK: - Calculate post bottomView height
        let bottomViewTop = max(postLabelFrame.maxY, postImageFrame.maxY)
        let bottomViewFrame = CGRect(
            origin: CGPoint(
                x: 0,
                y: bottomViewTop
            ), size: CGSize(
                width: feedWidth,
                height: Constants.bottomHeight
            )
        )

        // MARK: - Calculate total height
        let totalHeight = bottomViewFrame.maxY + Constants.feedInsets.bottom

        return Sizes(postLabelFrame: postLabelFrame,
                     attachmentFrame: postImageFrame,
                     bottomViewFrame: bottomViewFrame,
                     totalHeight: totalHeight)
    }
}


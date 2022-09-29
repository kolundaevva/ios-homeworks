//
//  ProfileView.swift
//  Navigation
//
//  Created by Владислав Колундаев on 28.09.2022.
//

import Foundation
import UIKit

class ProfileView: UIView {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var birthdayLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var signTextView: UITextView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        commonInit()
    }

    func configure(
        name: String,
        birthday: String,
        city: String,
        text: String
    ) {
        imageView.image = UIImage(named: "person")
        nameLabel.text = name
        birthdayLabel.text = birthday
        cityLabel.text = city
        signTextView.text = text
    }

    private func commonInit() {
        let view = lodaViewFromNib(nibName: "ProfileView")
        addSubview(view)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.frame = self.bounds
    }

    private func lodaViewFromNib(nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self).first as! UIView

        return view
    }
}

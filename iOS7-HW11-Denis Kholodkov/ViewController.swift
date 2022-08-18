//
//  ViewController.swift
//  iOS7-HW11-Denis Kholodkov
//
//  Created by Денис Холодков on 18.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let backgroundView: UIImageView = {
            let imageViewBackground = UIImageView(frame: UIScreen.main.bounds)
            imageViewBackground.image = UIImage(named: "beach")
            imageViewBackground.translatesAutoresizingMaskIntoConstraints = false
            return imageViewBackground
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setConstraints()
    }

    private func setupHierarchy() {
        view.addSubview(backgroundView)
    }

    private func setConstraints() {
        backgroundView.snp.makeConstraints{ make in
            make.bottom.top.right.left.equalToSuperview()
        }
    }
}


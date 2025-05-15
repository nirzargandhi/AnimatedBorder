//
//  HomeVC.swift
//  AnimatedBorder
//
//  Created by Nirzar Gandhi on 15/05/25.
//

import UIKit

class HomeVC: BaseVC {
    
    // MARK: - IBOutlets
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var shadowView: BorderGradientView!
    @IBOutlet weak var animatedShadowView: AnimatedBorderGradientView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    // MARK: - Properties
    
    
    // MARK: -
    // MARK: - View init Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        
        self.setControlsProperty()
        self.setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = .black
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        
        NC.addObserver(self, selector: #selector(self.willEnterForeground), name: NSNotification.Name(rawValue: UIApplication.willEnterForegroundNotification.rawValue), object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.resetContainerAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NC.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    fileprivate func setControlsProperty() {
        
        self.view.backgroundColor = .black
        self.view.isOpaque = false
        
        // Container
        self.container.backgroundColor = .white
        self.container.addRadiusWithBorder(radius: 22)
        self.container.clipsToBounds = true
        
        // Shadow View
        self.shadowView.backgroundColor = .clear
        self.animatedShadowView.backgroundColor = .clear
        
        // Inner View
        self.innerView.backgroundColor = .clear
        
        // Profile Image View
        self.profileImgView.backgroundColor = .black
        self.profileImgView.layer.cornerRadius = self.profileImgView.frame.width / 2.0
        self.profileImgView.layer.masksToBounds = true
        
        // Name Label
        self.nameLabel.backgroundColor = .clear
        self.nameLabel.textColor = .black
        self.nameLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        self.nameLabel.numberOfLines = 0
        self.nameLabel.textAlignment = .left
        self.nameLabel.text = ""
        
        // Desc Label
        self.descLabel.backgroundColor = .clear
        self.descLabel.textColor = .black
        self.descLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        self.descLabel.numberOfLines = 0
        self.descLabel.textAlignment = .left
        self.descLabel.text = ""
    }
}


// MARK: - Call Back
extension HomeVC {
    
    @objc fileprivate func willEnterForeground() {
        
        if !self.container.isHidden {
            self.animatedShadowView.cornerRadius = 22
        }
    }
    
    fileprivate func resetContainerAnimation() {
        
        self.view.layoutIfNeeded()
        self.shadowView.layoutIfNeeded()
        self.shadowView.lineWidth = 4.0
        self.shadowView.cornerRadius = 22
        
        self.animatedShadowView.layoutIfNeeded()
        self.animatedShadowView.lineWidth = 4.0
        self.animatedShadowView.cornerRadius = 22
    }
    
    fileprivate func setData() {
        
        self.nameLabel.text = "Dummy Person"
        
        self.descLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
    }
}


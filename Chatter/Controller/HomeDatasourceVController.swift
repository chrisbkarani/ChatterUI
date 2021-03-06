
//
//  HomeDatasourceVController.swift
//  Chatter
//
//  Created by macuser1 on 09/11/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import LBTAComponents

class HomeDatasourceVController: DatasourceController {
    let homeDataSource = HomeDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        datasource = homeDataSource
        setupNavigationItems()
        collectionView?.backgroundColor =  UIColor(r: 232, g: 236, b: 241)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let user = self.datasource?.item(indexPath) as? User {
            let estimatedWidthOfDisplayText = self.view.frame.width   // view padding
            let size = CGSize(width: estimatedWidthOfDisplayText, height: 1000)
            let attributes = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)]
            
            let estimatedFrame = NSString(string: user.displayText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 52)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
}

extension HomeDatasourceVController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}

extension HomeDatasourceVController {
    private func setupNavigationItems() {
        setupTitleNavigationItem()
        setupleftNavigationItems()
        setupRightNavigationItems()
        navigationBarSetup()
    }
    
    private func navigationBarSetup() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navigationBarSeperatorView = UIView()
        navigationBarSeperatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        view.addSubview(navigationBarSeperatorView)
        navigationBarSeperatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    private func setupleftNavigationItems() {
        let followButton = UIButton(type: .system)
        let buttonRect = CGRect(x: 0, y: 0, width: 34, height: 34)
        followButton.frame = buttonRect
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        let followButtonItem = UIBarButtonItem(customView: followButton)
        navigationItem.leftBarButtonItem = followButtonItem
    }
    
    private func setupRightNavigationItems () {
        let buttonRect = CGRect(x: 0, y: 0, width: 34, height: 34);
        
        let composeButton = UIButton(type: .system)
        composeButton.frame = buttonRect
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        let composeBarButtonItem = UIBarButtonItem(customView: composeButton)
        
        let searchButton = UIButton(type: .system)
        searchButton.frame = buttonRect
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        let searchButtonItem = UIBarButtonItem(customView: searchButton)
        navigationItem.rightBarButtonItems = [composeBarButtonItem, searchButtonItem]
    }
    
    private func setupTitleNavigationItem() {
        let titleImage = UIImageView()
        titleImage.image = #imageLiteral(resourceName: "title_icon").withRenderingMode(.alwaysOriginal)
        let buttonRect = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImage.frame = buttonRect
        navigationItem.titleView = titleImage
    }
}

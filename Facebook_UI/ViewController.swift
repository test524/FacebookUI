//
//  ViewController.swift
//  Facebook_UI
//
//  Created by Pavan Kumar Reddy on 18/11/16.
//  Copyright © 2016 Pavan. All rights reserved.
//

import UIKit

let cellId =  "cellID"

let posts = Posts()

class FeedController: UICollectionViewController , UICollectionViewDelegateFlowLayout
{
    var imgQueue:[Any]?
    var profilePic:[Any]?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Loading images from document directory
//        let PhotoArray = Bundle.main.paths(forResourcesOfType: "jpg", inDirectory: "Varnitha_pics")
//        imgQueue = [Any]()
//        for path: String in PhotoArray
//        {
//            imgQueue?.append(path)
//        }

        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        navigationItem.title = "FaceBook"
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        
        
    }
    
    //MARK: CollectionView
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return posts.numberOfPosts()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
        
        cell.post = posts[indexPath]
        
        //cell.feedImage.image = UIImage.init(contentsOfFile: imgQueue?[indexPath.row] as! String)
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        if let statusText = posts[indexPath].statusText
        {
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.size.width, height: 1000), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:[NSFontAttributeName :UIFont.systemFont(ofSize: 14)], context:nil)
            
            let KnownHeight:CGFloat = 8+44+4+4+200+8+44+24+8
            
            return CGSize(width: view.frame.width, height: rect.height+KnownHeight+13)

        }
        
        return CGSize(width: view.frame.width, height: 500)

    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
        }
    
    
}










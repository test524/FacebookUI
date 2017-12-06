//
//  FeedCell.swift
//  Facebook_UI
//
//  Created by Pavan Kumar Reddy on 20/11/16.
//  Copyright © 2016 Pavan. All rights reserved.
//

import UIKit
import Foundation

//var imageCache = NSCache<NSString , ExpensiveObjectClass>()
let imageCache: NSCache<NSString, UIImage> = NSCache()

class FeedCell: UICollectionViewCell
{
    
    var post:Post?
        {
        
        didSet
        {
            
            feedImage.image = nil
            loader.startAnimating()
            
            if let statusImageUrl = post?.statusImageUrl {
                
               // let obj = statusImageUrl as NSString
                
                if let image:UIImage = imageCache.object(forKey: statusImageUrl as NSString)
                {
                    feedImage.image = image
                    loader.stopAnimating()
                }  else
                {
                    
                    URLSession.shared.dataTask(with: URL(string: statusImageUrl)!, completionHandler: { (data, response, error) -> Void in
                        
                        if error != nil {
                            //print(error)
                            return
                        }
                        
                        let image = UIImage(data: data!)
                        
                        imageCache.setObject(image!, forKey: statusImageUrl as NSString)
                        
                        DispatchQueue.main.async(execute: { () -> Void in
                            self.feedImage.image = image
                            self.loader.stopAnimating()
                        })
                        
                        
                    }).resume()
                    
                }
            }
            
                
            
           setupNameLocationStatusAndProfileImage()
                
        }
        
            
    }
    
    
    fileprivate func setupNameLocationStatusAndProfileImage()
    {
        if  let name = post?.name
        {

        let attriButtedText = NSMutableAttributedString(string:name , attributes:[NSFontAttributeName:UIFont.boldSystemFont(ofSize: 14)])
        
        attriButtedText.append(NSAttributedString(string:"\nNovember 23 * chandigarh * ", attributes:[NSFontAttributeName:UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName:UIColor.init(colorLiteralRed: 155/255, green: 161/255, blue: 171/255, alpha: 1)]))
        
        let paraGraphStyle = NSMutableParagraphStyle()
        
        paraGraphStyle.lineSpacing = 4
        
        attriButtedText.addAttribute(NSParagraphStyleAttributeName, value: paraGraphStyle, range: NSMakeRange(0, attriButtedText.string.characters.count))
        
        let attachement = NSTextAttachment()
        attachement.image = UIImage(named:"globe_small")
        attachement.bounds = CGRect(x: 0-2, y: -2, width: 12, height: 12)
        attriButtedText.append(NSAttributedString(attachment: attachement))
        nameLabel.attributedText = attriButtedText
        
        }
        
        
        
        if let statusText = post?.statusText
        {
        statusTextView.text = statusText
        }
        
        
        if let profileImageName:String = post?.profileImageName
        {
        profileImageView.image = UIImage(named: profileImageName)
        }
        
        if let likesComments:String = post?.likesComments
        {
            likeCommentsLabel.text = likesComments
        }
        
    
    }
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews()
    {
        
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(feedImage)
        addSubview(likeCommentsLabel)
        addSubview(borderLine)
        addSubview(likebutton)
        addSubview(commentButton)
        addSubview(sharedButton)
        
        
        setupStatusImageViewLoader()

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0(44)]-8-[v1]-4-|", options:NSLayoutFormatOptions(), metrics: nil, views: ["v0":profileImageView, "v1":nameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-4-[v0]-4-|", options:NSLayoutFormatOptions(), metrics: nil, views: ["v0":statusTextView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options:NSLayoutFormatOptions(), metrics: nil, views: ["v0":feedImage]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[v0]-12-|", options:NSLayoutFormatOptions(), metrics: nil, views: ["v0":likeCommentsLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-4-[v0]-4-|", options:NSLayoutFormatOptions(), metrics: nil, views: ["v0":borderLine]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(v2)][v1(v2)][v2]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":likebutton , "v1":commentButton , "v2":sharedButton]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[v0(44)]", options:NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(0.4)][v5(44)]|", options:NSLayoutFormatOptions(), metrics: nil, views: ["v0":profileImageView , "v1":statusTextView , "v2":feedImage , "v3":likeCommentsLabel , "v4":borderLine , "v5":likebutton]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(44)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":commentButton]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(44)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":sharedButton]))
        
        
    }
    
    let nameLabel:UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 2
        
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImageView : UIImageView =  {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let statusTextView: UITextView = {
        
        let textView = UITextView()
        textView.text = "Hello how are you!"
        textView.font = UIFont.systemFont(ofSize: 12)
        textView.isScrollEnabled  = false
        textView.allowsEditingTextAttributes = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let  feedImage:UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let likeCommentsLabel:UILabel = {
        
        let  likelabel = UILabel()
        likelabel.font = UIFont.systemFont(ofSize: 12)
        likelabel.textColor = UIColor.rgb(155, green: 161, blue: 171)
        likelabel.translatesAutoresizingMaskIntoConstraints = false
        return likelabel
        
    }()
    
    let borderLine:UIView = {
        
        let view  = UIView()
        view.backgroundColor = UIColor.rgb(226, green: 228, blue: 232)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let likebutton = FeedCell.buttonForTitles(title: "Like", imageName: "like")
    let commentButton = FeedCell.buttonForTitles(title: "Comment", imageName: "comment")
    let sharedButton = FeedCell.buttonForTitles(title: "Share", imageName: "share")
    
    
    static func buttonForTitles(title:String , imageName:String) -> UIButton
    {
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(143, green: 150, blue: 163), for: .normal)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
        
    }
    
    let loader = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    func setupStatusImageViewLoader()
    {
        loader.hidesWhenStopped = true
        loader.startAnimating()
        loader.color = UIColor.black
        feedImage.addSubview(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options:NSLayoutFormatOptions(), metrics: nil, views: ["v0":loader]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options:NSLayoutFormatOptions(), metrics: nil, views: ["v0":loader]))
        
        }
    
    
    
}


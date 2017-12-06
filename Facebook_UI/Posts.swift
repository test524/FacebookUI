//
//  Posts.swift
//  Facebook_UI
//
//  Created by Pavan Kumar Reddy on 20/11/16.
//  Copyright © 2016 Pavan. All rights reserved.
//

import UIKit
import Foundation

class Post
{
    var name:String?
    var statusText:String?
    var profileImageName:String?
    var statusImageUrl:String?
    var likesComments:String?
}


class Posts
{

    fileprivate let postsList:[Post]
 
    init()
    {
        
        let PhotoArray = Bundle.main.paths(forResourcesOfType: "jpg", inDirectory: "Varnitha_pics")
        var imgQueue = [String]()
        for path: String in PhotoArray
        {
            imgQueue.append(path)
        }
        
        let postMark = Post()
        postMark.name = "Mark zuckerberg"
        postMark.statusText = "In domestic matters, the sudden outlawing of Rs 500 and Rs 1,000 notes has caused a turmoil in all sectors of the economy, resulting in severe inconvenience to individuals and throwing trade and agricultural activity out of gear.🎄"
        postMark.profileImageName = "mark"
        postMark.statusImageUrl = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/mark_zuckerberg_background.jpg"
        postMark.likesComments = "999k likes 1k comments"

        
        
        let postSachin = Post()
        postSachin.name = "Sachin tendulkar"
        postSachin.statusText = "In domestic matters, the sudden outlawing of Rs 500 and Rs 1,000 notes has caused a turmoil in all sectors of the economy"
        postSachin.profileImageName = "sachin"
        postSachin.statusImageUrl = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/gandhi_status.jpg"
        postSachin.likesComments = "9k likes 179 comments"

        
        
        let postBillGates = Post()
        postBillGates.name = "Bill Gates"
        postBillGates.statusText = "In domestic matters, the sudden outlawing of Rs 500 and Rs 1,000 notes has caused a turmoil in all sectors of the economy, resulting in severe inconvenience to individuals and throwing trade"
        postBillGates.profileImageName = "billgates"
        postBillGates.statusImageUrl = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/gates_background.jpg"
        postBillGates.likesComments = "956k likes 1789 comments"

        
        
        let postGandhi = Post()
        postGandhi.name = "Mahatma Gandhi"
        postGandhi.statusText = "In domestic matters, the sudden outlawing of Rs 500 and Rs 1,000"
        postGandhi.profileImageName = "gandhi"
        postGandhi.statusImageUrl = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/gandhi_status.jpg"
        postGandhi.likesComments = "96M likes 1900 comments"

        
        let postSteve = Post()
        postSteve.name = "Steve jobs"
        postSteve.statusText = "In domestic matters, the sudden outlawing of Rs 500 and Rs 1,000"
        postSteve.profileImageName = "steve"
        postSteve.statusImageUrl = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/steve_jobs_background.jpg"
        postSteve.likesComments = "9M likes 100 comments"

        
        
        let postPavan = Post()
        postPavan.name = "Pavan kumar Reddy"
        postPavan.statusText = "Hello how are you!!☘"
        postPavan.profileImageName = "FullSizeRender"
        postPavan.statusImageUrl  = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/gandhi_status.jpg"
        postPavan.likesComments = "1M likes 190 comments"

        
        
        let postVarnitha = Post()
        postVarnitha.name = "Reddy"
        postVarnitha.statusText = "Sooooo good!!!🌺"
        postVarnitha.profileImageName = "FullSizeRender"
        postVarnitha.statusImageUrl =  "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/gandhi_status.jpg"
        
        
        let postTimCook = Post()
        postTimCook.name = "Tim Cook"
        postTimCook.profileImageName = "timeCook"
        postTimCook.statusText = "The worst thing in the world that can happen to you if you're an engineer that has given his life to something is for someone to rip it off and put their name on it."
        postTimCook.statusImageUrl = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/Tim+Cook.png"
        postTimCook.likesComments = "14M likes 10 comments"

        
        
        let postDonaldTrump = Post()
        postDonaldTrump.name = "Donald Trump"
        postDonaldTrump.profileImageName = "trump"
        postDonaldTrump.statusText = "An ‘extremely credible source’ has called my office and told me that Barack Obama’s birth certificate is a fraud."
        postDonaldTrump.statusImageUrl = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/trump_background.jpg"
        postDonaldTrump.likesComments = "1M likes 103 comments"

        
        
        postsList = [postPavan , postGandhi , postVarnitha , postMark ,postBillGates , postSachin ,postSteve , postTimCook , postDonaldTrump]
    }
    
    
    func numberOfPosts() -> Int {
        return postsList.count
    }
    
    
    subscript(indexPath: IndexPath) -> Post
        {
        get
        {
            return postsList[(indexPath as NSIndexPath).item]
        }
    }
    
    
}

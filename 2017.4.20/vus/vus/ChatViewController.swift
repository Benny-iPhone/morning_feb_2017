//
//  ChatViewController.swift
//  vus
//
//  Created by Benny Davidovitz on 20/04/2017.
//  Copyright © 2017 xcoder.solutions. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class ChatViewController: JSQMessagesViewController {

    var room : Room!
    var messages : [JSQMessage] = []
    
    var incomingBubble : JSQMessagesBubbleImage!
    var outgoingBubble : JSQMessagesBubbleImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let factory = JSQMessagesBubbleImageFactory()
        incomingBubble = factory?.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
        outgoingBubble = factory?.outgoingMessagesBubbleImage(with: .jsq_messageBubbleLightGray())
        
        collectionView.collectionViewLayout.incomingAvatarViewSize = .zero
        collectionView.collectionViewLayout.outgoingAvatarViewSize = .zero
        
        
        self.senderDisplayName = DBManager.manager.username
        self.senderId = DBManager.manager.uid
        
        navigationItem.title = room.name
        
        let since = Date()
        DBManager.manager.readMessages(in: self.room) { (arr) in
            self.messages = arr
            self.finishReceivingMessage()
        }
        
        DBManager.manager.observeMessages(in: self.room, since: since) { (msg) in
            self.messages.append(msg)
            self.finishReceivingMessage()
        }
        
    }
    
    deinit {
        room.chatRef.removeAllObservers()
    }
    
    override func didPressAccessoryButton(_ sender: UIButton!) {
        
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        DBManager.manager.addMessage(text: text, to: self.room)
        self.finishSendingMessage()
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        
        let msg = messages[indexPath.item]
        if msg.senderId == self.senderId{
            return outgoingBubble
        } else {
            return incomingBubble
        }
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForCellTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
    
        guard indexPath.item % 10 == 0 else {
            return nil
        }
        
        let msg = messages[indexPath.item]
        return JSQMessagesTimestampFormatter.shared().attributedTimestamp(for: msg.date)

        
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForCellTopLabelAt indexPath: IndexPath!) -> CGFloat {
        
        return indexPath.item % 10 == 0 ? 20 : 0
        
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        
        let msg = messages[indexPath.item]
        if msg.senderId == self.senderId{
            return 0
        }
        
        return 20
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        let msg = messages[indexPath.item]
        if msg.senderId == self.senderId{
            return nil
        }
        
        return NSAttributedString(string: msg.senderDisplayName)
    }
    

}






//
//  main.swift
//  linkedList
//
//  Created by 신한섭 on 2020/01/07.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Node{
    var data:Int
    var next:Node?
    
    init(_ data:Int){
        self.data=data
        self.next=nil
    }
}

class LinkedList{
    var head:Node?
    var tail:Node?
    
    init(){
        self.head=nil
        self.tail=nil
    }
    
    func insert(_ data:Int){
        let node:Node=Node(data)
        
        if self.head == nil{
            self.head=node
            self.tail=self.head
        } else{
            self.tail?.next=node
            self.tail=self.tail?.next
        }
    }

    func delete(_ data:Int){
        var curNode:Node?=self.head
        
        if self.head?.data == data{
            self.head=curNode?.next
            curNode=nil
        } else{
            var preNode:Node?
            while curNode?.next?.data != data{
                curNode=curNode?.next
            }
            preNode=curNode
            curNode=curNode?.next
            
            preNode?.next=curNode?.next
            curNode=nil
        }
    }
    
    func printData(){
        var curNode:Node?=self.head
        while curNode != nil {
            print("\(String(describing: curNode!.data)) ->",terminator:" ")
            curNode=curNode?.next
        }
        print()
    }
}




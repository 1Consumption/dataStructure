//
//  main.swift
//  doublyLinkedList
//
//  Created by 신한섭 on 2020/01/08.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Node{
    var data:Int
    var pre:Node?
    var next:Node?
    
    init(_ data:Int){
        self.data=data
        self.pre=nil
        self.next=nil
    }
}

class DoublyLinkedList{
    var head:Node?
    var tail:Node?
    var numOfNodes:Int
    
    init(){
        self.head=nil
        self.tail=nil
        self.numOfNodes=0
    }
    
    func add(_ data:Int){
        let node:Node = Node(data)
        if self.head == nil{
            self.head=node
            self.tail=self.head
        } else if self.head?.next == nil {
            self.tail=node
            self.head?.next=tail
            self.tail?.pre=self.head
        } else{
            node.pre=tail
            self.tail?.next=node
            self.tail=self.tail?.next
        }
        numOfNodes+=1
    }
    
    func insert(_ data:Int,_ targetIndex:Int){
        if targetIndex == 0{
            
        } else{
            
        }
        numOfNodes+=1
    }
    
    func delete(_ data:Int) -> Int {
        numOfNodes-=1
        return 0
    }
    
    func delete(index:Int) -> Int{
        numOfNodes-=1
        return 0
    }
    
    func printList(){
        var curNode=head
        while curNode != nil {
            print("\(curNode!.data) ->",terminator:" ")
            curNode=curNode?.next
        }
        print()
    }
}

var doublyLinkedList=DoublyLinkedList()

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
        self.numOfNodes+=1
    }
    
    func insert(_ data:Int,_ targetIndex:Int){
        let node:Node = Node(data)
        if targetIndex == 0{
            node.next=self.head
            self.head?.pre=node
            self.head=node
        } else if targetIndex >= self.numOfNodes {
            node.pre=self.tail
            self.tail?.next=node
            self.tail=node
        } else{
            var curNode:Node?
            curNode=searchNode(targetIndex)
            curNode?.pre?.next=node
            node.pre=curNode?.pre
            node.next=curNode
            curNode?.pre=node
        }
        self.numOfNodes+=1
    }
    
    func delete(_ data:Int) -> Int {
        var curNode:Node?
        var deleteValue:Int=0
        if hasValue(data){
            if self.head!.data == data{
                curNode=self.head
                deleteValue=curNode!.data
                self.head=head?.next
                self.head?.pre=nil
                curNode=nil
            } else if self.tail!.data == data{
                curNode=self.tail
                deleteValue=curNode!.data
                self.tail=self.tail?.pre
                self.tail?.next=nil
                curNode=nil
            } else{
                curNode=self.head
                while curNode!.data != data{
                    curNode=curNode?.next
                }
                deleteValue=curNode!.data
                curNode?.pre?.next=curNode?.next
                curNode?.next?.pre=curNode?.pre
                curNode=nil
            }
            self.numOfNodes-=1
        } else{
            print("해당 값은 없습니다.")
        }
        return deleteValue
    }
    
    func delete(targetIndex:Int) -> Int{
        var curNode:Node?
        var deleteValue:Int=0
        if targetIndex == 0 {
            curNode=self.head
            deleteValue=curNode!.data
            self.head=head?.next
            self.head?.pre=nil
            curNode=nil
        } else if targetIndex >= self.numOfNodes-1{
            curNode=self.tail
            deleteValue=curNode!.data
            self.tail=self.tail?.pre
            self.tail?.next=nil
            curNode=nil
        } else{
            curNode=searchNode(targetIndex)
            deleteValue=curNode!.data
            curNode?.pre?.next=curNode?.next
            curNode?.next?.pre=curNode?.pre
            curNode=nil
        }
        self.numOfNodes-=1
        return deleteValue
    }
    
    func searchNode(_ targetIndex:Int) -> Node?{
        var curNode:Node?
        if targetIndex < self.numOfNodes/2 {
            curNode=self.head
            for _ in 0..<targetIndex{
                curNode=curNode?.next
            }
        } else{
            curNode=tail
            for _ in 0..<self.numOfNodes-1-targetIndex{
                curNode=curNode?.pre
            }
        }
        return curNode
    }
    
    func printList(){
        var curNode=head
        while curNode != nil {
            print("\(curNode!.data) ->",terminator:" ")
            curNode=curNode?.next
        }
        print()
    }
    
    func printListReverse(){
        var curNode=tail
        while curNode != nil {
            print("\(curNode!.data) ->",terminator:" ")
            curNode=curNode?.pre
        }
        print()
    }
    
    func hasValue(_ data:Int) -> Bool{
        var curNode=head
        while curNode != nil{
            if curNode!.data == data{
                return true
            }
            curNode=curNode?.next
        }
        return false
    }
}

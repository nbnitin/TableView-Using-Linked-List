//
//  Posts.swift
//  App Using Linked List
//
//  Created by Nitin on 10/01/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import Foundation

class Posts:Decodable {
    let userId : Int
    let id : Int
    let title : String
    let body : String
    
    init(userId:Int,id:Int,title:String,body:String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
}

class Node {
    let data : Posts
    var next : Node?
    
    init(data : Posts) {
        self.data = data
    }
}

class LinkedList {
    
        var head : Node?
        var tail : Node?
        
        public var isEmpty : Bool {
            return head == nil
        }
        
        public var first : Node? {
            return head
        }
        
        public var last : Node? {
            return tail
        }
        
        public func append(value : Posts) {
            let newNode = Node(data: value)
            if var h = head {
                while h.next != nil {
                    h = h.next!
                }
                h.next = newNode
            } else {
                head = newNode
                tail = newNode
            }
        }
        
        public func addNode(value : Posts) {
            let newNode = Node(data: value)
            print("head",head?.data)
            print("head next",head?.next)
    //        print("before tail next",tail?.next)
    //        print("before tail",tail?.data)
    //        print("before head next",head?.next)

            tail?.next = newNode
             print("after tail next",tail?.next)
            print("after head next",head?.next)

            tail = newNode
            
            print("after head next",head?.next)

            print("after tail next",tail?.next)
            print("after tail",tail?.data)
        }
        
        public func getCount()->Int{
            var current: Node? = head
            var count = 0
            //assign the next instance
            while (current != nil) {
                current = current?.next
                count += 1
            }
            return count
        }
        
//        public func insertAt(value:Posts,position:Posts){
//            let newNode = Node(data: value)
//            var previous = head
//            var current = head
//
//            if ( position == 0 ) {
//                newNode.next = previous
//                head = newNode
//            } else {
//            for _ in 0..<position {
//                previous = current
//                current = current?.next
//    //            print(previous?.data)
//    //            print(current?.data)
//            }
//            newNode.next = current
//            previous?.next = newNode
//
//            }
//        }
        
        public func deleteItemAtPosition(position:Int) {
            var previous = head
            var current = head
            
            if ( position == 0 ) {
                head = previous?.next
            } else {
                for _ in 0..<position where previous?.next != nil {
                    previous = current
                    current = current?.next
                    
                }
                
                previous?.next = current?.next
            }
        }
    
    public func searchByPosition(position:Int)->Node? {
        var current = head
        
        if ( position == 0 ) {
            return current
        }
        for _ in 0..<position where current?.next != nil {
            current = current?.next
        }
        return current
    }
        
//        public func searchItem(valueToBeSearched : )->(Int,String) {
//
//            if var h = head {
//                if ( h.data == valueToBeSearched ) {
//                    return (0,"Found at position 1, and it is head")
//                }
//                var count = 1
//                var flag = false
//                var isTail = false
//                while h.next != nil {
//
//                    if ( h.data == valueToBeSearched ) {
//                        flag = true
//
//                        if ( h.next == nil ) {
//                            isTail = true
//                        }
//                        break
//                    } else {
//                        h = h.next!
//                        count += 1
//
//                    }
//
//                }
//
//                if ( h.next == nil && h.data == valueToBeSearched ) {
//                    flag = true
//                    isTail = true
//                }
//
//
//                if ( flag ) {
//                    if ( isTail ) {
//                       return (count - 1,"Found at position \(count) and its tail.")
//                    }
//                    return (count - 1,"Found at position \(count)")
//                }
//                return (-1,"\(valueToBeSearched) not found.")
//
//            } else {
//                return (-1,"List not available")
//            }
//
//        }
        
//        public func deleteByElement(ele : Int)->Bool{
//            let index = searchItem(valueToBeSearched: ele).0
//            if ( index > -1 ) {
//                deleteItemAtPosition(position: index)
//                return true
//            }
//            return false
//        }
        
        public func removeAll() {
            if var h = head {
                while h.next != nil {
                    head = h.next
                    h = h.next!

                }
                head = nil
            }
        }
        
//        public func mergeSort(h:Node?) ->Node?
//          {
//
//            print("h \(h?.data)")
//              // Base case : if head is null
//            if ( h == nil || h?.next == nil ) {
//                return h
//            }
//
//              // get the middle of the list
//            let middle = getMiddle(head: h)
//            let nextofmiddle = middle?.next
//
//              // set the next of middle node to null
//            middle?.next = nil
//
//              // Apply mergeSort on left list
//            let left = mergeSort(h: h)
//
//              // Apply mergeSort on right list
//            let right = nextofmiddle == nil ? nil : mergeSort(h: nextofmiddle!)
//
//              // Merge the left and right lists
//            let sortedlist = sortedMerge(a:left, b:right)
//              return sortedlist
//          }
//
//       func sortedMerge(a:Node?, b:Node?)->Node?
//          {
//            let result : Node?
//              /* Base cases */
//            if (a == nil) {
//                return b
//            }
//            if (b == nil) {
//                return a
//            }
//
//              /* Pick either a or b, and recur */
//              if (a!.data <= b!.data) {
//                  result = a;
//                result!.next = sortedMerge(a:a!.next, b:b);
//              }
//              else {
//                  result = b;
//                result!.next = sortedMerge(a:a, b:b?.next);
//              }
//              return result;
//          }
//
//
//        public func getMiddle(head : Node?)->Node? {
//                   if (head == nil) {
//                return head
//            }
//
//            var slow = head
//            var fast = head
//
//            while (fast?.next != nil && fast?.next?.next != nil) {
//                slow = slow?.next
//                fast = fast?.next?.next
//            }
//            return slow
//
//        }
//

        
    

}

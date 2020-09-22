### 설명
* Breadth First Search, 즉 너비 우선 탐색
* 시작 노드부터 가까운 노드를 방문함. -> 멀리 있는 노드는 나중에 방문.
* 현재 노드의 인접 노드 배열을 queue(willVisit 배열)에 삽입 후 dequeue한 노드를 방문하고, 해당 노드의 인접 노드를 다시 queue에 삽입.
* queue에 더이상 값이 없으면 방문 가능한 모든 노드를 방문한 것임.

### 코드
``` swift 
protocol Nodeable {
    var id: Int { get set }
    var adjacentNodes: [Int] { get set }
    var isVisited: Bool { get set }
}

func BFS<T: Nodeable>(nodes: inout [T], index: Int) {
    var willVisit: [Int] = [Int]()
    nodes[index].isVisited = true
    print(nodes[index].id)
    willVisit.append(contentsOf: nodes[index].adjacentNodes)
    
    while true {
        guard let currentID = willVisit.first else {
            break
        }
        willVisit.remove(at: 0)
        
        if nodes[currentID - 1].isVisited == false {
            nodes[currentID - 1].isVisited = true
            print(nodes[currentID - 1].id)
            willVisit.append(contentsOf: nodes[currentID - 1].adjacentNodes)
        }
    }
}
```

### 사용 예시
```swift
var nodes = [Node]()

nodes.append(Node(id: 1, adjacentNodes: [2, 3]))
nodes.append(Node(id: 2, adjacentNodes: [1, 4, 5]))
nodes.append(Node(id: 3, adjacentNodes: [1, 6]))
nodes.append(Node(id: 4, adjacentNodes: [2, 7, 8]))
nodes.append(Node(id: 5, adjacentNodes: [2]))
nodes.append(Node(id: 6, adjacentNodes: [3]))
nodes.append(Node(id: 7, adjacentNodes: [4]))
nodes.append(Node(id: 8, adjacentNodes: [4]))

BFS(nodes: &nodes, index: 0)
```

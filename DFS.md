### 설명
* Depth First Search 즉, 깊이 우선 탐색
* 노드를 방문하면 isVisited 프로퍼티를 true로 변경
* 인접 노드 배열을 돌면서 DFS 메소드를 호출함. -> 이미 방문한 노드에 대해서는 DFS 메소드가 실행되지 않음.

### 코드
``` swift 
protocol Nodeable {
    var id: Int { get set }
    var adjacentNodes: [Int] { get set }
    var isVisited: Bool { get set }
}

func DFS<T: Nodeable>(nodes: inout [T], index: Int, depth: Int) {
    nodes[index].isVisited = true
    print("depth: \(depth) / id : \(nodes[index].id)")
    
    for adjacentID in nodes[index].adjacentNodes {
        if nodes[adjacentID - 1].isVisited == false {
            DFS(nodes: &nodes, index: adjacentID - 1, depth: depth + 1)
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

DFS(nodes: &nodes, index: 0, depth: 0)
```

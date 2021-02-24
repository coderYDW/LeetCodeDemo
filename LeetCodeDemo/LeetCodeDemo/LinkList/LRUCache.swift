class LRUCache {

    static let notFound = -1
    private var cache: [Int: Node]
    private let capacity: Int

    // use dedicated head and tail node to simplify the algorithm
    private let head = Node(key: 0, value: 0)
    private let tail = Node(key: 0, value: 0)

    init(_ capacity: Int) {
        self.capacity = capacity
        cache = [Int: Node](minimumCapacity: capacity)
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            moveNodeToHead(node)
            return node.value
        }
        return LRUCache.notFound
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            node.value = value
            moveNodeToHead(node)
        } else {
            if cache.count >= capacity {
                let node = removeTail()
                cache.removeValue(forKey: node.key)
            }
            let node = Node(key: key, value: value)
            cache[key] = node
            addNodeToHead(node)
        }
    }

    func removeTail() -> Node {
        let node = tail.prev!
        removeNode(node)
        return node
    }

    func removeNode(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
//        let prev = node.prev
//        let next = node.next
//        prev?.next = next
//        next?.prev = prev
    }

    func addNodeToHead(_ node: Node) {
        node.next = head.next
        node.prev = head
        head.next?.prev = node
        head.next = node
    }

    internal func moveNodeToHead(_ node: Node) {
        removeNode(node)
        addNodeToHead(node)
    }

    final class Node {
        var key: Int
        var value: Int
        var prev: Node?
        var next: Node?
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

class LRUCache {

    static let notFound = -1

    private var dict: [Int: Node]
    private let capacity: Int

    // use dedicated head and tail node to simplify the algorithm
    private let head = Node(key: 0, value: 0)
    private let tail = Node(key: 0, value: 0)

    init(_ capacity: Int) {
        self.capacity = capacity
        dict = [Int: Node](minimumCapacity: capacity)
        head.next = tail
        tail.prev = head
    }

    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            moveNodeToHead(node)
            return node.value
        }
        return LRUCache.notFound
    }

    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.value = value
            moveNodeToHead(node)
        } else {
            if dict.keys.count >= capacity {
                let last = removeTail()
                dict[last.key] = nil
            }
            let node = Node(key: key, value: value)
            dict[key] = node
            addNodeToHead(node)
        }
    }

    private func addNodeToHead(_ node: Node) {
        head.next?.prev = node
        node.next = head.next

        node.prev = head
        head.next = node
    }

    private func removeNode(_ node: Node) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
    }

    private func moveNodeToHead(_ node: Node) {
        removeNode(node)
        addNodeToHead(node)
    }

    private func removeTail() -> Node {
        let last = tail.prev!
        tail.prev = last.prev
        last.prev!.next = tail
        return last
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

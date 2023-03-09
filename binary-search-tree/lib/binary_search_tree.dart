class BinarySearchTree {
  // Put your code here
  Node _root;
  BinarySearchTree(String rootData) : _root = Node(int.parse(rootData));

  Node get root => _root;

  void insert(String data) {
    int rawData = int.parse(data);
    var inserted = false;
    Node? currentNode = root;
    while (!inserted) {
      if (currentNode!.isEmpty) {
        currentNode.updateData(rawData);
        inserted = true;
      } else {
        if (rawData <= currentNode.rawData)
          currentNode = currentNode.left;
        else
          currentNode = currentNode.right;
      }
    }
  }

  List<String> get sortedData {
    List<String> res = [];
    Node? rootCopy = Node.fromNode(root);
    bool sorted = false;
    Node? currentNode = rootCopy;
    Node? previousNode = rootCopy;

    while (!sorted) {
      if (!currentNode!.left!.isEmpty) {
        previousNode = currentNode;
        currentNode = currentNode.left;
        continue;
      }
      if (!currentNode.isEmpty) {
        res.add(currentNode.data);
        currentNode.clear();
        currentNode =
            currentNode.right!.isEmpty ? previousNode : currentNode.right;
        continue;
      }

      if (!currentNode.hasRightNode &&
          !currentNode.hasLeftNode &&
          currentNode != rootCopy) {
        currentNode = rootCopy;
        continue;
      }

      sorted = true;
    }

    return res;
  }
}

class Node {
  Node? left;
  int? _data;
  Node? right;

  Node.emptyNode();

  Node.fromNode(Node node)
      : _data = node.rawData,
        left = node.left,
        right = node.right;

  Node(this._data)
      : left = Node.emptyNode(),
        right = Node.emptyNode();

  int get rawData => _data!;
  String get data => _data.toString();
  bool get isEmpty => _data == null;
  bool get hasLeftNode => !left!.isEmpty;
  bool get hasRightNode => !right!.isEmpty;

  void updateData(int rawData) {
    left = Node.emptyNode();
    right = Node.emptyNode();
    _data = rawData;
  }

  void clear() => _data = null;
}

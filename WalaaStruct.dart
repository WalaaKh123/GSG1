import 'dart:io';

// ---------------- Stack Challenges ----------------

// Challenge 1: Reverse a list using stack
void reverseList(List<int> list) {
  List<int> stack = [];
  for (var item in list) {
    stack.add(item);
  }
  while (stack.isNotEmpty) {
    print(stack.removeLast());
  }
}

// Challenge 2: Check for balanced parentheses
bool isBalanced(String input) {
  List<String> stack = [];
  for (var ch in input.split('')) {
    if (ch == '(') {
      stack.add(ch);
    } else if (ch == ')') {
      if (stack.isEmpty) return false;
      stack.removeLast();
    }
  }
  return stack.isEmpty;
}

// ---------------- Linked List Implementation ----------------

class Node<T> {
  T value;
  Node<T>? next;
  Node(this.value);
}

class LinkedList<T> {
  Node<T>? head;

  void append(T value) {
    if (head == null) {
      head = Node(value);
    } else {
      Node<T> current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = Node(value);
    }
  }

  void printList() {
    Node<T>? current = head;
    while (current != null) {
      stdout.write("${current.value} -> ");
      current = current.next;
    }
    print("null");
  }

  // Challenge 1: Print in reverse
  void printInReverse([Node<T>? node]) {
    node ??= head;
    if (node == null) return;
    if (node.next != null) printInReverse(node.next);
    print(node.value);
  }

  // Challenge 2: Find middle node
  Node<T>? findMiddle() {
    Node<T>? slow = head;
    Node<T>? fast = head;
    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }
    return slow;
  }

  // Challenge 3: Reverse the linked list
  void reverse() {
    Node<T>? prev;
    Node<T>? current = head;
    while (current != null) {
      Node<T>? next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
    head = prev;
  }

  // Challenge 4: Remove all occurrences
  void removeAll(T value) {
    while (head != null && head!.value == value) {
      head = head!.next;
    }

    Node<T>? current = head;
    while (current?.next != null) {
      if (current!.next!.value == value) {
        current.next = current.next!.next;
      } else {
        current = current.next;
      }
    }
  }
}

// ---------------- Main Function ----------------

void main() {
  // Stack challenge 1
  print("📦 Stack - Reverse List:");
  reverseList([1, 2, 3, 4]);

  // Stack challenge 2
  print("\n📦 Stack - Balanced Parentheses:");
  print(isBalanced("((hello))")); // true
  print(isBalanced("(nope("));     // false

  // Linked List setup
  LinkedList<int> list = LinkedList<int>();
  for (var i in [1, 2, 3, 4, 5, 3]) {
    list.append(i);
  }

  // Linked list challenge 1
  print("\n🔗 LinkedList - Print in Reverse:");
  list.printInReverse();

  // Linked list challenge 2
  print("\n🔗 LinkedList - Middle Node:");
  print(list.findMiddle()?.value);

  // Linked list challenge 3
  print("\n🔗 LinkedList - Reversed List:");
  list.reverse();
  list.printList();

  // Linked list challenge 4
  print("\n🔗 LinkedList - Remove All 3s:");
  list.removeAll(3);
  list.printList();
}

import 'Algorithm.dart';
import 'Utils.dart';

class Heap<T extends Comparable<T>> with SortUtils {
  List<T> _heap = [];

  Heap(this._heap);

  void _heapSubtree(int rootIndex, int lastChild) {
    int leftIndex = rootIndex * 2 + 1;
    int rightIndex = rootIndex * 2 + 2;
    T root = _heap[rootIndex];
    if (rightIndex <= lastChild) {
      // if has right and left children
      T left = _heap[leftIndex];
      T right = _heap[rightIndex];
      if (less(left, right) && less(left, root)) {
        swap(_heap, leftIndex, rootIndex);
        _heapSubtree(leftIndex, lastChild);
      } else if (less(right, root)) {
        swap(_heap, rightIndex, rootIndex);
        _heapSubtree(rightIndex, lastChild);
      }
    } else if (leftIndex <= lastChild) {
      // if no right child, but has left child
      T left = _heap[leftIndex];
      if (less(left, root)) {
        swap(_heap, leftIndex, rootIndex);
        _heapSubtree(leftIndex, lastChild);
      }
    }
  }

  /**
         * Makes heap with root as root
         *
         * @param root index of root of heap
         */
  void _makeMinHeap(int root) {
    int leftIndex = root * 2 + 1;
    int rightIndex = root * 2 + 2;
    bool hasLeftChild = leftIndex < _heap.length;
    bool hasRightChild = rightIndex < _heap.length;
    if (hasRightChild) {
      // if has left and right
      _makeMinHeap(leftIndex);
      _makeMinHeap(rightIndex);
      _heapSubtree(root, _heap.length - 1);
    } else if (hasLeftChild) {
      _heapSubtree(root, _heap.length - 1);
    }
  }

  /**
         * Gets the root of heap
         *
         * @return root of heap
         */
  T _getRoot(int size) {
    swap(_heap, 0, size);
    _heapSubtree(0, size - 1);
    return _heap[size]; // return old root
  }
}

class HeapSort with SortUtils implements SortAlgorithm {
  @override
  List<T> sort<T extends Comparable<T>>(List<T> unsorted) {
    int size = unsorted.length;

    Heap<T> heap = Heap(unsorted);

    heap._makeMinHeap(0); // make min heap using index 0 as root.
    List<T> sorted = [];
    while (size > 0) {
      T min = heap._getRoot(--size);
      sorted.add(min);
    }

    return sorted;
  }

  /**
     * Main method
     *
     * @param args the command line arguments
     */

}

void main() {
  List<int> heap = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  HeapSort heapSort = HeapSort();
  print(heapSort.sort<num>(heap));
}

import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  List<int> nums = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  List<String> letters = ["c", "a", "e", "b", "d"];

  CircleSort circle = CircleSort();
  print(circle.sort<num>(nums));
  print(circle.sort(letters));
}

class CircleSort with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    int n = unsorted.length;
    while (doSort(unsorted, 0, n - 1)) {}
    return unsorted;
  }

  bool doSort<T extends Comparable<T>>(List<T> array, int left, int right) {
    bool swapped = false;

    if (left == right) {
      return false;
    }

    int low = left;
    int high = right;

    while (low < high) {
      if (array[low].compareTo(array[high]) > 0) {
        swap(array, low, high);
        swapped = true;
      }
      low++;
      high--;
    }

    if (low == high && array[low].compareTo(array[high + 1]) > 0) {
      swap(array, low, high + 1);
      swapped = true;
    }

    int mid = left + (right - left) ~/ 2;
    bool leftHalf = doSort(array, left, mid);
    bool leftRight = doSort(array, mid + 1, right);

    return swapped || leftHalf || leftRight;
  }
}

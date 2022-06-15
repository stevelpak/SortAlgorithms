import 'algorithm.dart';

void main(List<String> args) {
  List<int> nums = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  List<String> letters = ["c", "a", "e", "b", "d"];
  SelectionSort selectionSort = SelectionSort();

  print(selectionSort.sort<num>(nums));
  print(selectionSort.sort(letters));
}

class SelectionSort implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    int n = unsorted.length;

    for (var i = 0; i < n - 1; i++) {
      int minIndex = i;

      for (var j = i + 1; j < n; j++) {
        if (unsorted[minIndex].compareTo(unsorted[j]) > 0) {
          minIndex = j;
        }
      }

      if (minIndex != i) {
        T temp = unsorted[i];
        unsorted[i] = unsorted[minIndex];
        unsorted[minIndex] = temp;
      }
    }

    return unsorted;
  }
}

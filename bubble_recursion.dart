import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  var array = [5, 6, 7, 1, 0, 10, 15, 2];

  BubbleSortRecursion sorting = BubbleSortRecursion();
  var newArray = sorting.sort<num>(array);
  print(newArray);
}

class BubbleSortRecursion with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    bubbleSort(unsorted, unsorted.length);
    return unsorted;
  }

  bubbleSort<T extends Comparable<T>>(List<T> unsorted, int len) {
    bool swapped = false;

    for (var i = 0; i < len - 1; i++) {
      if (greater(unsorted[i], unsorted[i + 1])) {
        swap(unsorted, i, i + 1);
        swapped = true;
      }
    }

    if (swapped) {
      bubbleSort(unsorted, len - 1);
    }
  }
}

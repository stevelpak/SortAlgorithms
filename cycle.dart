import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  List<int> nums = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  List<String> letters = ["c", "a", "e", "b", "d"];

  Cycle cycle = Cycle();
  cycle.sort<num>(nums);
  cycle.sort(letters);
}

class Cycle with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    int n = unsorted.length;

    for (var j = 0; j < n - 2; j++) {
      T item = unsorted[j];
      int pos = j;

      for (var i = j + 1; i < n; i++) {
        if (less(unsorted[i], item)) {
          pos++;
        }
      }

      if (pos == j) {
        continue;
      }

      while (item.compareTo(unsorted[pos]) == 0) {
        pos += 1;
      }

      if (pos != j) {
        item = replace(unsorted, pos, item);
      }

      while (pos != j) {
        pos = j;

        for (var i = j + 1; i < n; i++) {
          if (less(unsorted[i], item)) {
            pos += 1;
          }
        }

        while (item.compareTo(unsorted[pos]) == 0) {
          pos += 1;
        }

        if (item != unsorted[pos]) {
          item = replace(unsorted, pos, item);
        }
      }
    }

    print(unsorted);
  }

  T replace<T extends Comparable<T>>(List<T> arr, int pos, T item) {
    T temp = item;
    item = arr[pos];
    arr[pos] = temp;

    return item;
  }
}

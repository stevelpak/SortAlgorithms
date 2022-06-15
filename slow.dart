import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  List<int> nums = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  List<String> letters = ["c", "a", "e", "b", "d"];

  Slow slow = Slow();
  print(slow.sort<num>(nums));
  print(slow.sort(letters));
}

class Slow with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    sort2(unsorted, 0, unsorted.length - 1);
    return unsorted;
  }

  sort2<T extends Comparable<T>>(List<T> array, int i, int j) {
    if (i.compareTo(j) >= 0) {
      return;
    }

    int m = (i + j) ~/ 2;
    sort2(array, i, m);
    sort2(array, m + 1, j);

    if (less(array[j], array[m])) {
      T temp = array[j];
      array[j] = array[m];
      array[m] = temp;
    }
    sort2(array, i, j - 1);
  }
}

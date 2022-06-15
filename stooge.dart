import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  List<int> nums = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  List<String> letters = ["c", "a", "e", "b", "d"];

  Stooge stooge = Stooge();
  print(stooge.sort<num>(nums));
  print(stooge.sort(letters));
}

class Stooge with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    sort2(unsorted, 0, unsorted.length);
    return unsorted;
  }

  sort2<T extends Comparable<T>>(List<T> array, int start, int end) {
    if (less(array[end - 1], array[start])) {
      T temp = array[start];
      array[start] = array[end - 1];
      array[end - 1] = temp;
    }

    int len = end - start;
    if (len > 2) {
      int third = len ~/ 3;
      sort2(array, start, end - third);
      sort2(array, start + third, end);
      sort2(array, start, end - third);
    }

    return array;
  }
}

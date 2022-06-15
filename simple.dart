import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  List<int> nums = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  List<String> letters = ["c", "a", "e", "b", "d"];

  Simple simple = Simple();
  print(simple.sort<num>(nums));
  print(simple.sort(letters));
}

class Simple with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    final int length = unsorted.length;

    for (var i = 0; i < length; i++) {
      for (var j = i + 1; j < length; j++) {
        if (less(unsorted[j], unsorted[i])) {
          T element = unsorted[j];
          unsorted[j] = unsorted[i];
          unsorted[i] = element;
        }
      }
    }

    return unsorted;
  }
}

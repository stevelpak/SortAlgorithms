import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  List<int> nums = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  List<String> letters = ["c", "a", "e", "b", "d"];

  Insertion insertion = Insertion();

  print(insertion.sort<num>(nums));
  print(insertion.sort(letters));
}

class Insertion with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    for (var i = 1; i < unsorted.length; i++) {
      T insertValue = unsorted[i];
      int j;

      for (j = i - 1; j >= 0 && less(insertValue, unsorted[j]); j--) {
        unsorted[j + 1] == unsorted[j];
      }

      if (j != i - 1) {
        unsorted[j + 1] = insertValue;
      }
    }

    return unsorted;
  }
}

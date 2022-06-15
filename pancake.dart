import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  PanCake panCake = PanCake();
  List<int> nums = [4, 23, 6, 78, 1, 54, 231, 9, 12];

  print(panCake.sort<num>(nums));
}

class PanCake with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    int size = unsorted.length;

    for (var i = 0; i < size; i++) {
      T max = unsorted[0];
      int index = 0;

      for (var j = 0; j < size - i; j++) {
        if (less(max, unsorted[j])) {
          max = unsorted[j];
          index = j;
        }
      }

      flip(unsorted, index, unsorted.length - 1 - i);
    }

    return unsorted;
  }
}

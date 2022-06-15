import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  List<int> nums = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  List<String> letters = ["c", "a", "e", "b", "d"];

  Shell shell = Shell();

  print(shell.sort<num>(nums));
  print(shell.sort(letters));
}

class Shell with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    int length = unsorted.length;
    int gap = 1;

    while (gap < length / 3) {
      gap = 3 * gap + 1;
    }

    for (; gap > 0; gap ~/= 3) {
      for (var i = gap; i < length; i++) {
        int j;
        T temp = unsorted[i];

        for (j = i; j >= gap && less(temp, unsorted[j - gap]); j -= gap) {
          unsorted[j] = unsorted[j - gap];
        }

        unsorted[j] = temp;
      }
    }

    return unsorted;
  }
}

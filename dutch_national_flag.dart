import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  List<int> nums = [4, 23, 6, 78, 1, 54, 231, 9, 12];

  DutchFlag dutchFlag = DutchFlag();
  print(dutchFlag.sort<num>(nums));
}

class DutchFlag with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    return flagSort(unsorted, unsorted[(unsorted.length ~/ 2).floor()]);
  }

  sort2<T extends Comparable<T>>(List<T> array, T intendedMiddle) {
    return flagSort(array, intendedMiddle);
  }

  flagSort<T extends Comparable<T>>(List<T> array, T intendedMiddle) {
    int i = 0, j = 0, k = array.length - 1;

    while (j <= k) {
      if (0 > array[j].compareTo(intendedMiddle)) {
        swap(array, i, j);
        j++;
        i++;
      } else if (0 < array[j].compareTo(intendedMiddle)) {
        swap(array, j, k);
        k--;
      } else {
        j++;
      }
    }

    return array;
  }
}

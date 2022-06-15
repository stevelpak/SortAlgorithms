import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  List<int> nums = [4, 23, 6, 78, 1, 26, 11, 23, 0, -6, 3, 54, 231, 9, 12];
  List<String> letters = [
    "c",
    "a",
    "e",
    "b",
    "d",
    "dd",
    "da",
    "zz",
    "AA",
    "aa",
    "aB",
    "Hb",
    "Z"
  ];

  Gnome gnome = Gnome();

  print(gnome.sort<num>(nums));
  print(gnome.sort(letters));
}

class Gnome with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    int i = 1, j = 2;

    while (i < unsorted.length) {
      if (less(unsorted[i - 1], unsorted[i])) {
        i = j++;
      } else {
        swap(unsorted, i - 1, i);
        if (--i == 0) {
          i = j++;
        }
      }
    }

    return unsorted;
  }
}

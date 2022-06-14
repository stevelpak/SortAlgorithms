import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  Comb comb = Comb();
  print(comb.sort<num>([5, 6, 1, 5, -2, 8, 0, 10]));
}

class Comb with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> array) {
    int size = array.length;
    int gap = size;
    bool swapped = true;

    while (gap != 1 || swapped) {
      gap = nextGap(gap);
      swapped = false;

      for (var i = 0; i < size - gap; i++) {
        if (less(array[i + gap], array[i])) {
          swapped = swap(array, i, i + gap);
        }
      }
    }
    return array;
  }

  int nextGap(int gap) {
    gap = (gap * 10) ~/ 13;

    return (gap < 1) ? 1 : gap;
  }
}

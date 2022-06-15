import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  List<int> nums = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  List<String> letters = ["c", "a", "e", "b", "d"];

  Swap swap = Swap();

  print(swap.sort<num>(nums));
  print(swap.sort(letters));
}

class Swap with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    int length = unsorted.length;
    int index = 0;

    while (index < length - 1) {
      int amountSmallerElements = this.getSmallerElementCount(unsorted, index);

      if (amountSmallerElements > 0 && index != amountSmallerElements) {
        T element = unsorted[index];
        unsorted[index] = unsorted[amountSmallerElements];
        unsorted[amountSmallerElements] = element;
      } else {
        index++;
      }
    }

    return unsorted;
  }

  int getSmallerElementCount<T extends Comparable<T>>(
      List<T> array, int index) {
    int counter = 0;

    for (var i = 0; i < array.length; i++) {
      if (less(array[i], array[index])) {
        counter++;
      }
    }

    return counter;
  }
}

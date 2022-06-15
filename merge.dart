import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {}

class Merge with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {}

  void doSort<T extends Comparable<T>>(List<T> array, int left, int right) {
    if (left < right) {
      int mid = (left + right) >>> 1;
      doSort(array, left, mid);
      doSort(array, mid + 1, right);
      merge(array, left, mid, right);
    }
  }

  void merge<T extends Comparable<T>>(
      List<T> array, int left, int mid, int right) {
    int length = right - left + 1;
    List<T> temp = List.filled(length, array[length]);
  }
}

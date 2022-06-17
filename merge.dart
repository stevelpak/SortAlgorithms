import 'Algorithm.dart';
import 'Utils.dart';

class MergeSort with SortUtils implements SortAlgorithm {
  /**
     * Generic merge sort algorithm implements.
     *
     * @param unsorted the array which should be sorted.
     * @param <T> Comparable class.
     * @return sorted array.
     */
  @override
  List<T> sort<T extends Comparable<T>>(List<T> unsorted) {
    _doSort(unsorted, 0, unsorted.length - 1);
    return unsorted;
  }

  /**
     * @param arr the array to be sorted.
     * @param left the first index of the array.
     * @param right the last index of the array.
     */
  void _doSort<T extends Comparable<T>>(List<T> arr, int left, int right) {
    if (left < right) {
      int mid = (left + right) >>> 1;
      _doSort(arr, left, mid);
      _doSort(arr, mid + 1, right);
      _merge(arr, left, mid, right);
    }
  }

  /**
     * Merges two parts of an array.
     *
     * @param arr the array to be merged.
     * @param left the first index of the array.
     * @param mid the middle index of the array.
     * @param right the last index of the array merges two parts of an array in
     * increasing order.
     */
  void _merge<T extends Comparable<T>>(
      List<T> arr, int left, int mid, int right) {
    int length = right - left + 1;
    List<T> temp = List.filled(length, arr[0]);
    int i = left;
    int j = mid + 1;
    int k = 0;

    while (i <= mid && j <= right) {
      if (arr[i].compareTo(arr[j]) <= 0) {
        temp[k++] = arr[i++];
      } else {
        temp[k++] = arr[j++];
      }
    }

    while (i <= mid) {
      temp[k++] = arr[i++];
    }

    while (j <= right) {
      temp[k++] = arr[j++];
    }
    List.copyRange(arr, left, temp, 0, length);
  }
}

void main() {
  MergeSort mergeSort = MergeSort();

  List<int> arr = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  print(mergeSort.sort<num>(arr));

  List<String> stringArray = ["c", "a", "e", "b", "d"];
  print(mergeSort.sort(stringArray));
}

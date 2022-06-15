import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  List<int> nums = [4, 23, 6, 78, 1, 54, 231, 9, 12];

  OddEven oddEven = OddEven();
  oddEven.sort(nums);
}

class OddEven with SortUtils {
  void sort(List<int> array) {
    bool sorted = false;

    while (!sorted) {
      sorted = true;

      for (var i = 1; i < array.length - 1; i += 2) {
        if (array[i] > array[i + 1]) {
          swap(array, i, i + 1);
          sorted = false;
        }
      }

      for (var i = 0; i < array.length - 1; i += 2) {
        if (array[i] > array[i + 1]) {
          swap(array, i, i + 1);
          sorted = false;
        }
      }
    }

    print(array);
  }
}

import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {
  List<int> nums = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  List<String> letters = ["c", "a", "e", "b", "d"];

  CocktailShaker cock = CocktailShaker();

  print(cock.sort<num>(nums));
  print(cock.sort(letters));
}

class CocktailShaker with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> array) {
    int lengthArr = array.length;
    int left = 0;
    int right = lengthArr - 1;
    int swappedLeft, swappedRight;

    while (left < right) {
      swappedRight = 0;

      for (var i = left; i < right; i++) {
        if (less(array[i + 1], array[i])) {
          swap(array, i, i + 1);
          swappedRight = i;
        }
      }

      right = swappedRight;
      swappedLeft = lengthArr - 1;

      for (var j = right; j > left; j--) {
        if (less(array[j], array[j - 1])) {
          swap(array, j - 1, j);
          swappedLeft = j;
        }
      }
      left = swappedRight;
    }

    return array;
  }
}

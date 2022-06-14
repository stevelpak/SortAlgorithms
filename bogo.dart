import 'dart:math';

void main(List<String> args) {
  Bogo bogo = Bogo();
  print(bogo.bogoSort([5, 4, 3, 2, 1]));
}

class Bogo {
  Random random = Random.secure();

  bool isSorted(List array) {
    for (var i = 0; i < array.length - 1; i++) {
      if (array[i] > array[i + 1]) {
        return false;
      }
    }

    return true;
  }

  List shuffle(List array) {
    for (var i = 0; i < array.length; i++) {
      var r = random.nextInt(array.length - 1);
      var temp = array[i];
      array[i] = array[r];
      array[r] = temp;
    }

    return array;
  }

  List bogoSort(List array) {
    while (isSorted(array) == false) {
      shuffle(array);
    }

    return array;
  }
}

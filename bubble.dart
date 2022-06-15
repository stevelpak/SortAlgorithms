void main(List<String> args) {
  Bubble bubble = Bubble();
  print(bubble.sort([1, 5, 9, 8, 1, 2, 10, 3]));
}

class Bubble {
  List sort(List array) {
    int len = array.length;

    for (var i = 1; i < len; i++) {
      for (var j = 0; j < len - i; j++) {
        if (array[j] > array[j + 1]) {
          var temp = array[j];
          array[j] = array[j + 1];
          array[j + 1] = temp;
        }
      }
    }

    return array;
  }
}

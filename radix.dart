void main(List<String> args) {
  List<int> nums = [5, 6, 1, 5, 8, 0, 10];

  Radix radix = Radix();
  radix.radixSort(nums, nums.length);
}

class Radix {
  int getMax(List<int> array, int n) {
    int mx = array[0];

    for (var i = 1; i < n; i++) {
      if (array[i] > mx) {
        mx = array[i];
      }
    }

    return mx;
  }

  void countSort(List<int> array, int n, int exp) {
    List<int> output = List.filled(n, 0);
    int i;
    List<int> count = List.filled(10, 0);

    for (var i = 0; i < n; i++) {
      count[(array[i] ~/ exp) % 10]++;
    }

    for (i = 1; i < 10; i++) {
      count[i] += count[i - 1];
    }

    for (i = n - 1; i >= 0; i--) {
      output[count[(array[i] ~/ exp) % 10] - 1] = array[i];
      count[(array[i] ~/ exp) % 10]--;
    }

    for (i = 0; i < n; i++) {
      array[i] = output[i];
    }
  }

  void radixSort(List<int> array, int n) {
    int m = getMax(array, n);

    for (int exp = 1; m / exp > 0; exp *= 10) {
      countSort(array, n, exp);
    }

    print(array);
  }
}

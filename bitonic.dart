import 'dart:io';

void main(List<String> args) {
  List<int> a = [3, 7, 4, 8, 6, 2, 1, 5];
  int up = 1;
  Bitonic ob = Bitonic();
  ob.sort(a, a.length, up);
  ob.printArr(a);
}

class Bitonic {
  void compAndSwap(List<int> a, int i, int j, int dir) {
    if ((a[i] > a[j] && dir == 1) || (a[i] < a[j] && dir == 0)) {
      int temp = a[i];
      a[i] = a[j];
      a[j] = temp;
    }
  }

  void bitonicMerge(List<int> a, int low, int cnt, int dir) {
    if (cnt > 1) {
      int k = cnt ~/ 2;

      for (var i = low; i < low + k; i++) {
        compAndSwap(a, i, i + k, dir);
      }

      bitonicMerge(a, low, k, dir);
      bitonicMerge(a, low + k, k, dir);
    }
  }

  void bitonicSort(List<int> a, int low, int cnt, int dir) {
    if (cnt > 1) {
      int k = cnt ~/ 2;

      bitonicSort(a, low, k, 1);
      bitonicSort(a, low + k, k, 0);
      bitonicMerge(a, low, cnt, dir);
    }
  }

  void sort(List<int> a, int N, int up) {
    bitonicSort(a, 0, N, up);
  }

  void printArr(List<int> arr) {
    int n = arr.length;

    for (var i = 0; i < n; i++) {
      stdout.write("${arr[i]} ");
    }
  }
}

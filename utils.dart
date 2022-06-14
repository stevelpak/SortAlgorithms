mixin SortUtils {
  bool greaterOrEqual<T extends Comparable<T>>(T v, T w) {
    return v.compareTo(w) >= 0;
  }

  bool greater<T extends Comparable<T>>(T v, T w) {
    return v.compareTo(w) > 0;
  }

  bool swap<T>(List<T> array, int inx, int iny) {
    T swap = array[inx];
    array[inx] = array[iny];
    array[iny] = swap;
    return true;
  }

  bool less<T extends Comparable<T>>(T v, T w) {
    return v.compareTo(w) < 0;
  }

  flip<T extends Comparable<T>>(List<T> array, int left, int right) {
    while (left <= right) {
      swap(array, left++, right--);
    }
  }
}

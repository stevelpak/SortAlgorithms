void main(List<String> args) {
  List<int> nums = [0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1];

  DNFSort dnfSort = DNFSort();
  dnfSort.sort012(nums, nums.length);
}

class DNFSort {
  void sort012(List<int> arr, int arr_size) {
    int low = 0;
    int high = arr_size - 1;
    int mid = 0, temp = 0;

    while (mid <= high) {
      switch (arr[mid]) {
        case 0:
          temp = arr[low];
          arr[low] = arr[mid];
          arr[mid] = temp;

          low++;
          mid++;
          break;
        case 1:
          mid++;
          break;
        case 2:
          temp = arr[mid];
          arr[mid] = arr[high];
          arr[high] = temp;
          high--;
          break;
      }
    }

    print(arr);
  }
}

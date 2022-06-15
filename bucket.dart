void main(List<String> args) {
  List<int> nums = [1, 5, 0, 3, 5, 8, 15, 10, 9];

  Bucket newBucket = Bucket();
  newBucket.bucket(nums);
  print(nums);
}

class Bucket {
  void bucket(List<int> array) {
    int maxNum = max(array);
    int minNum = min(array);
    int numberOfBuckets = maxNum - minNum + 1;

    List<List<int>> buckets = [];

    for (var i = 0; i < numberOfBuckets; i++) {
      buckets.add([]);
    }

    for (var element in array) {
      int hashNew = hash(element, minNum, numberOfBuckets);
      buckets[hashNew].add(element);
    }

    for (var element in buckets) {
      element.sort();
    }

    int index = 0;

    for (var element in buckets) {
      for (var value in element) {
        array[index++] = value;
      }
    }
  }

  int hash(int element, int min, int numberOfBucket) {
    return (element - min) ~/ numberOfBucket;
  }

  int max(List<int> array) {
    int max = array[0];

    for (var element in array) {
      if (element > max) {
        max = element;
      }
    }

    return max;
  }

  int min(List<int> array) {
    int min = array[0];

    for (var element in array) {
      if (element < min) {
        min = element;
      }
    }

    return min;
  }
}

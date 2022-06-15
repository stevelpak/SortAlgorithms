import 'algorithm.dart';
import 'utils.dart';

void main(List<String> args) {}

class PigeonHole {
  void sort(List<int> array) {
    int maxElement = array[0];

    for (var element in array) {
      if (element > maxElement) {
        maxElement = element;
      }
    }

    int numOFPigeonholes = 1 + maxElement;
    List<int> pigeonHole = List.filled(numOFPigeonholes, 0);

    for (var element in array) {
      // pigeonHole[t] = t;
    }
  }
}

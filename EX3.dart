class CustomDuration {
  final int _milliseconds;

  CustomDuration(this._milliseconds) {
    if (_milliseconds < 0) {
      throw ArgumentError('Duration cannot be negative');
    }
  }

  // Named constructors
  CustomDuration.fromHours(int hours) : this(hours * 60 * 60 * 1000);
  CustomDuration.fromMinutes(int minutes) : this(minutes * 60 * 1000);
  CustomDuration.fromSeconds(int seconds) : this(seconds * 1000);

  bool operator >(CustomDuration other) => _milliseconds > other._milliseconds;

  CustomDuration operator +(CustomDuration other) =>
      CustomDuration(_milliseconds + other._milliseconds);

  CustomDuration operator -(CustomDuration other) {
    final result = _milliseconds - other._milliseconds;
    if (result < 0) 
      throw ArgumentError('Resulting duration cannot be negative');
    return CustomDuration(result);
  }


  int get inMilliseconds => _milliseconds;
  double get inSeconds => _milliseconds / 1000;
  double get inMinutes => _milliseconds / (1000 * 60);
  double get inHours => _milliseconds / (1000 * 60 * 60);


  @override
  String toString() => 'CustomDuration(${_milliseconds} ms)';
}

void main() {
  final time1 = CustomDuration.fromSeconds(2);
  var time4 = CustomDuration.fromSeconds(3);
  final time2 = CustomDuration.fromMinutes(1);

  print('time1: $time1');
  print('time2: $time4');

  print('Comparison (>): ${time1 > time4}');
  print('Addition (+): ${time1 + time2}');
  print('Subtraction (-): ${time2 - time1}');
}

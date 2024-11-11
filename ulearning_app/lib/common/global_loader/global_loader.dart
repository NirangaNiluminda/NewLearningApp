import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_loader.g.dart'; // Ensure this line has no extra characters or spaces

@riverpod
class AppLoader extends _$AppLoader {
  @override
  bool build() {
    return false; // Example return value, adjust as necessary
  }

  void setLoaderValue(bool value) {
    state = value;
  }
}

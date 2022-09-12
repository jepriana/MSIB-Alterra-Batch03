void checkType<T>(T data) {
  print(data.runtimeType);
}

void main(List<String> args) {
  checkType<String>('Test');
  checkType<int>(5);
  checkType<bool>(true);
  checkType<double>(5.6);
}

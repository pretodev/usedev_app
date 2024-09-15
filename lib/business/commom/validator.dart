class Validator<T> {
  final bool Function(T value) fn;

  const Validator(this.fn);

  bool call(T value) => fn(value);

  Validator<T> and(Validator<T> other) {
    return Validator((value) => fn(value) && other(value));
  }
}

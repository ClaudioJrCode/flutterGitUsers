enum ResultStatus { success, error }

class Result<E, T> {
  final E? error;
  final T? value;
  final ResultStatus status;

  const Result.success(this.value)
      : status = ResultStatus.success,
        error = null;
  const Result.failure(this.error)
      : status = ResultStatus.error,
        value = null;

  bool get isSuccess => status == ResultStatus.success;

  bool get isError => status == ResultStatus.error;

  Result.internal(this.status, this.error, this.value);
}

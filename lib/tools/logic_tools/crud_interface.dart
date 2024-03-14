//TODO: Rethink this interface
abstract interface class CRUDInterface<T> {
  String get _controllerName => throw UnimplementedError();
  Future<List<T>> getAll();
  Future<T?> getById(int id);
  Future<T> insert(T object);
  Future<T> update(T object);
}

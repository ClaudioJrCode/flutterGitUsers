import 'package:get_it/get_it.dart';

abstract class BaseInjector {
  T getDependency<T extends Object>();
  Future<void> registerDependency<T extends Object>(T dependency);
}

class Injector implements BaseInjector {
  final _getIt = GetIt.instance;

  @override
  T getDependency<T extends Object>() {
    return _getIt.get<T>();
  }

  @override
  Future<void> registerDependency<T extends Object>(T dependency) async {
    _getIt.registerSingleton<T>(dependency);
  }
}

final I = Injector();

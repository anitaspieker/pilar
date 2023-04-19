import 'package:pilar/app/dependency_injection/home_injector.dart';

class Injector {
  call() {
    HomeInjector()();
  }
}
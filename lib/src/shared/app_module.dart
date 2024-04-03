import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/configuration/configuration_page.dart';
import 'package:listinha/src/home/home_module.dart';
import 'package:listinha/src/shared/store/app_store.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(AppStore.new);
  }

  @override
  void routes(r) {
    r
      ..child(
        '/config',
        child: (context) => const ConfigurationPage(),
        transition: TransitionType.fadeIn,
      )
      ..module(
        '/home',
        module: HomeModule(),
        transition: TransitionType.fadeIn,
      );
  }
}

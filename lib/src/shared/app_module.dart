import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/modules/configuration/configuration_page.dart';
import 'package:listinha/src/modules/configuration/services/configuration_service.dart';
import 'package:listinha/src/modules/home/home_module.dart';
import 'package:listinha/src/shared/store/app_store.dart';
import 'package:realm/realm.dart';

import 'services/realm/realm_config.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i
      ..addSingleton(AppStore.new)
      ..add<ConfigurationService>(ConfigurationServiceImpl.new)
      ..addInstance<Realm>(Realm(config));
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

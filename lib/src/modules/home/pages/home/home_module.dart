import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/modules/home/pages/edit/edit_page.dart';
import 'package:listinha/src/modules/home/pages/home/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r
      ..child(
        '/',
        child: (context) => const HomePage(),
        transition: TransitionType.fadeIn,
      )
      ..child(
        '/edit',
        child: (context) => const EditPage(),
        transition: TransitionType.fadeIn,
      );
  }
}

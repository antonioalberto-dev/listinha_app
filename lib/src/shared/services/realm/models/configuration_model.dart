import 'package:realm/realm.dart';

part 'configuration_model.realm.dart';

@RealmModel()
class _ConfigurationModel {
  late String themeModeName;
  late DateTime? syncDate;
}

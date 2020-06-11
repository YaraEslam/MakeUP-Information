import 'package:make_up/network/ItemRepository.dart';
import 'package:make_up/network/ProdItemRepository.dart';

enum Flavor { MOCK, PROD }

//DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ItemRepository get itemRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return new ProdItemRepository();
      default:
        return new ProdItemRepository();
    }
  }
}

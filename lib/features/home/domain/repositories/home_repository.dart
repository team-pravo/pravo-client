import 'package:pravo_client/features/home/domain/entities/home.dart';

abstract class HomeRepository {
  Future<Home> getHome();
}

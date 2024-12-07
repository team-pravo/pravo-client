import 'package:pravo_client/features/home/domain/entities/home.dart';
import 'package:pravo_client/features/home/domain/repositories/home_repository.dart';

class GetHomeUseCase {
  final HomeRepository repository;

  GetHomeUseCase(this.repository);

  Future<Home> execute() async {
    return await repository.getHome();
  }
}

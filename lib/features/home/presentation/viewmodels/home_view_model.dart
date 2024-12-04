import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pravo_client/features/home/data/repositories/home_repository_impl.dart';
import 'package:pravo_client/features/home/domain/entities/home.dart';
import 'package:pravo_client/features/home/domain/usecases/get_home_usecase.dart';

class HomeViewModel extends StateNotifier<AsyncValue<Home>> {
  final GetHomeUseCase getHomeUseCase;

  HomeViewModel(this.getHomeUseCase) : super(const AsyncValue.loading());

  Future<void> getHome() async {
    state = const AsyncValue.loading();
    try {
      final data = await getHomeUseCase.execute();
      state = AsyncValue.data(data);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, AsyncValue<Home>>((ref) {
  return HomeViewModel(GetHomeUseCase(ref.read(homeRepositoryProvider)));
});

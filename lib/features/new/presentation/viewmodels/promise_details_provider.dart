import 'package:flutter_riverpod/flutter_riverpod.dart';

final promiseDetailsProvider =
    StateNotifierProvider.autoDispose<PromiseDetailsNotifier, PromiseDetails>(
  (ref) => PromiseDetailsNotifier(ref),
);

class PromiseDetails {
  final String name;
  final String location;
  final int deposit;

  PromiseDetails({
    required this.name,
    required this.location,
    required this.deposit,
  });

  PromiseDetails copyWith({
    String? name,
    String? location,
    int? deposit,
  }) {
    return PromiseDetails(
      name: name ?? this.name,
      location: location ?? this.location,
      deposit: deposit ?? this.deposit,
    );
  }
}

class PromiseDetailsNotifier extends StateNotifier<PromiseDetails> {
  PromiseDetailsNotifier(Ref ref)
      : super(
          PromiseDetails(
            name: '',
            location: '',
            deposit: 0,
          ),
        );

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateLocation(String location) {
    state = state.copyWith(location: location);
  }

  void updateDeposit(int deposit) {
    state = state.copyWith(deposit: deposit);
  }
}

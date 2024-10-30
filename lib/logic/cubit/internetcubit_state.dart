part of 'internetcubit_cubit.dart';

@immutable
sealed class InternetcubitState {}

final class InternetLoading extends InternetcubitState {}

final class InternetConnected extends InternetcubitState {
  final ConnectionType connectionType;
  InternetConnected({required this.connectionType});
}

final class InternetDisconnected extends InternetcubitState {}

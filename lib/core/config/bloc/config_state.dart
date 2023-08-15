// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'config_bloc.dart';

class ConfigState extends Equatable {
  const ConfigState({required this.local});
  final String local;

  @override
  List<Object> get props => [local];

  ConfigState copyWith({
    String? local,
  }) {
    return ConfigState(
      local: local ?? this.local,
    );
  }
}

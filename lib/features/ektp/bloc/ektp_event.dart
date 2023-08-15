part of 'ektp_bloc.dart';

abstract class EktpEvent extends Equatable {
  const EktpEvent();

  @override
  List<Object?> get props => <Object>[];
}

class DataGetRequestedEktpEvent extends EktpEvent {
  const DataGetRequestedEktpEvent();

  @override
  List<Object> get props => <Object>[];
}

class DataRequestedEktpEvent extends EktpEvent {
  final FormData formData;
  final String? id;
  const DataRequestedEktpEvent({required this.formData, this.id});

  @override
  List<Object> get props => <Object>[formData];
}

class DataDetailRequestedEktpEvent extends EktpEvent {
  final String id;
  const DataDetailRequestedEktpEvent({required this.id});

  @override
  List<Object> get props => <Object>[id];
}

class DataDeleteRequestedEktpEvent extends EktpEvent {
  final String id;
  const DataDeleteRequestedEktpEvent({required this.id});

  @override
  List<Object> get props => <Object>[id];
}

class DownloadImageKtp extends EktpEvent {
  final String? imageUrl;
  const DownloadImageKtp({required this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];
}

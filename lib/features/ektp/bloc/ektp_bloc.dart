import 'dart:async';
import 'dart:developer';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:gallery_saver/gallery_saver.dart';

part 'ektp_event.dart';
part 'ektp_state.dart';

class EktpBloc extends Bloc<EktpEvent, EktpState> {
  final Repository _repository;

  EktpBloc(this._repository) : super(EktpState()) {
    on<DataGetRequestedEktpEvent>(_onGetRequestedListEktp);
    on<DataDetailRequestedEktpEvent>(_onViewRequestedEktp);
    on<DataRequestedEktpEvent>(_onCreateRequestedEktp);
    on<DownloadImageKtp>(_onSaveImageToGalerry);
    on<DataDeleteRequestedEktpEvent>(_onDeleteRequestedEktp);
  }

  FutureOr<void> _onSaveImageToGalerry(DownloadImageKtp event, Emitter<EktpState> emit) async {
    emit(state.copyWith(isLoading: true, responseSaveKtp: false));
    try {
      final result = await GallerySaver.saveImage(event.imageUrl ?? "");
      if (result ?? false) {
        emit(state.copyWith(isLoading: false, responseSaveKtp: result));
      } else {
        emit(state.copyWith(isLoading: false, responseSaveKtp: false, errorMessage: "Error Save Image To Galery"));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, responseSaveKtp: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onGetRequestedListEktp(DataGetRequestedEktpEvent event, Emitter<EktpState> emit) async {
    try {
      // emit(const EktpState.noValue());
      // final data = await _repository.doGetRequestEktpList();
      // emit(state.copyWith(isLoading: false, ektpListResponse: data));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onCreateRequestedEktp(DataRequestedEktpEvent event, Emitter<EktpState> emit) async {
    late BaseResponse<PengajuanEktpResponse> data;
    try {
      // event.id == null ? emit(const EktpState.noValue()) : emit(state.copyWith(isLoading: true, pengajuanEktpResponse: null, errorMessage: ''));
      // if (event.id == null) {
      //   data = await _repository.doRequestEktp(dataEktpRequest: event.formData);
      // } else {
      //   data = await _repository.doEditRequestEktp(dataEktpRequest: event.formData, id: event.id ?? "");
      // }
      // if (data.response != null) {
      //   emit(state.copyWith(isLoading: false, pengajuanEktpResponse: data));
      // } else {
      //   emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      // }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onViewRequestedEktp(DataDetailRequestedEktpEvent event, Emitter<EktpState> emit) async {
    try {
      // emit(state.copyWith(isLoading: true, ektpDetailResponse: BaseResponse<EktpDetailResponse?>(), responseSaveKtp: false, errorMessage: ''));
      // final data = await _repository.doGetDetailRequestEktp(id: event.id);
      // if (data.response != null) {
      //   emit(state.copyWith(isLoading: false, ektpDetailResponse: data));
      // } else {
      //   emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      // }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onDeleteRequestedEktp(DataDeleteRequestedEktpEvent event, Emitter<EktpState> emit) async {
    try {
      // emit(state.copyWith(isLoading: true, responseSaveKtp: false));
      // final data = await _repository.doDeleteRequestEktp(id: event.id);
      // log("delete data $data");
      // emit(state.copyWith(
      //   isLoading: false,
      //   errorMessage: data.errorMessage,
      //   statusCode: data.statusCode,
      // ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}

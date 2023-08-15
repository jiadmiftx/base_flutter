part of 'ektp_bloc.dart';

class EktpState extends Equatable {
  final BaseResponse<EktpListResponse?>? ektpListResponse;
  final BaseResponse<PengajuanEktpResponse?>? pengajuanEktpResponse;
  final BaseResponse<EktpDetailResponse?>? ektpDetailResponse;
  final bool isLoading;
  final String errorMessage;
  final int statusCode;
  final bool responseSaveKtp;

  const EktpState({
    this.ektpListResponse,
    this.pengajuanEktpResponse,
    this.ektpDetailResponse,
    this.isLoading = false,
    this.errorMessage = '',
    this.statusCode = 0,
    this.responseSaveKtp = false,
  });

  const EktpState.noValue()
      : isLoading = true,
        errorMessage = '',
        ektpDetailResponse = null,
        pengajuanEktpResponse = null,
        ektpListResponse = null,
        statusCode = 0,
        responseSaveKtp = false;

  EktpState copyWith({
    BaseResponse<EktpListResponse>? ektpListResponse,
    BaseResponse<PengajuanEktpResponse>? pengajuanEktpResponse,
    BaseResponse<EktpDetailResponse?>? ektpDetailResponse,
    bool? isLoading,
    String? errorMessage,
    int? statusCode,
    bool? responseSaveKtp,
  }) {
    return EktpState(
      ektpListResponse: ektpListResponse ?? this.ektpListResponse,
      pengajuanEktpResponse: pengajuanEktpResponse ?? this.pengajuanEktpResponse,
      ektpDetailResponse: ektpDetailResponse ?? this.ektpDetailResponse,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      statusCode: statusCode ?? this.statusCode,
      responseSaveKtp: responseSaveKtp ?? this.responseSaveKtp,
    );
  }

  @override
  List<Object?> get props => <Object>[isLoading, ektpListResponse ?? BaseResponse<EktpListResponse?>(), ektpDetailResponse ?? BaseResponse<EktpDetailResponse?>(), errorMessage, responseSaveKtp];

  @override
  String toString() {
    return 'EktpState: {'
        'ektpListResponse: $ektpListResponse'
        'isLoading: $isLoading'
        'ektpDetailResponse: $ektpDetailResponse'
        'errorMessage: $errorMessage'
        'statusCode: $statusCode'
        'responseSaveKtp: $responseSaveKtp'
        '}';
  }
}

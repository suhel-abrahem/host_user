import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hosta_user/core/constants/api_constant.dart';
import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/resource/common_service/common_service.dart';
import 'package:hosta_user/core/resource/connectivity/check_connectivity.dart';

import 'package:hosta_user/features/profile_page/data/models/reset_password/request_reset_password_model.dart';

import 'package:hosta_user/features/profile_page/data/models/reset_password/reset_password_model.dart';

import 'package:hosta_user/features/profile_page/data/models/reset_password/verify_otp_model.dart';

import 'package:hosta_user/features/profile_page/domain/entities/reset_password/request_reset_password_entity.dart';

import 'package:hosta_user/features/profile_page/domain/entities/reset_password/verify_otp_entity.dart';

import '../../../domain/repositories/reset_password/reset_password_repository.dart';

class ResetPasswordRepositoryImplements implements ResetPasswordRepository {
  final CheckConnectivity _checkConnectivity;
  ResetPasswordRepositoryImplements(this._checkConnectivity);
  @override
  Future<DataState<RequestResetPasswordEntity?>?> requestResetPassword({
    RequestResetPasswordModel? requestResetPasswordModel,
  }) async {
    ConnectivityResult? connectivityResult = ConnectivityResult.none;
    DataState<RequestResetPasswordEntity>? dataState;
    await _checkConnectivity.checkConnectivity().then(
      (value) => connectivityResult = value.last,
    );
    if (connectivityResult == ConnectivityResult.none) {
      dataState = NOInternetDataState();
      return dataState;
    }
    try {
      CommonService commonService = CommonService(
        headers: {
          'Content-Type': 'application/json',
          "Accepted_Language":
              requestResetPasswordModel?.acceptLanguage ?? "ar",
        },
      );
      await commonService
          .post(
            ApiConstant.requestResetPasswordEndpoint,
            data: {
              "identifier": requestResetPasswordModel?.identifier,
              "reset_via": requestResetPasswordModel?.restVia,
            },
          )
          .then((onValue) {
            if (onValue is DataSuccess) {
              dataState = DataSuccess(
                data: RequestResetPasswordEntity.fromJson(onValue.data?.data),
              );
            } else if (onValue is DataError) {
              dataState = DataError(error: onValue.data?.data?["errors"]);
            } else if (onValue is UnauthenticatedDataState) {
              dataState = UnauthenticatedDataState(error: onValue.error);
            } else {
              dataState = DataFailed(error: onValue.toString());
            }
          });
      return dataState;
    } catch (e) {
      dataState = DataFailed(error: e.toString());
      return dataState;
    }
  }

  @override
  Future<DataState<void>?> resetPassword({
    ResetPasswordModel? resetPasswordModel,
  }) async {
    DataState<void>? dataState;
    ConnectivityResult? connectivityResult = ConnectivityResult.none;
    await _checkConnectivity.checkConnectivity().then(
      (value) => connectivityResult = value.last,
    );
    if (connectivityResult == ConnectivityResult.none) {
      dataState = NOInternetDataState();
      return dataState;
    }
    try {
      CommonService commonService = CommonService(
        headers: {
          'Content-Type': 'application/json',
          "Accepted_Language": resetPasswordModel?.acceptLanguage ?? "ar",
        },
      );
      await commonService
          .post(
            ApiConstant.resetPasswordEndpoint,
            data: {
              "reset_token": resetPasswordModel?.resetToken,
              "password": resetPasswordModel?.password,
              "password_confirmation": resetPasswordModel?.confirmPassword,
            },
          )
          .then((onValue) {
            if (onValue is DataSuccess) {
              dataState = DataSuccess(data: null);
            } else if (onValue is DataError) {
              dataState = DataError(error: onValue.data?.data?["errors"]);
            } else if (onValue is UnauthenticatedDataState) {
              dataState = UnauthenticatedDataState(error: onValue.error);
            } else {
              dataState = DataFailed(error: onValue.toString());
            }
          });
      return dataState;
    } catch (e) {
      dataState = DataFailed(error: e.toString());
      return dataState;
    }
  }

  @override
  Future<DataState<VerifyOtpEntity?>?> verifyOtp({
    VerifyOtpModel? verifyOtpModel,
  }) async {
    DataState<VerifyOtpEntity>? dataState;
    ConnectivityResult? connectivityResult = ConnectivityResult.none;
    await _checkConnectivity.checkConnectivity().then(
      (value) => connectivityResult = value.last,
    );
    if (connectivityResult == ConnectivityResult.none) {
      dataState = NOInternetDataState();
      return dataState;
    }
    try {
      CommonService commonService = CommonService(
        headers: {
          'Content-Type': 'application/json',
          "Accepted_Language": verifyOtpModel?.acceptLanguage ?? "ar",
        },
      );
      await commonService
          .post(
            ApiConstant.verifyOtpResetPasswordEndpoint,
            data: {
              "user_id": verifyOtpModel?.user_id,
              "otp": verifyOtpModel?.otp,
            },
          )
          .then((onValue) {
            if (onValue is DataSuccess) {
              dataState = DataSuccess(
                data: VerifyOtpEntity.fromJson(onValue.data?.data),
              );
            } else if (onValue is DataError) {
              dataState = DataError(error: onValue.data?.data?["errors"]);
            } else if (onValue is UnauthenticatedDataState) {
              dataState = UnauthenticatedDataState(error: onValue.error);
            } else {
              dataState = DataFailed(error: onValue.toString());
            }
          });
      return dataState;
    } catch (e) {
      dataState = DataFailed(error: e.toString());
      return dataState;
    }
  }
}

import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/usecase/usecase.dart';
import 'package:hosta_user/features/profile_page/data/models/reset_password/request_reset_password_model.dart';
import 'package:hosta_user/features/profile_page/domain/entities/reset_password/request_reset_password_entity.dart';
import 'package:hosta_user/features/profile_page/domain/repositories/reset_password/reset_password_repository.dart';

class RequestResetPasswordUsecase
    implements
        UseCase<
          DataState<RequestResetPasswordEntity?>?,
          RequestResetPasswordModel
        > {
  final ResetPasswordRepository _resetPasswordRepository;

  RequestResetPasswordUsecase({
    required ResetPasswordRepository resetPasswordRepository,
  }) : _resetPasswordRepository = resetPasswordRepository;
  @override
  Future<DataState<RequestResetPasswordEntity?>?> call({
    RequestResetPasswordModel? params,
  }) async {
    return await _resetPasswordRepository.requestResetPassword(
      requestResetPasswordModel: params,
    );
  }
}

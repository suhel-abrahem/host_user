import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/usecase/usecase.dart';

import '../../data/model/rate_model.dart';
import '../entity/rate_entity.dart';
import '../repository/rate_repository.dart';

class SentRateUsecase implements UseCase<DataState<RateEntity?>?, RateModel?> {
  final RateRepository _rateRepository;
  SentRateUsecase(this._rateRepository);
  @override
  Future<DataState<RateEntity?>?> call({RateModel? params}) async {
    return await _rateRepository.sendRate(rateModel: params);
  }
}

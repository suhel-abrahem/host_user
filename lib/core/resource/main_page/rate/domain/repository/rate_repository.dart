import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/resource/main_page/rate/data/model/rate_model.dart';
import 'package:hosta_user/core/resource/main_page/rate/domain/entity/rate_entity.dart';

abstract class RateRepository {
  Future<DataState<RateEntity?>?> sendRate({required RateModel? rateModel});
}

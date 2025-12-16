import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/usecase/usecase.dart';
import 'package:hosta_user/features/service_details/domain/repositories/time_slots_repository.dart';

import '../../data/models/time_slots_model.dart';
import '../entities/time_slots_entity.dart';

class TimeSlotsUsecase
    implements UseCase<DataState<List<TimeSlotsEntity?>?>?, TimeSlotsModel?> {
  final TimeSlotsRepository? _timeSlotsRepository;
  TimeSlotsUsecase(this._timeSlotsRepository);
  @override
  Future<DataState<List<TimeSlotsEntity?>?>?> call({
    TimeSlotsModel? params,
  }) async {
    return await _timeSlotsRepository?.getTimeSlots(timeSlotsModel: params);
  }
}

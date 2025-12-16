import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/features/service_details/data/models/time_slots_model.dart';

import '../entities/time_slots_entity.dart';

abstract class TimeSlotsRepository {
  Future<DataState<List<TimeSlotsEntity?>?>?> getTimeSlots({
    TimeSlotsModel? timeSlotsModel,
  });
}

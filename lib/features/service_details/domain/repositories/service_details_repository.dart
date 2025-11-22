import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/features/service_details/data/models/service_details_model.dart';

import '../entities/service_details_entity.dart';

abstract class ServiceDetailsRepository {
  Future<DataState<List<ServiceDetailsEntity?>?>?> getServiceDetails({
    required ServiceDetailsModel? serviceDetailsModel,
  });
}

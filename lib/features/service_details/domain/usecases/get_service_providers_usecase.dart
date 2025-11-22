import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/usecase/usecase.dart';
import 'package:hosta_user/features/service_details/domain/entities/service_details_entity.dart';
import 'package:hosta_user/features/service_details/domain/repositories/service_details_repository.dart';

import '../../data/models/service_details_model.dart';

class GetServiceProvidersUseCase
    implements
        UseCase<
          DataState<List<ServiceDetailsEntity?>?>?,
          ServiceDetailsModel?
        > {
  final ServiceDetailsRepository _serviceDetailsRepository;
  GetServiceProvidersUseCase(this._serviceDetailsRepository);
  @override
  Future<DataState<List<ServiceDetailsEntity?>?>?> call({
    ServiceDetailsModel? params,
  }) async {
    return await _serviceDetailsRepository.getServiceDetails(
      serviceDetailsModel: params,
    );
  }
}

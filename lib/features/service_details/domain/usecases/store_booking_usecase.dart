import 'package:hosta_user/core/usecase/usecase.dart';

import '../../../../core/data_state/data_state.dart';
import '../../data/models/store_booking_model.dart';
import '../repositories/store_booking_repository.dart';

class StoreBookingUseCase
    implements UseCase<DataState<void>?, StoreBookingModel> {
  final StoreBookingRepository? _repository;

  StoreBookingUseCase(this._repository);
  @override
  Future<DataState<void>?> call({StoreBookingModel? params}) async {
    return _repository!.storeBooking(storeBookingModel: params);
  }
}

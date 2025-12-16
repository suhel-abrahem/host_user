import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/features/service_details/data/models/store_booking_model.dart';

abstract class StoreBookingRepository {
  Future<DataState<void>?> storeBooking({
    required StoreBookingModel? storeBookingModel,
  });
}

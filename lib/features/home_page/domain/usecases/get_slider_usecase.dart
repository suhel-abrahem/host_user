import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/usecase/usecase.dart';
import 'package:hosta_user/features/home_page/data/models/home_page_model.dart';

import '../entities/slider_entity.dart';
import '../repositories/home_page_repository.dart';

class GetSliderUsecase
    implements UseCase<DataState<List<SliderEntity?>?>?, HomePageModel> {
  final HomePageRepository _homePageRepository;
  GetSliderUsecase(this._homePageRepository);
  @override
  Future<DataState<List<SliderEntity?>?>?> call({HomePageModel? params}) async {
    return await _homePageRepository.getSliders(params);
  }
}

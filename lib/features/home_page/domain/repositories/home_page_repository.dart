import 'package:hosta_user/features/home_page/domain/entities/slider_entity.dart';

import '../../../../core/data_state/data_state.dart';

import '../../data/models/home_page_model.dart';
import '../entities/home_page_entity.dart';

abstract class HomePageRepository {
  Future<DataState<HomePageEntity?>?> getHomePageData(HomePageModel? model);
  Future<DataState<List<SliderEntity?>?>?> getSliders(HomePageModel? model);
}

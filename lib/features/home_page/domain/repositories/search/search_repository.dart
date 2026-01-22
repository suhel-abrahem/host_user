import 'package:hosta_user/core/data_state/data_state.dart';

import '../../../data/models/search/search_model.dart';
import '../../entities/search/search_entity.dart';

abstract class SearchRepository {
  Future<DataState<List<SearchEntity?>?>?> searchItems(SearchModel? model);
}

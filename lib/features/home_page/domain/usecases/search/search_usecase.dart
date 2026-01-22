import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/usecase/usecase.dart';

import '../../entities/search/search_entity.dart';
import '../../../data/models/search/search_model.dart';
import '../../repositories/search/search_repository.dart';

class SearchUsecase
    implements UseCase<DataState<List<SearchEntity?>?>?, SearchModel?> {
  final SearchRepository _repository;

  SearchUsecase({required SearchRepository repository})
    : _repository = repository;
  @override
  Future<DataState<List<SearchEntity?>?>?> call({SearchModel? params}) async {
    return await _repository.searchItems(params);
  }
}

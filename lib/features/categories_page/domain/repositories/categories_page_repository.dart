import '../../../../core/data_state/data_state.dart';
import '../../data/models/get_category_model.dart';
import '../entities/category_entity.dart';

abstract class CategoriesPageRepository {
  Future<DataState<List<CategoryEntity?>?>?> getCategories(
    GetCategoryModel? getServiceModel,
  );
}

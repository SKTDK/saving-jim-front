import 'package:pfefront/model/Category.dart';

class CategoriesRepository {
  static final CategoriesRepository _instance = CategoriesRepository._internal();

  factory CategoriesRepository(){
    return _instance;
  }

  CategoriesRepository._internal();

  List<Category> getCategories(){
    return [
      const Category(id:'1', name:'deplacement',description:'desc',image:'assets/images/habitudes/categories/deplacement.jpg'),
      const Category(id:'2', name:'habitation',description:'desc',image:'assets/images/habitudes/categories/habitation.jpg'),
      const Category(id:'3', name:'loisirs',description:'desc',image:'assets/images/habitudes/categories/loisirs.jpg'),
      const Category(id:'4', name:'nutrition',description:'desc',image:'assets/images/habitudes/categories/nutrition.jpg'),
      const Category(id:'5', name:'relations, communication',description:'desc',image:'assets/images/habitudes/categories/relationscom.jpg'),
      const Category(id:'6', name:'responsabilités',description:'desc',image:'assets/images/habitudes/categories/responsabilites.jpg'),
      const Category(id:'7', name:'soins personnels',description:'desc',image:'assets/images/habitudes/categories/soinspersonnels.jpg')
      ];
  }


}
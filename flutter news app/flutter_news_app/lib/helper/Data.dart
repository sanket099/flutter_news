import 'package:flutter_news_app/models/CategoryModel.dart';
List<CategoryModel> getCategories(){
  List<CategoryModel> categories = new List<CategoryModel>();

  CategoryModel categorieModel;

  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Business";
  categorieModel.imagUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  categories.add(categorieModel);

  //2
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Entertainment";
  categorieModel.imagUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categories.add(categorieModel);

  //3
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "General";
  categorieModel.imagUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  categories.add(categorieModel);

  //4
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Health";
  categorieModel.imagUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  categories.add(categorieModel);

  //5
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Science";
  categorieModel.imagUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  categories.add(categorieModel);

  //5
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Sports";
  categorieModel.imagUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  categories.add(categorieModel);

  //5
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Technology";
  categorieModel.imagUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categories.add(categorieModel);

  return categories;
}
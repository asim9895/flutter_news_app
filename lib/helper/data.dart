import '../models/category.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();

  CategoryModel categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
      "https://discuss.fm/images/max_topic_images/entertainment.jpg";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
      "https://www.allbusiness.com/asset/2019/01/business-growth-concept.jpg";
  category.add(categoryModel);
 
 categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
      "https://blog.ventureradar.com/wp-content/uploads/2015/09/healthmachine2.png";
  category.add(categoryModel);

categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl =
      "https://i2.wp.com/hrreview.co.uk/wp-content/uploads/politics.jpg";
  category.add(categoryModel);

categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl =
      "https://www.techprevue.com/wp-content/uploads/2018/01/technology-job-opportunities.jpg";
  category.add(categoryModel);

  return category;
}

class CategoryCommonModel{
  late String name;
  late String image;
  late String location;
  late double rate;
  late double ratingNum;
  late String reviewsNum;

  CategoryCommonModel({
    required this.image,
    required this.name,
    required this.rate,
    required this.ratingNum,
    required this.location,
    required this.reviewsNum,
});
}
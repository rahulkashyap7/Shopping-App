import '../../../features/shop/models/banner_model.dart';
import '../../../features/shop/models/category_model.dart';
import '../../../utils/constants/image_strings.dart';

class RDummyData{
  // Banner
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: RImages.promoBanner1, targetScreen: RRoutes.order, active: false),
    BannerModel(imageUrl: RImages.promoBanner2, targetScreen: RRoutes.cart, active: true),
    BannerModel(imageUrl: RImages.promoBanner3, targetScreen: RRoutes.favorites, active: true),
    BannerModel(imageUrl: RImages.promoBanner1, targetScreen: RRoutes.search, active: true),
    BannerModel(imageUrl: RImages.promoBanner2, targetScreen: RRoutes.settings, active: true),
    BannerModel(imageUrl: RImages.promoBanner3, targetScreen: RRoutes.userAddress, active: true),
    BannerModel(imageUrl: RImages.promoBanner1, targetScreen: RRoutes.checkOut, active: true),
    BannerModel(imageUrl: RImages.promoBanner2, targetScreen: RRoutes.order, active: false),
  ];


  // -- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: RImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '5', image: RImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '2', image: RImages.electronicIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '3', image: RImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '4', image: RImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '6', image: RImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: RImages.cosmeticIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '14', image: RImages.jewelleryIcon, name: 'Jewelry', isFeatured: true),

    // Subcategories
    CategoryModel(id: '8', image: RImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: RImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: RImages.sportIcon, name: 'Sports Equipments', parentId: '1', isFeatured: false),
    // Furniture
    CategoryModel(id: '11', image: RImages.furnitureIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '12', image: RImages.furnitureIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '13', image: RImages.furnitureIcon, name: 'Office furniture', parentId: '5', isFeatured: false),
    // Electronics
    CategoryModel(id: '14', image: RImages.electronicIcon, name: 'Laptop', parentId: '2', isFeatured: false),
    CategoryModel(id: '15', image: RImages.electronicIcon, name: 'Mobile', parentId: '2', isFeatured: false),
  ];


}
import 'package:shopping_app/features/shop/models/product_model.dart';

import '../../../features/shop/models/banner_model.dart';
import '../../../features/shop/models/brand_model.dart';
import '../../../features/shop/models/category_model.dart';
import '../../../features/shop/models/product_attribute_model.dart';
import '../../../features/shop/models/product_variation_model.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants/image_strings.dart';

class RDummyData{
  // Banner
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: RImages.promoBanner1, targetScreen: RRoutes.order, active: false),
    BannerModel(imageUrl: RImages.promoBanner2, targetScreen: RRoutes.cart, active: true),
    // BannerModel(imageUrl: RImages.promoBanner3, targetScreen: RRoutes.favorites, active: true),
    BannerModel(imageUrl: RImages.promoBanner1, targetScreen: RRoutes.search, active: true),
    BannerModel(imageUrl: RImages.promoBanner2, targetScreen: RRoutes.settings, active: true),
    BannerModel(imageUrl: RImages.promoBanner3, targetScreen: RRoutes.userAddress, active: true),
    // BannerModel(imageUrl: RImages.promoBanner1, targetScreen: RRoutes.checkOut, active: true),
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

  /// -- List of all products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: RImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(id: '1', image: RImages.nike, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [RImages.productImage1, RImages.productImage1, RImages.productImage2, RImages.productImage3],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
        productVariations: [
          ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: RImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: RImages.productImage2,
            attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
          ),

          ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: RImages.productImage3,
            attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
          ),
          ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: RImages.productImage1,
            attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
          ),

          ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: RImages.productImage2,
            attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
          ),

          ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: RImages.productImage4,
            attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
          ),
        ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 35,
      isFeatured: true,
      thumbnail: RImages.productImage1,
      description:
      'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: RImages.zara, name: 'ZARA'),
      images: [RImages.productImage2, RImages.productImage3, RImages.productImage4],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '003',
      title: 'Leather brown Jacket',
      stock: 15,
      price: 38000,
      isFeatured: false,
      thumbnail: RImages.productImage1,
      description:
      'This is a Product description for Leather brown Jacket. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: RImages.zara, name: 'ZARA'),
      images: [RImages.productImage2, RImages.productImage3, RImages.productImage4, RImages.productImage1],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '004',
      title: '4 Color collar t-shirt dry fit',
      stock: 15,
      price: 135,
      isFeatured: false,
      thumbnail: RImages.productImage1,
      description:
      'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else.',
      brand: BrandModel(id: '6', image: RImages.zara, name: 'ZARA'),
      images: [RImages.productImage2, RImages.productImage3, RImages.productImage4, RImages.productImage1],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
        productVariations: [
          ProductVariationModel(
            id: '1', stock: 34, price: 134, salePrice: 122.6,
            image: RImages.productImage1,
            description: 'This is a Product description for 4 Color collar t-shirt dry fit',
            attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
          ),
          ProductVariationModel(
            id: '2', stock: 15, price: 132, image: RImages.productImage2,
            attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
          ),
          ProductVariationModel(
            id: '3', stock: 0, price: 234, image: RImages.productImage3,
            attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'},
          ),
          ProductVariationModel(
            id: '4', stock: 222, price: 232, image: RImages.productImage4,
            attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'},
          ),
          ProductVariationModel(
            id: '5', stock: 0, price: 334, image: RImages.productImage2,
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
          ),
          ProductVariationModel(
            id: '6', stock: 11, price: 332, image: RImages.productImage1,
            attributeValues: {'Color': 'Green', 'Size': 'EU 30'}, // ProductVariationModel
          ),
        ], productType: 'ProductType.variable',
    ),

    ProductModel(
      id: '006',
      title: 'SAMSUNG Galaxy S9 (Pink, 64 GB)  (4 GB RAM)',
      stock: 15,
      price: 750,
      isFeatured: false,
      thumbnail: RImages.productImage1,
      description: 'SAMSUNG Galaxy S9 (Pink, 64 GB)  (4 GB RAM), Long Battery timing',
      brand: BrandModel(id: '7', image: RImages.apple, name: 'Samsung'),
      images: [RImages.productImage2, RImages.productImage3, RImages.productImage4, RImages.productImage1],
      salePrice: 650,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
  ];


}
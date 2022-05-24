import 'package:challenge_delivery_app/app/data/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RestaurantController extends GetxController {
  ScrollController scrollController = ScrollController();

  List<Product> products = [
    Product(
      uuid: 'uuid1',
      name: 'Chicken Hawaiian',
      description: 'Chicken, Cheese and pineapple',
      imageUrl:
          'https://img.freepik.com/free-photo/tasty-hawaiian-pizza-with-chicken_135427-6866.jpg?w=2000',
      price: 10.35,
      quantity: 1,
      category: 'Pizza',
      subCategory: 'Additional',
      rating: 4.5,
      ratingCount: 25,
      isFavorite: false,
      isFeatured: true,
    ),
    Product(
      uuid: 'uuid2',
      name: 'Red n hot pizza',
      description: 'Spicy chicken, beef',
      imageUrl:
          'https://res.cloudinary.com/fleetnation/image/private/c_fit,w_1120/g_south,l_text:style_gothic2:©%20Stockimo,o_20,y_10/g_center,l_watermark4,o_25,y_50/v1482892614/hidm8uxzqjyrpxtpgoqk.jpg',
      price: 9.50,
      quantity: 1,
      category: 'Pizza',
      subCategory: 'Legends',
      rating: 4.5,
      ratingCount: 25,
      isFavorite: false,
      isFeatured: true,
    ),
    Product(
      uuid: 'uuid3',
      name: 'Veggie pizza',
      description: 'Veggie, mushroom, onion',
      imageUrl:
          'https://www.twopeasandtheirpod.com/wp-content/uploads/2021/03/Veggie-Pizza-8-500x375.jpg',
      price: 9.50,
      quantity: 1,
      category: 'Pizza',
      subCategory: 'Bundles',
      rating: 4.5,
      ratingCount: 25,
      isFavorite: false,
      isFeatured: true,
    ),
    Product(
      uuid: 'uuid4',
      name: 'Chicken pizza',
      description: 'Chicken, cheese, pineapple',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bbq-pizza-318-1547837614.jpg',
      price: 9.50,
      quantity: 1,
      category: 'Pizza',
      subCategory: 'Additional',
      rating: 4.5,
      ratingCount: 25,
      isFavorite: false,
      isFeatured: true,
    ),
    Product(
      uuid: 'uuid5',
      name: 'Pepperoni',
      description:
          'Sabor incomparable de pepperoni americano y queso mozzarella.',
      imageUrl:
          'https://static.phdvasia.com/pe/img/singles/pepperoni-desktop-thumbnail.jpg',
      price: 10.35,
      quantity: 1,
      category: 'Pizza',
      subCategory: 'Bundles',
      rating: 4.5,
      ratingCount: 25,
      isFavorite: false,
    ),
    Product(
      uuid: 'uuid6',
      name: 'Super Supreme',
      description:
          'Una perfecta mezcla de pepperoni americano, carne de res, carne de cerdo, Jamón, salchicha italiana, champiñones, pimientos verdes, cebolla roja, aceitunas verdes y queso mozzarella.',
      imageUrl:
          'https://static.phdvasia.com/pe/img/singles/super-suprema-desktop-thumbnail.jpg',
      price: 10.35,
      quantity: 1,
      category: 'Pizza',
      subCategory: 'Additional',
      rating: 4.5,
      ratingCount: 25,
      isFavorite: false,
    ),
    Product(
      uuid: 'uuid7',
      name: 'Meat Lovers',
      description:
          '¡Un festín de carnes! Pepperoni americano, salchicha italiana, carne de res, carne decerdo, rebanadas de Jamón y queso mozzarella.',
      imageUrl:
          'https://static.phdvasia.com/pe/img/singles/meat-lovers-desktop-thumbnail.jpg',
      price: 9.50,
      quantity: 1,
      category: 'Pizza',
      subCategory: 'Legends',
      rating: 4.5,
      ratingCount: 25,
      isFavorite: false,
    ),
    Product(
      uuid: 'uuid8',
      name: 'Continental',
      description:
          'Deliciosa mixtura de Jamón, champiñones, cebolla roja y queso mozzarella.',
      imageUrl:
          'https://static.phdvasia.com/pe/img/singles/continental-desktop-thumbnail.jpg',
      price: 9.50,
      quantity: 1,
      category: 'Pizza',
      subCategory: 'Bundles',
      rating: 4.5,
      ratingCount: 25,
      isFavorite: false,
    ),
    //AMERICANA
    Product(
      uuid: 'uuid9',
      name: 'Americana',
      description:
          'La Pizza preferida de los chicos! Jamón y queso mozzarella.',
      imageUrl:
          'https://static.phdvasia.com/pe/img/singles/americana-desktop-thumbnail.jpg',
      price: 9.50,
      quantity: 1,
      category: 'Pizza',
      subCategory: 'Additional',
      rating: 4.5,
      ratingCount: 25,
      isFavorite: false,
    ),
  ];
  List<Map<String, bool>> categories = [
    {'All': true},
    {'Legends': false},
    {'Bundles': false},
    {'Additional': false}
  ];
  List<Product> productsByCategory = [];

  bool shrink = false;

  bool hasBorders = true;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    productsByCategory = products;
  } 

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void setCategory(String key) {
    for (Map<String, bool> element in categories) {
      element.forEach((k, v) {
        element[k] = false;
        if (k == key) {
          element[k] = true;
        }
      });
    }

    if (key == 'All') {
      productsByCategory = products;
      update(<String>['categories', 'products']);
      productsByCategory.sort((a, b) => a.name.compareTo(b.name));
      return;
    }
    productsByCategory = products.where((product) {
      if (key == (product.subCategory)) {
        print(product.subCategory);
      }
      return product.subCategory == key;
    }).toList();
    productsByCategory.sort((a, b) => a.name.compareTo(b.name));
    update(<String>['categories', 'products']);
  }

  
}

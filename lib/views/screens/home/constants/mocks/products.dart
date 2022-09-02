part of 'mock.dart';

final kProducts = <Product<int, int>>[
  Product(
    id: 1,
    name: 'Space Gray Aluminum Case with Sport Band',
    categoryIds: <int>[1, 2],
    markedPriceInRupees: 2999,
    thumbnailImageUrl:
        'https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80',
    productImages: [
      'https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80',
    ],
  ),
  Product(
    id: 2,
    name: 'Harman Kardon Allure Bluetooth Speaker',
    categoryIds: <int>[2],
    markedPriceInRupees: 5999,
    discountedPriceInRupees: 4999,
    discountRate: 34,
    thumbnailImageUrl: 'https://m.media-amazon.com/images/I/81RtVcaLncL.jpg',
    productImages: [
      'https://m.media-amazon.com/images/I/81RtVcaLncL.jpg',
    ],
  ),
  Product(
    id: 3,
    name: 'Beats 3 Wireless Over‑Ear Headphones',
    categoryIds: <int>[2],
    markedPriceInRupees: 2999,
    thumbnailImageUrl:
        'https://fgl.scene7.com/is/image/FGLSportsLtd/FGL_333144371_01_e-Beats-Solo-3-Wireless-Headphones-MX432LL-A?bgColor=0,0,0,0&resMode=sharp2&op_sharpen=1&hei=520',
    productImages: [
      'https://fgl.scene7.com/is/image/FGLSportsLtd/FGL_333144371_01_e-Beats-Solo-3-Wireless-Headphones-MX432LL-A?bgColor=0,0,0,0&resMode=sharp2&op_sharpen=1&hei=520',
    ],
  ),
  Product(
    id: 4,
    name: 'Lenovo V15-IWL Intel Core i7 8565U 8GB 256GB',
    categoryIds: <int>[2],
    markedPriceInRupees: 8999,
    thumbnailImageUrl:
        'https://techlekh.com/wp-content/uploads/2021/10/Lenovo-IdeaPad-Gaming-3i.png',
    productImages: [
      'https://techlekh.com/wp-content/uploads/2021/10/Lenovo-IdeaPad-Gaming-3i.png',
    ],
  ),
];

class Banners {
  final int? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imagePath;
  final String? photo;
  final String? status;
  final String? position;
  final String? innerPosition;
  final String? condition;
  final String? createdAt;
  final String? updatedAt;

  Banners({
     this.id,
     this.title,
     this.slug,
     this.description,
     this.imagePath,
     this.photo,
     this.status,
     this.position,
     this.innerPosition,
     this.condition,
     this.createdAt,
     this.updatedAt,
  });

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      imagePath: json['image_path'],
      photo: json['photo'],
      status: json['status'],
      position: json['position'],
      innerPosition: json['inner_position'],
      condition: json['condition'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'slug': slug,
        'description': description,
        'image_path': imagePath,
        'photo': photo,
        'status': status,
        'position': position,
        'inner_position': innerPosition,
        'condition': condition,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}

class Categories {
  final int? id;
  final String? title;
  final String? slug;
  final String? photo;
  final String? imagePath;
  final bool? isParent;
  final bool? isFeatured;
  final String? summary;
  final int? parentId;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  Categories({
     this.id,
     this.title,
     this.slug,
     this.photo,
     this.imagePath,
     this.isParent,
     this.isFeatured,
     this.summary,
     this.parentId,
     this.status,
     this.createdAt,
     this.updatedAt,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      photo: json['photo'],
      imagePath: json['image_path'],
      isParent: json['is_parent'],
      isFeatured: json['is_featured'],
      summary: json['summary'],
      parentId: json['parent_id'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'slug': slug,
        'photo': photo,
        'image_path': imagePath,
        'is_parent': isParent,
        'is_featured': isFeatured,
        'summary': summary,
        'parent_id': parentId,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}

class CurrentDeals {
  final int? productId;
  final String? productName;
  final String? productUrl;
  final String? summary;
  final String? description;
  final String? specification;
  final int? quantity;
  final String? brand;
  final Category? category;
  final String? photo;
  final String? imagePath;
  final String? variants;
  final String? variantsPath;
  final int? price;
  final int? offerPrice;
  final int? discount;
  final String? tag;
  final bool? isFeatured;
  final int? todaysDeal;
  final String? status;
  final String? createdAt;
  final Reviews? reviews;

  CurrentDeals({
     this.productId,
     this.productName,
     this.productUrl,
     this.summary,
     this.description,
     this.specification,
     this.quantity,
     this.brand,
     this.category,
     this.photo,
     this.imagePath,
     this.variants,
     this.variantsPath,
     this.price,
     this.offerPrice,
     this.discount,
     this.tag,
     this.isFeatured,
     this.todaysDeal,
     this.status,
     this.createdAt,
     this.reviews,
  });

  factory CurrentDeals.fromJson(Map<String, dynamic> json) => CurrentDeals(
      productId: json['productId'],
      productName: json['productName'],
      productUrl: json['productUrl'],
      summary: json['summary'],
      description: json['description'],
      specification: json['specification'],
      quantity: json['quantity'],
      brand: json['brand'],
      category: json['category'],
      photo: json['photo'],
      imagePath: json['imagePath'],
      variants: json['variants'],
      variantsPath: json['variantsPath'],
      price: json['price'],
      offerPrice: json['offerPrice'],
      discount: json['discount'],
      tag: json['tag'],
      isFeatured: json['isFeatured'],
      todaysDeal: json['todaysDeal'],
      status: json['status'],
      createdAt: json['createdAt'],
      reviews: json['reviews']);

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'productName': productName,
        'productUrl': productUrl,
        'summary': summary,
        'description': description,
        'specification': specification,
        'quantity': quantity,
        'brand': brand,
        'category': category,
        'photo': photo,
        'imagePath': imagePath,
        'variants': variants,
        'variantsPath': variantsPath,
        'price': price,
        'offerPrice': offerPrice,
        'discount': discount,
        'tag': tag,
        'isFeatured': isFeatured,
        'todaysDeal': todaysDeal,
        'status': status,
        'createdAt': createdAt,
        'reviews': reviews,
      };
}

class Category {
  final int? catId;
  final String? catName;
  final String? catUrl;
  final String? photo;
  final String? imagePath;
  final bool? isParent;
  final bool? isFeatured;
  final String? summary;
  final int? parentId;
  final String? status;
  final String? createdAt;

  Category({
     this.catId,
     this.catName,
     this.catUrl,
     this.photo,
     this.imagePath,
     this.isParent,
     this.isFeatured,
     this.summary,
     this.parentId,
     this.status,
     this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      catId: json['catId'],
      catName: json['catName'],
      catUrl: json['catUrl'],
      photo: json['photo'],
      imagePath: json['imagePath'],
      isParent: json['isParent'],
      isFeatured: json['isFeatured'],
      summary: json['summary'],
      parentId: json['parentId'],
      status: json['status'],
      createdAt: json['createdAt']);

  Map<String, dynamic> toJson() => {
        'catId': catId,
        'catName': catName,
        'catUrl': catUrl,
        'photo': photo,
        'imagePath': imagePath,
        'isParent': isParent,
        'isFeatured': isFeatured,
        'summary': summary,
        'parentId': parentId,
        'status': status,
        'createdAt': createdAt,
      };
}

class Reviews {
  final int? id;
  final int? reviewId;
  final int? userId;
  final String? userName;
  final int? productId;
  final int? rate;
  final String? review;
  final String? reason;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  Reviews({
    this.id,
      this.reviewId,
       this.userId,
       this.userName,
       this.productId,
       this.rate,
       this.review,
       this.reason,
       this.status,
       this.createdAt,
      this.updatedAt});

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
      id: json['id'],
      reviewId: json['reviewId'],
      userId: json['userId'],
      userName: json['username'],
      productId: json['productId'],
      rate: json['rate'],
      review: json['review'],
      reason: json['reason'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'reviewId': reviewId,
        'userId': userId,
        'username': userName,
        'productId': productId,
        'rate': rate,
        'review': review,
        'reason': reason,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}

class DisplayCategories {
  final int? id;
  final String? title;
  final String? slug;
  final String? image;
  final String? imagePath;
  final int? position;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final Products? products;

  DisplayCategories({
     this.id,
     this.title,
     this.slug,
     this.image,
     this.imagePath,
     this.position,
     this.status,
     this.createdAt,
     this.updatedAt,
     this.products,
  });

  factory DisplayCategories.fromJson(Map<String, dynamic> json) =>
      DisplayCategories(
          id: json['id'],
          title: json['title'],
          slug: json['slug'],
          image: json['image'],
          imagePath: json['image_path'],
          position: json['position'],
          status: json['status'],
          createdAt: json['created_at'],
          updatedAt: json['updated_at'],
          products: json['products']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'slug': slug,
        'image': image,
        'image_path': imagePath,
        'position': position,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'products': products,
      };
}

class Products {
  final int? id;
  final String? title;
  final String? slug;
  final String? summary;
  final String? description;
  final String? specification;
  final int? stock;
  final int? brandId;
  final int? catId;
  final int? childCatId;
  final int? displayId;
  final String? photo;
  final String? imagePath;
  final String? variants;
  final String? variantsPath;
  final int? price;
  final int? offerPrice;
  final int? discount;
  final String? tags;
  final bool? isFeatured;
  final bool? todaysDeal;
  final String? metaTitle;
  final String? metaDescription;
  final String? metaImage;
  final String? metaImagePath;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final Reviews? reviews;

  Products({
     this.id,
     this.title,
     this.slug,
     this.summary,
     this.description,
     this.specification,
     this.stock,
     this.brandId,
     this.catId,
     this.childCatId,
     this.displayId,
     this.photo,
     this.imagePath,
     this.variants,
     this.variantsPath,
     this.price,
     this.offerPrice,
     this.discount,
     this.tags,
     this.isFeatured,
     this.todaysDeal,
     this.metaTitle,
     this.metaDescription,
     this.metaImage,
     this.metaImagePath,
     this.status,
     this.createdAt,
     this.updatedAt,
     this.reviews,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json['id'],
        title: json['title'],
        slug: json['slug'],
        summary: json['summary'],
        description: json['description'],
        specification: json['specification'],
        stock: json['stock'],
        brandId: json['brand_id'],
        catId: json['cat_id'],
        childCatId: json['child_cat_id'],
        displayId: json['display_id'],
        photo: json['photo'],
        imagePath: json['image_path'],
        variants: json['variants'],
        variantsPath: json['variants_path'],
        price: json['price'],
        offerPrice: json['offer_price'],
        discount: json['discount'],
        tags: json['tags'],
        isFeatured: json['is_featured'],
        todaysDeal: json['todays_deal'],
        metaTitle: json['meta_title'],
        metaDescription: json['meta_description'],
        metaImage: json['meta_image'],
        metaImagePath: json['meta_image_path'],
        status: json['status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        reviews: json['reviews'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'slug': slug,
        'summary': summary,
        'description': description,
        'specification': specification,
        'stock': stock,
        'brand_id': brandId,
        'cat_id': catId,
        'child_cat_id': childCatId,
        'display_id': displayId,
        'photo': photo,
        'image_path': imagePath,
        'variants': variants,
        'variants_path': variantsPath,
        'price': price,
        'offer_price': offerPrice,
        'discount': discount,
        'tags': tags,
        'is_featured': isFeatured,
        'todays_deal': todaysDeal,
        'meta_title': metaTitle,
        'meta_description': metaDescription,
        'meta_image': metaImage,
        'meta_image_path': metaImagePath,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'reviews': reviews
      };
}

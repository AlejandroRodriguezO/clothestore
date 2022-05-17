class Products {
  Products({
    required this.id,
    required this.siteId,
    required this.title,
    required this.seller,
    required this.price,
    required this.prices,
    required this.salePrice,
    required this.currencyId,
    required this.availableQuantity,
    required this.soldQuantity,
    required this.buyingMode,
    required this.listingTypeId,
    required this.stopTime,
    required this.condition,
    required this.permalink,
    required this.thumbnail,
    required this.thumbnailId,
    required this.acceptsMercadopago,
    required this.installments,
    required this.address,
    required this.shipping,
    required this.sellerAddress,
    required this.attributes,
    required this.differentialPricing,
    required this.originalPrice,
    required this.categoryId,
    required this.officialStoreId,
    required this.domainId,
    required this.catalogProductId,
    required this.tags,
    required this.orderBackend,
    required this.useThumbnailId,
  });

  String id;
  String siteId;
  String title;
  String currencyId;
  String buyingMode;
  String listingTypeId;
  String condition;
  String permalink;
  String thumbnail;
  String thumbnailId;
  String categoryId;
  String domainId;

  Map<String, dynamic> seller;
  Map<String, dynamic> prices;
  Map<String, dynamic> installments;
  Map<String, dynamic> address;
  Map<String, dynamic> shipping;
  Map<String, dynamic> sellerAddress;

  int price;
  int availableQuantity;
  int soldQuantity;
  int orderBackend;

  dynamic salePrice;
  dynamic originalPrice;
  dynamic differentialPricing;
  dynamic officialStoreId;
  dynamic catalogProductId;

  DateTime stopTime;
  bool acceptsMercadopago;
  bool useThumbnailId;
  List attributes;
  List tags;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"] as String,
        siteId: json["site_id"] as String,
        title: json["title"] as String,
        seller: json["seller"] as Map<String, dynamic>,
        price: json["price"] as int,
        prices: json["prices"] as Map<String, dynamic>,
        salePrice: json["sale_price"],
        currencyId: json["currency_id"] as String,
        availableQuantity: json["available_quantity"] as int,
        soldQuantity: json["sold_quantity"] as int,
        buyingMode: json["buying_mode"] as String,
        listingTypeId: json["listing_type_id"] as String,
        stopTime: DateTime.parse(json["stop_time"] as String),
        condition: json["condition"] as String,
        permalink: json["permalink"] as String,
        thumbnail: json["thumbnail"] as String,
        thumbnailId: json["thumbnail_id"] as String,
        acceptsMercadopago: json["accepts_mercadopago"] as bool,
        installments: json["installments"] as Map<String, dynamic>,
        address: json["address"] as Map<String, dynamic>,
        shipping: json["shipping"] as Map<String, dynamic>,
        sellerAddress: json["seller_address"] as Map<String, dynamic>,
        attributes: json["attributes"] as List,
        differentialPricing: json["differential_pricing"],
        originalPrice: json["original_price"],
        categoryId: json["category_id"] as String,
        officialStoreId: json["official_store_id"],
        domainId: json["domain_id"] as String,
        catalogProductId: json["catalog_product_id"],
        tags: json["tags"] as List,
        orderBackend: json["order_backend"] as int,
        useThumbnailId: json["use_thumbnail_id"] as bool,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "site_id": siteId,
        "title": title,
        "seller": seller,
        "price": price,
        "prices": prices,
        "sale_price": salePrice,
        "currency_id": currencyId,
        "available_quantity": availableQuantity,
        "sold_quantity": soldQuantity,
        "buying_mode": buyingMode,
        "listing_type_id": listingTypeId,
        "stop_time": stopTime.toIso8601String(),
        "condition": condition,
        "permalink": permalink,
        "thumbnail": thumbnail,
        "thumbnail_id": thumbnailId,
        "accepts_mercadopago": acceptsMercadopago,
        "installments": installments,
        "address": address,
        "shipping": shipping,
        "seller_address": sellerAddress,
        "attributes": attributes,
        "differential_pricing": differentialPricing,
        "original_price": originalPrice,
        "category_id": categoryId,
        "official_store_id": officialStoreId,
        "domain_id": domainId,
        "catalog_product_id": catalogProductId,
        "tags": tags,
        "order_backend": orderBackend,
        "use_thumbnail_id": useThumbnailId,
      };
}
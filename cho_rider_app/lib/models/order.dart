class Order {
  final String id;
  final String userId;
  final String riderId;
  final List<OrderItem> items;
  final double totalPrice;
  final String orderStatus;
  final DateTime orderDate;
  final DateTime? deliveryDate;
  final String deliveryAddress;
  final String paymentMethod;
  final String paymentStatus;

  Order({
    required this.id,
    required this.userId,
    required this.riderId,
    required this.items,
    required this.totalPrice,
    required this.orderStatus,
    required this.orderDate,
    this.deliveryDate,
    required this.deliveryAddress,
    required this.paymentMethod,
    required this.paymentStatus,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      userId: map['userId'],
      riderId: map['riderId'],
      items: List<OrderItem>.from(
          map['items'].map((item) => OrderItem.fromMap(item))),
      totalPrice: map['totalPrice'],
      orderStatus: map['orderStatus'],
      orderDate: DateTime.parse(map['orderDate']),
      deliveryDate: map['deliveryDate'] != null
          ? DateTime.parse(map['deliveryDate'])
          : null,
      deliveryAddress: map['deliveryAddress'],
      paymentMethod: map['paymentMethod'],
      paymentStatus: map['paymentStatus'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'riderId': riderId,
      'items': items.map((item) => item.toMap()).toList(),
      'totalPrice': totalPrice,
      'orderStatus': orderStatus,
      'orderDate': orderDate.toIso8601String(),
      'deliveryDate': deliveryDate?.toIso8601String(),
      'deliveryAddress': deliveryAddress,
      'paymentMethod': paymentMethod,
      'paymentStatus': paymentStatus,
    };
  }
}

class OrderItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  OrderItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }
}

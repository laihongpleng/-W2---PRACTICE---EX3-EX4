enum DeliveryType { delivery, pickup }

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class OrderItem {
  final Product product;
  final int quantity;

  OrderItem({required this.product, required this.quantity});

  double getTotal() => product.price * quantity;
}

class Customer {
  final String name;
  final String email;
  final String? phone;

  Customer({required this.name, required this.email, this.phone});
}

class Order {
  final List<OrderItem> items;
  final DeliveryType deliveryType;
  final String? address;
  final Customer customer;

  Order({
    required this.items,
    required this.deliveryType,
    required this.customer,
    this.address,
   
  })
  {
    // Validation: delivery orders must have an address
    if (deliveryType == DeliveryType.delivery && address == null) {
      throw Exception("Delivery orders must have an address.");
    }
  }

  double getTotalAmount() {
    double total = 0;
    for (var item in items) {
      total += item.getTotal();
    }
    return total;
  }
  @override
  String toString() {
    String itemDetails = items
        .map((item) => "${item.product.name} x${item.quantity}: \$${item.getTotal()}")
        .join("\n");
    String deliveryInfo =
        deliveryType == DeliveryType.delivery ? "Delivery to $address" : "Pickup at shop";
    return "Order for ${customer.name}:\n$deliveryInfo\nItems:\n$itemDetails\nTotal: \$${getTotalAmount()}";
  }
}

void main() {
  Product book = Product(name: "Dart Book", price: 20.0);
  var pen = Product(name: "Pen", price: 2.5);

  var item1 = OrderItem(product: book, quantity: 3);
  var item2 = OrderItem(product: pen, quantity: 5);

  var customer = Customer(name: "Alice", email: "alice@example.com");

  // Sample order
  var order = Order(
    items: [item1, item2],
    deliveryType: DeliveryType.pickup,
    
    customer: customer,
  );

 print(order.toString());
}

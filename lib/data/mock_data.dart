// ============================================================
// 【Mock数据 - 供项目展示和预览使用】
// 注意：这些模型是简化版，用于列表展示
// 完整模型定义在各项目的sourceCode中
// ============================================================

import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final IconData icon;

  const Product({
    required this.name,
    required this.price,
    required this.icon,
  });
}

class CartItem {
  final String name;
  final double price;
  int count;
  bool selected;

  CartItem({
    required this.name,
    required this.price,
    this.count = 1,
    this.selected = false,
  });

  double get total => price * count;
}

enum OrderStatus { all, pending, shipped, completed }

class Order {
  final String id;
  final String product;
  final double price;
  final OrderStatus status;

  const Order({
    required this.id,
    required this.product,
    required this.price,
    required this.status,
  });
}

class SalesData {
  final String date;
  final double amount;

  const SalesData(this.date, this.amount);
}

class City {
  final String name;
  final String pinyin;

  const City(this.name, this.pinyin);
}

class Weather {
  final String city;
  final int temp;
  final String weather;
  final int humidity;
  final IconData icon;

  const Weather({
    required this.city,
    required this.temp,
    required this.weather,
    required this.humidity,
    required this.icon,
  });
}

class FutureWeather {
  final String day;
  final String weather;
  final int high;
  final int low;
  final IconData icon;

  const FutureWeather(this.day, this.weather, this.high, this.low, this.icon);
}

// ============================================================
// Mock数据常量
// ============================================================

const mockProducts = [
  Product(name: 'iPhone 15', price: 6999, icon: Icons.phone_iphone),
  Product(name: 'MacBook Pro', price: 12999, icon: Icons.laptop_mac),
  Product(name: 'AirPods Pro', price: 1999, icon: Icons.headphones),
];

final mockCartItems = [
  CartItem(name: 'iPhone 15', price: 6999),
  CartItem(name: 'AirPods Pro', price: 1999),
];

final mockOrders = [
  Order(id: '001', product: 'iPhone 15', price: 6999, status: OrderStatus.pending),
  Order(id: '002', product: 'AirPods', price: 1999, status: OrderStatus.shipped),
  Order(id: '003', product: 'MacBook', price: 12999, status: OrderStatus.completed),
];

const mockSalesData = [
  SalesData('周一', 1234),
  SalesData('周二', 2345),
  SalesData('周三', 1890),
  SalesData('周四', 2100),
  SalesData('周五', 3200),
  SalesData('周六', 4500),
  SalesData('周日', 3800),
];

const mockCities = [
  City('北京', 'beijing'),
  City('上海', 'shanghai'),
  City('广州', 'guangzhou'),
  City('深圳', 'shenzhen'),
  City('杭州', 'hangzhou'),
  City('南京', 'nanjing'),
  City('成都', 'chengdu'),
  City('重庆', 'chongqing'),
];

const mockWeather = Weather(city: '北京', temp: 26, weather: '晴', humidity: 45, icon: Icons.wb_sunny);

const mockFutureWeather = [
  FutureWeather('明天', '多云', 28, 18, Icons.cloud),
  FutureWeather('后天', '晴', 30, 20, Icons.wb_sunny),
  FutureWeather('周四', '阴', 25, 17, Icons.cloud),
];

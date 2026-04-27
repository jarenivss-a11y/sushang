// ============================================================
// 【通用项目组件】
// 供项目列表预览使用，完整实现见各项目的sourceCode
// ============================================================

import 'package:flutter/material.dart';
import '../data/mock_data.dart';

// --------------------------------------------------------
// 搜索栏组件
// --------------------------------------------------------
class ProjectSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hintText;

  const ProjectSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hintText = '搜索...',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

// --------------------------------------------------------
// 商品卡片（用于商品列表项目预览）
// --------------------------------------------------------
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(product.icon, size: 32, color: Theme.of(context).primaryColor),
        title: Text(product.name),
        subtitle: Text('¥${product.price.toStringAsFixed(0)}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

// --------------------------------------------------------
// 购物车商品项（用于购物车项目预览）
// --------------------------------------------------------
class CartItemTile extends StatelessWidget {
  final CartItem item;
  final int index;
  final VoidCallback onToggle;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemTile({
    super.key,
    required this.item,
    required this.index,
    required this.onToggle,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Checkbox(value: item.selected, onChanged: (_) => onToggle()),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('¥${item.price.toStringAsFixed(0)}', style: const TextStyle(color: Colors.red)),
                ],
              ),
            ),
            IconButton(icon: const Icon(Icons.remove), onPressed: onDecrement),
            Text('${item.count}'),
            IconButton(icon: const Icon(Icons.add), onPressed: onIncrement),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------------
// 订单卡片（用于订单管理项目预览）
// --------------------------------------------------------
class OrderCard extends StatelessWidget {
  final Order order;
  final Color statusColor;
  final String statusText;

  const OrderCard({
    super.key,
    required this.order,
    required this.statusColor,
    required this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('订单号: ${order.id}', style: TextStyle(color: Colors.grey[600])),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withAlpha(25),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(statusText, style: TextStyle(color: statusColor, fontSize: 12)),
                ),
              ],
            ),
            const Divider(),
            Text(order.product),
            const SizedBox(height: 4),
            Text(
              '合计: ¥${order.price.toStringAsFixed(0)}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------------
// 统计卡片（用于销售统计项目预览）
// --------------------------------------------------------
class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const StatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey[200]!, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }
}

// --------------------------------------------------------
// 简单柱状图（用于销售统计项目预览）
// --------------------------------------------------------
class SimpleBarChart extends StatelessWidget {
  final List<SalesData> data;

  const SimpleBarChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const SizedBox();

    final maxAmount = data.map((d) => d.amount).reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: data.map((d) {
          final height = (d.amount / maxAmount) * 100;
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${(d.amount / 1000).toStringAsFixed(0)}k',
                style: const TextStyle(fontSize: 10),
              ),
              const SizedBox(height: 4),
              Container(
                width: 30,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 4),
              Text(d.date, style: const TextStyle(fontSize: 10)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

// --------------------------------------------------------
// 城市列表项（用于城市选择器项目预览）
// --------------------------------------------------------
class CityTile extends StatelessWidget {
  final City city;
  final VoidCallback onTap;

  const CityTile({
    super.key,
    required this.city,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(city.pinyin[0].toUpperCase()),
      ),
      title: Text(city.name),
      subtitle: Text(city.pinyin),
      onTap: onTap,
    );
  }
}

// --------------------------------------------------------
// 天气卡片（用于天气App项目预览）
// --------------------------------------------------------
class WeatherCard extends StatelessWidget {
  final Weather weather;
  final List<FutureWeather> futureWeather;

  const WeatherCard({
    super.key,
    required this.weather,
    required this.futureWeather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 当前天气
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[400]!, Colors.blue[600]!],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Text(weather.city, style: const TextStyle(color: Colors.white, fontSize: 24)),
              const SizedBox(height: 16),
              Icon(weather.icon, color: Colors.white, size: 64),
              Text(
                '${weather.temp}°C',
                style: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
              ),
              Text(weather.weather, style: const TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _WeatherInfo(icon: Icons.water_drop, label: '湿度', value: '${weather.humidity}%'),
                  _WeatherInfo(icon: Icons.air, label: '风力', value: '3级'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // 未来天气
        const Align(
          alignment: Alignment.centerLeft,
          child: Text('未来天气预报', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 12),
        ...futureWeather.map((f) => Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(f.day, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 16),
                Icon(f.icon, size: 24),
                const SizedBox(width: 16),
                Expanded(child: Text(f.weather)),
                Text('${f.high}° / ${f.low}°', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
        )),
      ],
    );
  }
}

class _WeatherInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _WeatherInfo({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        Text(value, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

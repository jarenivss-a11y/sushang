// ============================================================
// 【项目实战列表页面】
// 作用：显示11个实战项目的列表和详情
// ============================================================

import 'package:flutter/material.dart';
import '../../data/projects_data.dart';
import '../../data/mock_data.dart';
import '../../models/project_model.dart';
import '../../widgets/project_widgets.dart';

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('项目实战'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 项目简介
          _buildIntroCard(context),
          const SizedBox(height: 20),

          // 项目列表
          ...AllProjects.all.asMap().entries.map((entry) {
            final index = entry.key;
            final project = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ProjectCard(
                project: project,
                index: index + 1,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildIntroCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green[400]!, Colors.teal[400]!],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Text('💻', style: TextStyle(fontSize: 24)),
              SizedBox(width: 8),
              Text(
                '动手做项目',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            '光看不动手是学不会编程的！\n跟着这些项目一步步做，做完你就有真正的App了。',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// 项目卡片
class _ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final int index;

  const _ProjectCard({
    required this.project,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetailScreen(project: project),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // 项目图标
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: _getDifficultyColor(project.difficulty).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        project.icon,
                        style: const TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 项目信息
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          project.subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 6),
                        // 难度星级
                        Row(
                          children: List.generate(
                            5,
                            (i) => Icon(
                              i < project.difficulty
                                  ? Icons.star
                                  : Icons.star_border,
                              size: 14,
                              color: _getDifficultyColor(project.difficulty),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
              const SizedBox(height: 12),
              // 项目简介
              Text(
                project.introduction,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),
              // 预估信息
              Row(
                children: [
                  _InfoChip(
                    icon: Icons.schedule,
                    label: '预计${_getTimeEstimate(project.difficulty)}',
                  ),
                  const SizedBox(width: 8),
                  _InfoChip(
                    icon: Icons.list,
                    label: '${project.steps.length}步完成',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getDifficultyColor(int difficulty) {
    if (difficulty <= 1) return Colors.green;
    if (difficulty <= 2) return Colors.blue;
    if (difficulty <= 3) return Colors.orange;
    return Colors.red;
  }

  String _getTimeEstimate(int difficulty) {
    if (difficulty == 1) return '30分钟';
    if (difficulty == 2) return '1-2小时';
    if (difficulty == 3) return '2-3小时';
    return '3小时以上';
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Colors.grey[600]),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 【项目详情页面】
// 作用：显示项目的详细信息、教程步骤、完整代码
// ============================================================

class ProjectDetailScreen extends StatefulWidget {
  final ProjectModel project;

  const ProjectDetailScreen({
    super.key,
    required this.project,
  });

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  bool _showPreview = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.name),
        actions: [
          // 预览/代码切换
          SegmentedButton<bool>(
            segments: const [
              ButtonSegment(value: true, label: Text('预览'), icon: Icon(Icons.play_circle_outline)),
              ButtonSegment(value: false, label: Text('代码'), icon: Icon(Icons.code)),
            ],
            selected: {_showPreview},
            onSelectionChanged: (selected) {
              setState(() => _showPreview = selected.first);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _showPreview
          ? _buildLivePreview()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 20),
                  _buildSteps(),
                  const SizedBox(height: 20),
                  _buildSourceCode(),
                  const SizedBox(height: 20),
                  _buildCustomizableParts(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
    );
  }

  // ============================================================
  // 实时预览模式
  // ============================================================
  Widget _buildLivePreview() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 项目头部预览
          _buildHeader(context),
          const SizedBox(height: 20),

          // 根据项目ID显示对应预览
          _buildProjectPreview(),
        ],
      ),
    );
  }

  Widget _buildProjectPreview() {
    switch (widget.project.id) {
      case 'project6':
        return _ProductListPreview();
      case 'project7':
        return _ShoppingCartPreview();
      case 'project8':
        return _OrderManagerPreview();
      case 'project9':
        return _SalesStatsPreview();
      case 'project10':
        return _CityPickerPreview();
      case 'project11':
        return _WeatherAppPreview();
      default:
        return _buildDefaultPreview();
    }
  }

  Widget _buildDefaultPreview() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Icon(Icons.smartphone, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            '点击「代码」查看完整实现',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // 项目预览组件
  // ============================================================
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.project.icon, style: const TextStyle(fontSize: 48)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.project.subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            widget.project.effectDescription,
            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSteps() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📝 一步一步做',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...widget.project.steps.map((step) => _StepCard(step: step)),
        ],
      ),
    );
  }

  Widget _buildSourceCode() {
    if (widget.project.sourceCode.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '💻 完整代码',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _CodeSection(code: widget.project.sourceCode),
        ],
      ),
    );
  }

  Widget _buildCustomizableParts() {
    if (widget.project.customizableParts.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🎨 可以这样改',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...widget.project.customizableParts.map((part) => Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.edit, size: 16, color: Colors.blue),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          part,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

// ============================================================
// 各项目的实时预览组件
// ============================================================

// 商品列表预览
class _ProductListPreview extends StatefulWidget {
  @override
  State<_ProductListPreview> createState() => _ProductListPreviewState();
}

class _ProductListPreviewState extends State<_ProductListPreview> {
  final _searchController = TextEditingController();
  List<Product> _filtered = List.from(mockProducts);

  void _search(String keyword) {
    setState(() {
      _filtered = keyword.isEmpty
          ? List.from(mockProducts)
          : mockProducts.where((p) => p.name.contains(keyword)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProjectSearchBar(
          controller: _searchController,
          onChanged: _search,
          hintText: '搜索商品...',
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filtered.length,
            itemBuilder: (context, index) {
              return ProductCard(product: _filtered[index]);
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

// 购物车预览
class _ShoppingCartPreview extends StatefulWidget {
  @override
  State<_ShoppingCartPreview> createState() => _ShoppingCartPreviewState();
}

class _ShoppingCartPreviewState extends State<_ShoppingCartPreview> {
  late List<CartItem> _items;

  @override
  void initState() {
    super.initState();
    _items = mockCartItems.map((item) => CartItem(
      name: item.name,
      price: item.price,
      count: item.count,
      selected: item.selected,
    )).toList();
  }

  double get _total => _items.where((i) => i.selected).fold(0, (sum, i) => sum + i.total);
  int get _count => _items.where((i) => i.selected).length;

  void _toggle(int i) => setState(() => _items[i].selected = !_items[i].selected);
  void _inc(int i) => setState(() => _items[i].count++);
  void _dec(int i) => setState(() { if (_items[i].count > 1) _items[i].count--; });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final item = _items[index];
              return CartItemTile(
                item: item,
                index: index,
                onToggle: () => _toggle(index),
                onIncrement: () => _inc(index),
                onDecrement: () => _dec(index),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey[300]!, blurRadius: 4)],
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('已选 $_count 件'),
                  Text(
                    '合计: ¥${_total.toStringAsFixed(0)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {},
                child: const Text('结算'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 订单管理预览
class _OrderManagerPreview extends StatefulWidget {
  @override
  State<_OrderManagerPreview> createState() => _OrderManagerPreviewState();
}

class _OrderManagerPreviewState extends State<_OrderManagerPreview> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Order> _filter(OrderStatus status) {
    if (status == OrderStatus.all) return mockOrders;
    return mockOrders.where((o) => o.status == status).toList();
  }

  Color _color(OrderStatus s) {
    return s == OrderStatus.pending
        ? Colors.orange
        : s == OrderStatus.shipped
            ? Colors.blue
            : Colors.green;
  }

  String _text(OrderStatus s) {
    return s == OrderStatus.pending
        ? '待付款'
        : s == OrderStatus.shipped
            ? '待发货'
            : '已完成';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: '全部'),
            Tab(text: '待付款'),
            Tab(text: '待发货'),
            Tab(text: '已完成'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [0, 1, 2, 3].map((i) {
              final orders = _filter(OrderStatus.values[i]);
              if (orders.isEmpty) {
                return const Center(child: Text('没有相关订单'));
              }
              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return OrderCard(
                    order: order,
                    statusColor: _color(order.status),
                    statusText: _text(order.status),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

// 销售统计预览
class _SalesStatsPreview extends StatelessWidget {
  double get _total => mockSalesData.fold(0, (sum, d) => sum + d.amount);
  int get _orders => mockSalesData.length * 15;
  double get _avg => _total / _orders;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: StatsCard(title: '总销售额', value: '${(_total / 10000).toStringAsFixed(1)}万', color: Colors.red, icon: Icons.money)),
              const SizedBox(width: 8),
              Expanded(child: StatsCard(title: '订单数', value: '$_orders', color: Colors.blue, icon: Icons.shopping_cart)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: StatsCard(title: '客单价', value: '${_avg.toStringAsFixed(0)}', color: Colors.green, icon: Icons.person)),
              const SizedBox(width: 8),
              Expanded(child: StatsCard(title: '转化率', value: '3.2%', color: Colors.purple, icon: Icons.trending_up)),
            ],
          ),
          const SizedBox(height: 24),
          const Text('近7天销售趋势', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.grey[200]!, blurRadius: 4)],
            ),
            child: SimpleBarChart(data: mockSalesData),
          ),
          const SizedBox(height: 24),
          const Text('销售排行', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          _RankItem(rank: 1, name: 'iPhone 15', sales: 50, value: 349950),
          _RankItem(rank: 2, name: 'MacBook Pro', sales: 30, value: 389970),
          _RankItem(rank: 3, name: 'AirPods', sales: 100, value: 199900),
        ],
      ),
    );
  }
}

class _RankItem extends StatelessWidget {
  final int rank;
  final String name;
  final int sales;
  final double value;

  const _RankItem({required this.rank, required this.name, required this.sales, required this.value});

  Color get _color => rank == 1 ? Colors.amber : rank == 2 ? Colors.grey : rank == 3 ? Colors.brown : Colors.grey[300]!;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(color: _color, shape: BoxShape.circle),
              child: Center(child: Text('$rank', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(name)),
            Text('销量: $sales'),
            const SizedBox(width: 16),
            Text('${(value / 10000).toStringAsFixed(1)}万', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// 城市选择器预览
class _CityPickerPreview extends StatefulWidget {
  @override
  State<_CityPickerPreview> createState() => _CityPickerPreviewState();
}

class _CityPickerPreviewState extends State<_CityPickerPreview> {
  final _searchController = TextEditingController();
  List<City> _filtered = List.from(mockCities);

  void _search(String keyword) {
    setState(() {
      _filtered = keyword.isEmpty
          ? List.from(mockCities)
          : mockCities.where((c) => c.name.contains(keyword) || c.pinyin.contains(keyword.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProjectSearchBar(
          controller: _searchController,
          onChanged: _search,
          hintText: '搜索城市...',
        ),
        Expanded(
          child: _filtered.isEmpty
              ? const Center(child: Text('没有找到城市'))
              : ListView.builder(
                  itemCount: _filtered.length,
                  itemBuilder: (context, index) {
                    final city = _filtered[index];
                    return CityTile(
                      city: city,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('已选择: ${city.name}')),
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

// 天气App预览
class _WeatherAppPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: WeatherCard(
        weather: mockWeather,
        futureWeather: mockFutureWeather,
      ),
    );
  }
}

// ============================================================
// 步骤卡片
// ============================================================
class _StepCard extends StatelessWidget {
  final ProjectStep step;

  const _StepCard({required this.step});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${step.stepNumber}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    step.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              step.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            if (step.codeSnippet != null) ...[
              const SizedBox(height: 12),
              _CodeSection(code: step.codeSnippet!),
            ],
            if (step.tip != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.amber[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber[200]!),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.lightbulb, size: 16, color: Colors.amber[700]),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        step.tip!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.amber[900],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 代码展示区
// ============================================================
class _CodeSection extends StatelessWidget {
  final String code;

  const _CodeSection({required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'DART',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('代码已复制！')),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.copy, size: 14, color: Colors.white70),
                      SizedBox(width: 4),
                      Text(
                        '复制',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                code,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                  color: Color(0xFFE0E0E0),
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

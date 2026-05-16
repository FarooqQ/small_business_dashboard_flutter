import 'package:flutter/material.dart';

import '../../../core/widgets/kpi_card.dart';
import '../config/default_client_config.dart';
import '../models/dashboard_summary.dart';
import '../repositories/dashboard_repository.dart';
import '../reports/dashboard_report_generator.dart';
import '../reports/export_content_builder.dart';
import '../widgets/mini_bar_chart.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final DashboardRepository _repository;
  late final Future<DashboardSummary> _summaryFuture;

  @override
  void initState() {
    super.initState();

    _repository = DashboardRepository.defaultRepository();
    _summaryFuture = _repository.loadDashboardSummary();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DashboardSummary>(
      future: _summaryFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Unable to load dashboard data.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          );
        }

        final summary = snapshot.data;

        if (summary == null) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'No dashboard data available.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          );
        }

        return Scaffold(
          body: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1480),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _DashboardHeader(summary: summary),
                        const SizedBox(height: 24),
                        _KpiSection(summary: summary),
                        const SizedBox(height: 24),
                        _ReportActionsPanel(summary: summary),
                        const SizedBox(height: 24),
                        _MainDashboardContent(summary: summary),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/////

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    final config = defaultClientConfig;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    config.businessName,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${config.dashboardVersionLabel} · ${config.dashboardSubtitle}',
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            _HeaderBadge(
              label: config.topProductLabel,
              value: summary.topProductName,
              icon: Icons.workspace_premium_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

/////////
class _HeaderBadge extends StatelessWidget {
  const _HeaderBadge({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 220),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }
}

class _KpiSection extends StatelessWidget {
  const _KpiSection({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    final config = defaultClientConfig;

    String money(double value) {
      return '${config.currencySymbol}${value.toStringAsFixed(2)}';
    }

    final cards = [
      KpiCard(
        title: 'Total Sales',
        value: money(summary.totalSales),
        subtitle: 'Revenue from all orders',
        icon: Icons.payments_outlined,
      ),
      KpiCard(
        title: 'Total Profit',
        value: money(summary.totalProfit),
        subtitle: 'Estimated gross profit',
        icon: Icons.trending_up,
      ),
      KpiCard(
        title: 'Orders',
        value: summary.totalOrders.toString(),
        subtitle: 'Number of sales records',
        icon: Icons.receipt_long_outlined,
      ),
      KpiCard(
        title: 'Average Order',
        value: money(summary.averageOrderValue),
        subtitle: 'Average revenue per order',
        icon: Icons.analytics_outlined,
      ),
      KpiCard(
        title: 'Low Stock',
        value: summary.lowStockCount.toString(),
        subtitle: 'Items need attention',
        icon: Icons.warning_amber_rounded,
      ),
      KpiCard(
        title: 'Categories',
        value: summary.salesByCategory.length.toString(),
        subtitle: 'Active sales groups',
        icon: Icons.category_outlined,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 1200;

        if (!isWide) {
          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: cards
                .map((card) => SizedBox(width: 220, child: card))
                .toList(),
          );
        }

        return Row(
          children: [
            for (var index = 0; index < cards.length; index++) ...[
              Expanded(child: cards[index]),
              if (index != cards.length - 1) const SizedBox(width: 16),
            ],
          ],
        );
      },
    );
  }
}

class _ReportActionsPanel extends StatelessWidget {
  const _ReportActionsPanel({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    const generator = DashboardReportGenerator();
    const exportBuilder = ExportContentBuilder();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: _PanelTitle(
                title: 'Export Reports',
                subtitle:
                    'Preview report content before adding real file export.',
                icon: Icons.description_outlined,
              ),
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    final report = generator.generateDashboardSummaryReport(
                      summary,
                    );
                    final exportContent = exportBuilder.buildTextExport(report);

                    _showReportPreviewDialog(
                      context: context,
                      title: report.title,
                      fileName: exportContent.fileName,
                      content: exportContent.content,
                    );
                  },
                  icon: const Icon(Icons.summarize_outlined),
                  label: const Text('Summary'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    final report = generator.generateLowStockReport(summary);
                    final exportContent = exportBuilder.buildCsvExport(report);

                    _showReportPreviewDialog(
                      context: context,
                      title: report.title,
                      fileName: exportContent.fileName,
                      content: exportContent.content,
                    );
                  },
                  icon: const Icon(Icons.inventory_2_outlined),
                  label: const Text('Low Stock'),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    final report = generator.generateSalesByCategoryReport(
                      summary,
                    );
                    final exportContent = exportBuilder.buildCsvExport(report);

                    _showReportPreviewDialog(
                      context: context,
                      title: report.title,
                      fileName: exportContent.fileName,
                      content: exportContent.content,
                    );
                  },
                  icon: const Icon(Icons.bar_chart_rounded),
                  label: const Text('Categories'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showReportPreviewDialog({
    required BuildContext context,
    required String title,
    required String fileName,
    required String content,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: 640,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Suggested file name:',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 6),
                  SelectableText(fileName),
                  const SizedBox(height: 16),
                  Text(
                    'Preview:',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 6),
                  SelectableText(content),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class _MainDashboardContent extends StatelessWidget {
  const _MainDashboardContent({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    final chartItems = summary.salesByCategory
        .map(
          (item) =>
              MiniBarChartItem(label: item.category, value: item.totalSales),
        )
        .toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 1000;

        if (!isWide) {
          return Column(
            children: [
              _SalesByCategoryPanel(chartItems: chartItems),
              const SizedBox(height: 16),
              _LowStockPanel(summary: summary),
            ],
          );
        }

        return SizedBox(
          height: 360,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 7,
                child: _SalesByCategoryPanel(chartItems: chartItems),
              ),
              const SizedBox(width: 20),
              Expanded(flex: 4, child: _LowStockPanel(summary: summary)),
            ],
          ),
        );
      },
    );
  }
}

class _SalesByCategoryPanel extends StatelessWidget {
  const _SalesByCategoryPanel({required this.chartItems});

  final List<MiniBarChartItem> chartItems;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PanelTitle(
              title: 'Sales by Category',
              subtitle: 'Revenue distribution across product categories',
              icon: Icons.bar_chart_rounded,
            ),
            const SizedBox(height: 18),
            Expanded(child: MiniBarChart(items: chartItems)),
          ],
        ),
      ),
    );
  }
}

class _LowStockPanel extends StatelessWidget {
  const _LowStockPanel({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    final lowStockRows = summary.lowStockItems
        .map(
          (item) => _LowStockItemRow(
            name: item.productName,
            currentStock: item.currentStock,
            minimumStock: item.minimumStock,
          ),
        )
        .toList();

    return SizedBox.expand(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _PanelTitle(
                title: 'Low Stock Items',
                subtitle: 'Products that need restocking soon',
                icon: Icons.inventory_2_outlined,
              ),
              const SizedBox(height: 18),
              if (lowStockRows.isEmpty)
                const Text('No low stock items.')
              else
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: lowStockRows),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PanelTitle extends StatelessWidget {
  const _PanelTitle({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: const Color(0xFF6B7280)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LowStockItemRow extends StatelessWidget {
  const _LowStockItemRow({
    required this.name,
    required this.currentStock,
    required this.minimumStock,
  });

  final String name;
  final int currentStock;
  final int minimumStock;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            size: 22,
            color: Color(0xFFB45309),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            '$currentStock/$minimumStock',
            style: const TextStyle(
              color: Color(0xFFB45309),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MiniBarChartItem {
  const MiniBarChartItem({required this.label, required this.value});

  final String label;
  final double value;
}

class MiniBarChart extends StatelessWidget {
  const MiniBarChart({super.key, required this.items});

  final List<MiniBarChartItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        padding: const EdgeInsets.all(18),
        child: const Center(child: Text('No chart data available')),
      );
    }

    final maxValue = items
        .map((item) => item.value)
        .reduce((current, next) => current > next ? current : next);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: SizedBox(
        height: 210,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final availableBarHeight = constraints.maxHeight - 86;

            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      const Positioned.fill(child: _ChartGridLines()),
                      Positioned.fill(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: items.map((item) {
                            final normalizedHeight = maxValue == 0
                                ? 0.0
                                : (item.value / maxValue) * availableBarHeight;

                            return Expanded(
                              child: _ChartBar(
                                value: item.value,
                                barHeight: normalizedHeight,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 34,
                  child: Row(
                    children: items.map((item) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            item.label,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ChartGridLines extends StatelessWidget {
  const _ChartGridLines();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
        (_) => Container(height: 1, color: const Color(0xFFE5E7EB)),
      ),
    );
  }
}

class _ChartBar extends StatelessWidget {
  const _ChartBar({required this.value, required this.barHeight});

  final double value;
  final double barHeight;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            value.toStringAsFixed(0),
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Container(
            height: barHeight,
            width: 38,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withAlpha(32),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

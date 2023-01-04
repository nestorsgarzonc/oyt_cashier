import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oyt_front_widgets/tabs/tab_header.dart';
import 'package:cashier/features/tables/ui/table_screen.dart';
import 'package:oyt_front_table/models/tables_socket_response.dart';
import 'package:oyt_front_table/models/users_table.dart';
import 'package:oyt_front_widgets/cards/table_grid_card.dart';

class TablesTab extends ConsumerStatefulWidget {
  const TablesTab({super.key});

  @override
  ConsumerState<TablesTab> createState() => _TablesTabState();
}

class _TablesTabState extends ConsumerState<TablesTab> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TabHeader(
          title: 'Mesas',
          subtitle: 'Aca puedes ver las mesas del restaurante en tiempo real.',
        ),
        Expanded(
          child: Scrollbar(
            controller: _scrollController,
            child: GridView.builder(
              itemCount: 30,
              controller: _scrollController,
              gridDelegate: TableGridCard.gridDelegate,
              itemBuilder: (context, index) {
                return TableGridCard(
                  item: TableResponse(
                    id: '1',
                    name: '${index + 1}',
                    status: TableStatus.values[Random().nextInt(TableStatus.values.length)],
                  ),
                  isCallingTable: Random().nextBool(),
                  onSelectTable: (item) =>
                      GoRouter.of(context).push('${TableScreen.route}?id=${item.id}'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:non_steam_artwork/core/extensions/iterable_widget_extension.dart';
import 'package:non_steam_artwork/core/l10n/l10n_extension.dart';
import 'package:non_steam_artwork/core/settings/sort_program_type.dart';
import 'package:non_steam_artwork/core/settings/state.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';
import 'package:non_steam_artwork/features/home/home_state.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const SearchProgramsTextField(),
      actions: const [
        FilterProgramChips(),
        Gap(16),
        Padding(
          // 16 right, 2 vertically to better align
          padding: EdgeInsets.only(right: 16, top: 2, bottom: 2),
          child: SortProgramsButton(),
        ),
      ],
    );
  }
}

@visibleForTesting
class SearchProgramsTextField extends ConsumerStatefulWidget {
  const SearchProgramsTextField({super.key});

  @override
  ConsumerState<SearchProgramsTextField> createState() => _SearchProgramsTextFieldState();
}

class _SearchProgramsTextFieldState extends ConsumerState<SearchProgramsTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController()
      ..addListener(() {
        ref.read(searchControllerProvider.notifier).updateSearch(_controller.text);
      });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: context.l10n.homeAppBarSearchHintLabel,
      ),
    );
  }
}

@visibleForTesting
class FilterProgramChips extends ConsumerWidget {
  const FilterProgramChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredProgramTypesControllerProvider);

    return Row(
      children: [
        for (final type in SteamProgramType.values)
          FilterChip(
            label: Text(type.name),
            selected: state[type]!,
            onSelected: (_) => ref.read(filteredProgramTypesControllerProvider.notifier).toggle(type),
          ),
      ].intersperse(const Gap(4)),
    );
  }
}

@visibleForTesting
class SortProgramsButton extends ConsumerWidget {
  const SortProgramsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sortProgramTypeControllerProvider);

    return DropdownMenu<SortProgramType>(
      width: 150,
      initialSelection: state,
      leadingIcon: const Icon(Icons.sort),
      // label: Text(context.l10n.homeAppBarSortLabel),
      trailingIcon: GestureDetector(
        onTap: ref.read(sortingAscendingControllerProvider.notifier).toggle,
        child: Icon(ref.watch(sortingAscendingControllerProvider) ? Icons.arrow_downward : Icons.arrow_upward),
      ),
      requestFocusOnTap: false,
      onSelected: (value) {
        if (value != null) {
          ref.read(sortProgramTypeControllerProvider.notifier).set(value);
        }
      },
      dropdownMenuEntries: SortProgramType.values
          .map((sortType) => DropdownMenuEntry<SortProgramType>(
                value: sortType,
                leadingIcon: Icon(sortType.icon),
                label: sortType.getLabel(context),
                enabled: true,
              ))
          .toList(),
      // expandedInsets: EdgeInsets.zero,
    );
  }
}

extension on SortProgramType {
  IconData get icon => switch (this) {
        SortProgramType.dateAdded => Icons.date_range,
        SortProgramType.alphabetic => Icons.abc,
        SortProgramType.programId => Icons.onetwothree,
      };

  String getLabel(BuildContext context) => switch (this) {
        SortProgramType.dateAdded => context.l10n.homeAppBarSortDateAdded,
        SortProgramType.alphabetic => context.l10n.homeAppBarSortAlphabetic,
        SortProgramType.programId => context.l10n.homeAppBarSortProgramId,
      };
}

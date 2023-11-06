import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/typography.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    this.onEnter,
    this.onChanged,
    this.onClear,
  });

  final void Function(String)? onEnter;
  final void Function()? onClear;
  final void Function(String)? onChanged;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController _controller = TextEditingController();

  void _clearText() {
    setState(() {
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 80,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top:24),
              child: Material(
                elevation: 3,
                child: TextFormField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {});
                    widget.onChanged?.call(value);
                  },
                  onFieldSubmitted: widget.onEnter,
                  cursorColor: SerManosColors.secondary_200,
                  decoration: InputDecoration(
                    fillColor: SerManosColors.neutral_0,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide.none),
                    hintText: 'Buscar',
                    hintStyle: const SerManosTypography.subtitle_01(
                        color: SerManosColors.neutral_75),
                    prefixIcon: const Icon(
                      SerManosIcons.search,
                      color: SerManosColors.neutral_75,
                    ),
                    suffixIcon: _controller.text.isEmpty
                        ? null
                        : IconButton(
                      icon: const Icon(
                        SerManosIcons.close,
                        color: SerManosColors.neutral_75,
                      ),
                      onPressed: _clearText,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

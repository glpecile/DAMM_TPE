import 'package:SerManos/widgets/atoms/icons.dart';
import 'package:SerManos/widgets/tokens/colors.dart';
import 'package:SerManos/widgets/tokens/shadows.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      width: 328,
      height: 48,
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextField(
                    cursorColor: SerManosColors.neutral_75,
                    decoration: InputDecoration(
                        fillColor: SerManosColors.neutral_0,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide.none
                        ),
                        hintText: 'Buscar',
                        hintStyle: const TextStyle(
                          color: SerManosColors.neutral_75,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: const Icon(
                          SerManosIcons.search,
                          color: SerManosColors.neutral_75,
                        ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
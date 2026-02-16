import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/item_model.dart';

/// Service to manage items in localStorage
class ItemService {
  static const String _itemsKey = 'items';

  /// Initialize items list in localStorage if it doesn't exist
  static Future<void> initializeItems() async {
    final prefs = await SharedPreferences.getInstance();
    final hasItems = prefs.containsKey(_itemsKey);

    if (!hasItems) {
      // Create empty array for items
      await prefs.setString(_itemsKey, jsonEncode([]));
    }
  }

  /// Get all items from localStorage
  static Future<List<Item>> getAllItems() async {
    await initializeItems();
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = prefs.getString(_itemsKey) ?? '[]';

    try {
      final List<dynamic> decodedList = jsonDecode(itemsJson);
      return decodedList
          .map((item) => Item.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Return empty list if there's a parsing error
      return [];
    }
  }

  /// Add a new item to localStorage
  static Future<Item> addItem({
    required String title,
    required String description,
  }) async {
    final items = await getAllItems();

    final newItem = Item(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      dateCreated: DateTime.now(),
    );

    items.add(newItem);
    await _saveItems(items);
    return newItem;
  }

  /// Update an existing item
  static Future<void> updateItem(Item updatedItem) async {
    final items = await getAllItems();
    final index = items.indexWhere((item) => item.id == updatedItem.id);

    if (index >= 0) {
      items[index] = updatedItem;
      await _saveItems(items);
    }
  }

  /// Delete an item from localStorage
  static Future<void> deleteItem(String id) async {
    final items = await getAllItems();
    items.removeWhere((item) => item.id == id);
    await _saveItems(items);
  }

  /// Clear all items from localStorage
  static Future<void> clearAllItems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_itemsKey, jsonEncode([]));
  }

  /// Save items to localStorage
  static Future<void> _saveItems(List<Item> items) async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = jsonEncode(items.map((item) => item.toJson()).toList());
    await prefs.setString(_itemsKey, itemsJson);
  }

  /// Get item count
  static Future<int> getItemCount() async {
    final items = await getAllItems();
    return items.length;
  }

  /// Search items by title
  static Future<List<Item>> searchItems(String query) async {
    final items = await getAllItems();
    return items
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

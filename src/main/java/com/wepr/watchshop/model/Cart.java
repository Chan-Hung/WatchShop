package com.wepr.watchshop.model;

import java.util.ArrayList;

public class Cart {
    private ArrayList<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public ArrayList<Item> getItems() {
        return items;
    }


    public void addItem(Item item) {
        Long productId = item.getProduct().getId();
        int quantity = item.getQuantity();
        for (Item cartItem : items) {
            if (cartItem.getProduct().getId().equals(productId)) {
                cartItem.setQuantity(quantity);
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(Item item) {
        Long productId = item.getProduct().getId();
        for (int i = 0; i < items.size(); i++) {
            Item lineItem = items.get(i);
            if (lineItem.getProduct().getId().equals(productId)) {
                items.remove(i);
                return;
            }
        }
    }
}

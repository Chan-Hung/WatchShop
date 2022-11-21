package com.wepr.watchshop.model;

import lombok.Getter;

import java.util.ArrayList;

@Getter
public class Cart {
    private final ArrayList<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public int getCount() {
        return items.size();
    }

    public void addItem(Item item) {
        Long code = item.getProduct().getId();
        int quantity = item.getQuantity();
        for (Item cartItem : items) {
            if (cartItem.getProduct().getId().equals(code)) {
                cartItem.setQuantity(quantity);
                cartItem.setAmount(item.getAmount());
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(Item item) {
        Long code = item.getProduct().getId();
        for (int i = 0; i < items.size(); i++) {
            Item lineItem = items.get(i);
            if (lineItem.getProduct().getId().equals(code)) {
                items.remove(i);
                return;
            }
        }
    }
}

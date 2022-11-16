package com.wepr.watchshop.model;

import lombok.Getter;
import lombok.Setter;

import java.text.NumberFormat;

@Getter
@Setter
public class LineItem {
    private Product product;
    private Integer quantity;

    public double getTotal() {
        double total = product.getPrice() * quantity;
        return total;
    }

    public String getTotalCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.getTotal());
    }

}

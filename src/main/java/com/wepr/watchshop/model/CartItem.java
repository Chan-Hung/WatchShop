package com.wepr.watchshop.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="cart_items")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private Integer quantity;


    private Long total;

//    public void addItem(LineItem item) {
//        String code = item.getProduct().getCode();
//        int quantity = item.getQuantity();
//        for (LineItem cartItem : items) {
//            if (cartItem.getProduct().getCode().equals(code)) {
//                cartItem.setQuantity(quantity);
//                return;
//            }
//        }
//        items.add(item);
//    }
//
//    public void removeItem(LineItem item) {
//        String code = item.getProduct().getCode();
//        for (int i = 0; i < items.size(); i++) {
//            LineItem lineItem = items.get(i);
//            if (lineItem.getProduct().getCode().equals(code)) {
//                items.remove(i);
//                return;
//            }
//        }
//    }

}

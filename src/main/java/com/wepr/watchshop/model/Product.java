package com.wepr.watchshop.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "products")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Column(name= "brand", nullable = false)
    private String brand;

    @Column(name = "origin", nullable = false)
    private String origin;

    @Column(name = "machine", nullable = false)
    private String machine;

    @Column(name = "glass", nullable = false)
    private String glass;

    @Column(name = "water_resistant", nullable = false)
    private String waterResistant;

    @Column(name = "diameter", nullable = false)
    private String diameter;

    @Column(name = "price", nullable = false)
    private Long price;

    @Column(name = "image", nullable = false)
    private String image;

    @ManyToOne
    @JoinColumn(name="category_id", referencedColumnName = "id")
    private Category category;
}

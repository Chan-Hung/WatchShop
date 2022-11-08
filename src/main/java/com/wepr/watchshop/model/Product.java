package com.wepr.watchshop.model;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "products")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
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

    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String description;

    @Column(name = "price", nullable = false)
    private Long price;

    @ManyToOne()
    @JoinColumn(name="category_id", referencedColumnName = "id")
    @JsonIgnore
    private Category category;

    @OneToMany(mappedBy = "product",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<ProductImage> productImageList;
}

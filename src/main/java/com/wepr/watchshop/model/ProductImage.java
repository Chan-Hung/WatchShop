package com.wepr.watchshop.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;

@Entity
@Table(name = "product_images")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="image_path")
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String path;

    @Column(name = "is_thumbnail")
    private Boolean isThumbnail;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="product_id", nullable = false)
    @JsonIgnore
    private Product product;
}

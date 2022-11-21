package com.wepr.watchshop.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "addresses")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "home_number")
    private String homeNumber;

    @Column(name = "district")
    private String district;

    @Column(name = "city")
    private String city;

    @OneToOne
    @JoinColumn(name="user_id")
    private User user;
}

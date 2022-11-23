package com.wepr.watchshop.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "username",nullable = false)
    private String userName;

    @Column(name="email",nullable = false)
    private String email;

    @Column(name="password",nullable = false)
    private String password;

    @Column(name = "verification_code", length = 30)
    private String verificationCode;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive;

    @Column(name="is_admin", nullable = false)
    private Boolean isAdmin;
}

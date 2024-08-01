package pl.coderslab.charity.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "users")
@Getter
@Setter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String email;

    @Transient
    private String password;
    @Transient
    private String password2;

    @Column(name = "password")
    private String encryptedPassword;

}

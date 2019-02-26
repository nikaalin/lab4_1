package ru.ifmo.se.lab4.domain;

import javax.persistence.*;

@Entity
@Table(name = "sad_user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    private String login;

    private byte[] password_hash;

    private byte[] salt;


    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getLogin() {
        return login;
    }

    public void setPassword_hash(byte[] password_hash) {
        this.password_hash = password_hash;
    }

    public byte[] getPassword_hash() {
        return password_hash;
    }

    public void setSalt(byte[] salt) {
        this.salt = salt;
    }

    public byte[] getSalt() {
        return salt;
    }
}

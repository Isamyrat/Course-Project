package com.example.demo.model.enumModel;

public enum Roles {
    ROLE_USER("ROLE_USER"),
    ROLE_ADMIN("ROLE_ADMIN"),
    ROLE_MANAGER("ROLE_MANAGER"),
    ROLE_TEACHER("ROLE_TEACHER");

    private final String str;

    Roles(String str) {
        this.str = str;
    }

    @Override
    public String toString() {
        return str;
    }
}

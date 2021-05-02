package com.example.demo.model.enumModel;

public enum Gender {
    Male("Male"),
    Female("Female");
    private final String str;

    Gender(String str) {
        this.str = str;
    }

    @Override
    public String toString() {
        return str;
    }
}

package com.example.demo.model.enumModel;

public enum Language {
    English("English"),
    French("French"),
    Russian("Russian"),
    Turkish("Turkish");

    private final String str;

    Language(String str) {
        this.str = str;
    }

    @Override
    public String toString() {
        return str;
    }
}

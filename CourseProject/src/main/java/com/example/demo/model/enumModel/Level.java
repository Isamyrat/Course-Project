package com.example.demo.model.enumModel;

public enum Level {
    Start("Start"),
    Elementary("Elementary"),
    Pre_Intermediate("Pre_Intermediate"),
    Intermediate("Intermediate"),
    Upper_Intermediate("Upper_Intermediate"),
    Advanced("Advanced");

    private final String str;

    Level(String str) {
        this.str = str;
    }

    @Override
    public String toString() {
        return str;
    }
}

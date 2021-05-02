package com.example.demo.model.enumModel;

public enum Status {
    Use("Used"),
    NotUse("NotUse"),
    Wait("Wait"),
    Start("Start"),
    Finish("Finish"),
    Approved("Approved"),
    Denied("Denied");

    private final String str;

    Status(String str) {
        this.str = str;
    }

    @Override
    public String toString() {
        return str;
    }
}

package com.example.demo.model.enumModel;

public enum Status {
    Use("Use"),
    NotUse("NotUse"),
    Wait("Wait"),
    Started("Started"),
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

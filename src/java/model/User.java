package model;

import java.util.ArrayList;
import java.util.List;

public class User {
    private String username;
    private String password;
    private List<Flower> library;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
        this.library = new ArrayList<>();
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public List<Flower> getLibrary() {
        return library;
    }

    public void addFlowerToLibrary(Flower flower) {
        if (!library.contains(flower)) {
            library.add(flower);
        }
    }
}

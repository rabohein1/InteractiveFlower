package model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataStore {

    private static DataStore instance;
    private final Map<String, User> users;
    private final List<Flower> flowers;

    private DataStore() {
        users = new HashMap<>();
        flowers = new ArrayList<>();

        users.put("student", new User("student", "123"));

        flowers.add(new Flower(
                "1",
                "Red Rose",
                "A timeless symbol of love, with velvety petals.",
                "The rose is a woody perennial flowering plant of the genus Rosa. Red roses are the most popular globally, symbolizing deep romance and love.",
                "Water deeply 1-2 times a week. <br>Provide full sun for at least 6 hours daily. <br>Prune dead branches in late winter.",
                "media/redrose/01.jpeg",
                Arrays.asList(
                        "media/redrose/01.jpeg",
                        "media/redrose/02.png",
                        "media/redrose/03.jpeg"),
                "media/redrose/redrose.mp4", 
                "media/redrose/redrose.wav" 
        ));

        flowers.add(new Flower(
                "2",
                "Sunflower",
                "Bright, golden blooms that follow the sun.",
                "Sunflowers are tall plants with a large flower head. They are known to exhibit heliotropism, turning to face the sun throughout the day.",
                "Plant in well-draining soil. <br>Requires full, direct sunlight. <br>Water regularly while actively growing.",
                "media/sunflower/01.jpg",
                Arrays.asList(
                        "media/sunflower/01.jpg",
                        "media/sunflower/02.jpg",
                        "media/sunflower/03.jpg"),
                "media/sunflower/sunflower.mp4",
                "media/sunflower/sunflower.wav"
        ));

        flowers.add(new Flower(
                "3",
                "Tulip",
                "Cup-shaped spring flowers in vibrant colors.",
                "Tulips are spring-blooming perennials that grow from bulbs. They come in almost every color of the rainbow and symbolize perfect love.",
                "Plant bulbs in fall before ground freezes.<br>Require chilled winter period.<br>Water lightly once planted.",
                "media/tulip/01.jpg",
                Arrays.asList(
                        "media/tulip/01.jpg",
                        "media/tulip/02.jpg",
                        "media/tulip/03.jpg"),
                "media/tulip/tulip.mp4",
                "media/tulip/tulip.wav"
        ));

    }

    public static DataStore getInstance() {
        if (instance == null) {
            instance = new DataStore();
        }
        return instance;
    }

    public User authenticate(String username, String password) {
        User u = users.get(username);
        if (u != null && u.getPassword().equals(password)) {
            return u;
        }
        return null;
    }

    public void register(String username, String password) {
        users.put(username, new User(username, password));
    }

    public User getUser(String username) {
        return users.get(username);
    }

    public List<Flower> getFlowers() {
        return flowers;
    }

    public Flower getFlowerById(String id) {
        for (Flower f : flowers) {
            if (f.getId().equals(id)) {
                return f;
            }
        }
        return null;
    }

    public List<Flower> searchFlowers(String query) {
        if (query == null || query.trim().isEmpty()) {
            return flowers;
        }
        List<Flower> result = new ArrayList<>();
        String q = query.toLowerCase();
        for (Flower f : flowers) {
            if (f.getName().toLowerCase().contains(q)) {
                result.add(f);
            }
        }
        return result;
    }
}

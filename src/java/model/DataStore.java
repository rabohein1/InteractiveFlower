package model;

import java.util.ArrayList;
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

        // Dummy mock users
        users.put("student", new User("student", "123"));
        users.put("designer", new User("designer", "123"));

        // Dummy flowers with Unsplash images, dummy video & audio links for now
        flowers.add(new Flower(
                "1",
                "Red Rose",
                "A timeless symbol of love, with velvety petals.",
                "The rose is a woody perennial flowering plant of the genus Rosa. Red roses are the most popular globally, symbolizing deep romance and love.",
                "Water deeply 1-2 times a week. Provide full sun for at least 6 hours daily. Prune dead branches in late winter.",
                "https://images.unsplash.com/photo-1548839140-29a749e1abc4?w=500&auto=format&fit=crop",
                "https://www.w3schools.com/html/mov_bbb.mp4",
                "https://www.w3schools.com/html/horse.mp3"));

        flowers.add(new Flower(
                "2",
                "Sunflower",
                "Bright, golden blooms that follow the sun.",
                "Sunflowers are tall plants with a large flower head. They are known to exhibit heliotropism, turning to face the sun throughout the day.",
                "Plant in well-draining soil. Requires full, direct sunlight. Water regularly while actively growing.",
                "https://images.unsplash.com/photo-1551893665-f843f600794e?w=500&auto=format&fit=crop",
                "https://www.w3schools.com/html/mov_bbb.mp4",
                "https://www.w3schools.com/html/horse.mp3"));

        flowers.add(new Flower(
                "3",
                "Tulip",
                "Cup-shaped spring flowers in vibrant colors.",
                "Tulips are spring-blooming perennials that grow from bulbs. They come in almost every color of the rainbow and symbolize perfect love.",
                "Plant bulbs in fall before ground freezes. Require chilled winter period. Water lightly once planted.",
                "https://images.unsplash.com/photo-1520698305886-c3cc2712574e?w=500&auto=format&fit=crop",
                "https://www.w3schools.com/html/mov_bbb.mp4",
                "https://www.w3schools.com/html/horse.mp3"));

        flowers.add(new Flower(
                "4",
                "Orchid",
                "Elegant and delicate exotic flowers.",
                "Orchids are a diverse family of flowering plants with often colorful and fragrant blooms. They are epiphytes, living on other plants in nature.",
                "Water once a week, allow to dry out between waterings. Needs bright, indirect light and high humidity.",
                "https://images.unsplash.com/photo-1596440409241-11933ba5af50?w=500&auto=format&fit=crop",
                "https://www.w3schools.com/html/mov_bbb.mp4",
                "https://www.w3schools.com/html/horse.mp3"));
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
            if (f.getId().equals(id))
                return f;
        }
        return null;
    }

    public List<Flower> searchFlowers(String query) {
        if (query == null || query.trim().isEmpty())
            return flowers;
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

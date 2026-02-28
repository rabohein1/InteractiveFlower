package model;

import java.util.List;

public class Flower {
    private String id;
    private String name;
    private String shortDescription;
    private String description;
    private String careInstructions;
    private String imageUrl;
    private List<String> galleryImages;
    private String videoUrl;
    private String audioUrl;

    public Flower(String id, String name, String shortDescription, String description, String careInstructions,
            String imageUrl, List<String> galleryImages, String videoUrl, String audioUrl) {
        this.id = id;
        this.name = name;
        this.shortDescription = shortDescription;
        this.description = description;
        this.careInstructions = careInstructions;
        this.imageUrl = imageUrl;
        this.galleryImages = galleryImages;
        this.videoUrl = videoUrl;
        this.audioUrl = audioUrl;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public String getDescription() {
        return description;
    }

    public String getCareInstructions() {
        return careInstructions;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public List<String> getGalleryImages() {
        return galleryImages;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public String getAudioUrl() {
        return audioUrl;
    }
}

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="model.Flower" %>
        <%@ page import="java.util.List" %>
            <% Flower flower=(Flower) request.getAttribute("flower"); if (flower==null) {
                response.sendRedirect("catalog"); return; } %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>
                        <%= flower.getName() %> - InteractiveFlowers
                    </title>
                    <link rel="stylesheet" href="css/styles.css">
                    <script src="js/main.js" defer></script>
                </head>

                <body>
                    <header>
                        <div class="logo">
                            <svg class="logo-icon" viewBox="0 0 24 24" fill="var(--accent)"
                                xmlns="http://www.w3.org/2000/svg">
                                <!-- A more floral SVG logo -->
                                <path
                                    d="M12 2c-4.97 0-9 4.03-9 9 0 4.17 2.84 7.67 6.69 8.69L12 22l2.31-2.31C18.16 18.67 21 15.17 21 11c0-4.97-4.03-9-9-9zm0 2c3.86 0 7 3.14 7 7 0 2.89-1.76 5.37-4.26 6.44L12 20.14l-2.74-2.7C6.76 16.37 5 13.89 5 11c0-3.86 3.14-7 7-7zm0 3c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3zm0 2c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1z" />
                            </svg>
                            <a href="catalog" style="color: inherit;">InteractiveFlowers</a>
                        </div>
                        <div class="nav-links">
                            <a href="catalog" class="nav-item">Flowers</a>
                            <a href="library" class="nav-item">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="2" style="vertical-align: middle; margin-right: 4px;">
                                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20" />
                                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z" />
                                </svg>
                                My Library (<%= request.getAttribute("libraryCount") !=null ?
                                    request.getAttribute("libraryCount") : 0 %>)
                            </a>
                            <a href="logout" class="nav-item" style="color: #ff6b6b">Logout</a>
                        </div>
                    </header>

                    <main class="detail-container">

                        <div class="gallery-section">
                            <div class="main-img-container">
                                <img id="main-gallery-img"
                                    src="<%= flower.getGalleryImages() != null && !flower.getGalleryImages().isEmpty() ? flower.getGalleryImages().get(0) : flower.getImageUrl() %>"
                                    alt="Main flower" />
                                <div class="gallery-overlay-hint">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M15 3h6v6M9 21H3v-6M21 3l-7 7M3 21l7-7" />
                                    </svg>
                                </div>
                            </div>
                            <div class="thumbnail-row">
                                <% if(flower.getGalleryImages() !=null) { for(String imgUrl : flower.getGalleryImages())
                                    { %>
                                    <img src="<%= imgUrl %>" alt="Thumbnail" class="thumb-img" />
                                    <% } } %>
                            </div>
                        </div>

                        <div class="media-section">
                            <div class="custom-video-wrapper">
                                <video id="custom-video" src="<%= flower.getVideoUrl() %>" muted loop></video>
                                <div class="custom-controls">
                                    <button id="play-pause-btn" class="ctrl-btn">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
                                            <path d="M8 5v14l11-7z" />
                                        </svg>
                                    </button>
                                    <span
                                        style="color: white; font-family: 'Inter', sans-serif; font-size: 0.9rem;">Educational
                                        Video</span>
                                </div>
                            </div>

                            <div class="info-section">
                                <h1 class="detail-title">
                                    <%= flower.getName() %>
                                </h1>
                                <p class="detail-desc">
                                    <%= flower.getDescription() %>
                                </p>

                                <span class="audio-label">Narrative Guide</span>
                                <div class="custom-audio-wrapper">
                                    <audio id="custom-audio" src="<%= flower.getAudioUrl() %>"></audio>
                                    <button id="audio-play-btn" class="ctrl-btn audio-btn">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
                                            <path d="M8 5v14l11-7z" />
                                        </svg>
                                    </button>
                                    <span class="audio-title">
                                        <%= flower.getName() %> Overview
                                    </span>
                                </div>

                                <form action="detail" method="post" style="margin-top: 1rem;">
                                    <input type="hidden" name="id" value="<%= flower.getId() %>" />
                                    <button type="submit" class="action-btn">
                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none"
                                            stroke="currentColor" stroke-width="2">
                                            <line x1="12" y1="5" x2="12" y2="19"></line>
                                            <line x1="5" y1="12" x2="19" y2="12"></line>
                                        </svg>
                                        Add to Library
                                    </button>
                                </form>
                            </div>
                        </div>

                        <div class="instructions-card">
                            <h3>Care Instructions</h3>
                            <p>
                                <%= flower.getCareInstructions() %>
                            </p>
                        </div>
                    </main>

                    <!-- Lightbox Modal -->
                    <div id="lightbox-modal" class="modal">
                        <span class="close-modal">&times;</span>
                        <button id="prev-btn" class="modal-nav-btn">&#10094;</button>
                        <div class="modal-content-wrapper">
                            <img class="modal-content" id="modal-img">
                        </div>
                        <button id="next-btn" class="modal-nav-btn">&#10095;</button>
                    </div>
                </body>

                </html>
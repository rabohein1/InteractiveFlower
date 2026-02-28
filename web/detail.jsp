<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="model.Flower" %>
        <% Flower flower=(Flower) request.getAttribute("flower"); if (flower==null) { response.sendRedirect("catalog");
            return; } %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>
                    <%= flower.getName() %> - InteractiveFlowers
                </title>
                <link rel="stylesheet" href="css/styles.css">
            </head>

            <body>
                <header>
                    <div class="logo">
                        <svg class="logo-icon" viewBox="0 0 24 24" fill="var(--accent)"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M12 2C8.69 2 6 4.69 6 8q0 .84.22 1.62C4.35 10.36 3 12.04 3 14c0 2.21 1.79 4 4 4h14c2.21 0 4-1.79 4-4 0-1.96-1.35-3.64-3.22-4.38.22-.78.22-1.62.22-1.62 0-3.31-2.69-6-6-6s-6 2.69-6 6z" />
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
                    <div class="media-section">
                        <div class="video-container">
                            <video controls autoplay muted loop>
                                <source src="<%= flower.getVideoUrl() %>" type="video/mp4">
                                Your browser does not support the video tag.
                            </video>
                        </div>

                        <div class="info-section">
                            <h1 class="detail-title">
                                <%= flower.getName() %>
                            </h1>
                            <p class="detail-desc">
                                <%= flower.getDescription() %>
                            </p>

                            <h3 style="color: #fff; margin-bottom: 10px;">General Guide</h3>
                            <div class="audio-player">
                                <audio controls>
                                    <source src="<%= flower.getAudioUrl() %>" type="audio/mpeg">
                                    Your browser does not support the audio element.
                                </audio>
                            </div>

                            <form action="detail" method="post" style="margin-top: auto;">
                                <input type="hidden" name="id" value="<%= flower.getId() %>" />
                                <button type="submit" class="action-btn">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                        stroke-width="2">
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
            </body>

            </html>
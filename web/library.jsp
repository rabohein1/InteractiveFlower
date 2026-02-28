<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="model.Flower" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>My Library - InteractiveFlowers</title>
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
                        <a href="library" class="nav-item active">
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

                <main class="container" style="padding-top: 4rem;">
                    <h2 style="font-size: 2.5rem; text-align: center; margin-bottom: 3rem;">My Flower Library</h2>

                    <div class="grid">
                        <% List<Flower> library = (List<Flower>) request.getAttribute("library");
                                if (library != null && !library.isEmpty()) {
                                for (Flower f : library) {
                                %>
                                <div class="card" onclick="window.location.href='detail?id=<%= f.getId() %>'">
                                    <div class="card-img-container">
                                        <img src="<%= f.getImageUrl() %>" alt="<%= f.getName() %>" class="card-img" />
                                    </div>
                                    <div class="card-content">
                                        <h3 class="card-title">
                                            <%= f.getName() %>
                                        </h3>
                                        <p class="card-subtitle">
                                            <%= f.getShortDescription() %>
                                        </p>
                                    </div>
                                </div>
                                <% } } else { %>
                                    <div class="empty-state" style="grid-column: 1 / -1;">
                                        <h3>Your library is empty.</h3>
                                        <p>Browse the catalog and add your favorite flowers.</p>
                                        <br />
                                        <a href="catalog" class="action-btn"
                                            style="display:inline-block; margin-top:1rem;">Browse Flowers</a>
                                    </div>
                                    <% } %>
                    </div>
                </main>
            </body>

            </html>
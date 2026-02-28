<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="model.Flower" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>InteractiveFlowers - Catalog</title>
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
                        InteractiveFlowers
                    </div>
                    <div class="nav-links">
                        <a href="catalog" class="nav-item active">Flowers</a>
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

                <section class="hero">
                    <h1>Discover Nature's Beauty</h1>
                    <p>Explore our interactive multimedia guide to the world's most beautiful and fascinating flowers.
                    </p>
                </section>

                <div class="search-container">
                    <form action="catalog" method="get" class="search-form">
                        <input type="text" name="query" placeholder="Search flowers by name..." class="search-input"
                            value="<%= request.getParameter(" query") !=null ? request.getParameter("query") : "" %>">
                        <button type="submit" class="search-btn">Search</button>
                    </form>
                </div>

                <main class="container">
                    <div class="grid">
                        <% List<Flower> flowers = (List<Flower>) request.getAttribute("flowers");
                                if (flowers != null && !flowers.isEmpty()) {
                                for (Flower f : flowers) {
                                %>
                                <div class="card" onclick="window.location.href='detail?id=<%= f.getId() %>'">
                                    <img src="<%= f.getImageUrl() %>" alt="<%= f.getName() %>" class="card-img" />
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
                                        <h3>No flowers found.</h3>
                                        <p>Try searching for a different name.</p>
                                    </div>
                                    <% } %>
                    </div>
                </main>
            </body>

            </html>
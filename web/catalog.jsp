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
                                d="M12 2c-4.97 0-9 4.03-9 9 0 4.17 2.84 7.67 6.69 8.69L12 22l2.31-2.31C18.16 18.67 21 15.17 21 11c0-4.97-4.03-9-9-9zm0 2c3.86 0 7 3.14 7 7 0 2.89-1.76 5.37-4.26 6.44L12 20.14l-2.74-2.7C6.76 16.37 5 13.89 5 11c0-3.86 3.14-7 7-7zm0 3c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3zm0 2c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1z" />
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
                    <h1>Discover Nature's <span>Beauty</span></h1>
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
                                        <h3>No flowers found.</h3>
                                        <p>Try searching for a different name.</p>
                                    </div>
                                    <% } %>
                    </div>
                </main>
            </body>

            </html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - InteractiveFlowers</title>
        <link rel="stylesheet" href="css/styles.css">
    </head>

    <body>
        <header>
            <div class="logo">
                <svg class="logo-icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M12 2C8.69 2 6 4.69 6 8q0 .84.22 1.62C4.35 10.36 3 12.04 3 14c0 2.21 1.79 4 4 4h14c2.21 0 4-1.79 4-4 0-1.96-1.35-3.64-3.22-4.38.22-.78.22-1.62.22-1.62 0-3.31-2.69-6-6-6s-6 2.69-6 6zM12 4c2.21 0 4 1.79 4 4v1h2c1.1 0 2 .9 2 2s-.9 2-2 2H6c-1.1 0-2-.9-2-2s.9-2 2-2h2V8c0-2.21 1.79-4 4-4zM8 12h8v2H8v-2zM8 16h8v2H8v-2z" />
                </svg>
                InteractiveFlowers
            </div>
        </header>

        <div class="auth-container">
            <div class="auth-box">
                <h2>Welcome Back</h2>
                <% String error=(String) request.getAttribute("error"); if(error !=null && !error.isEmpty()){ %>
                    <div class="error-msg">
                        <%= error %>
                    </div>
                    <% } %>

                        <form action="login" method="post">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" id="username" name="username" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password" class="form-control" required />
                            </div>
                            <!-- Determine if we are logging in or registering based on checking the register button -->
                            <button type="submit" name="action" value="login" class="auth-btn">Log In</button>
                            <button type="submit" name="action" value="register" class="auth-btn auth-btn-secondary"
                                style="margin-top: 1rem;">Create
                                Account</button>
                        </form>
            </div>
        </div>
    </body>

    </html>
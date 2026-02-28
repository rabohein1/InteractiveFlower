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
                <svg class="logo-icon" viewBox="0 0 24 24" fill="var(--accent)" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M12 2c-4.97 0-9 4.03-9 9 0 4.17 2.84 7.67 6.69 8.69L12 22l2.31-2.31C18.16 18.67 21 15.17 21 11c0-4.97-4.03-9-9-9zm0 2c3.86 0 7 3.14 7 7 0 2.89-1.76 5.37-4.26 6.44L12 20.14l-2.74-2.7C6.76 16.37 5 13.89 5 11c0-3.86 3.14-7 7-7zm0 3c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3zm0 2c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1z" />
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
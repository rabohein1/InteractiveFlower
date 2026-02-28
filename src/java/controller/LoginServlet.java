package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.DataStore;
import model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("error", "");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");

        DataStore ds = DataStore.getInstance();

        if ("register".equals(action)) {
            if (uname != null && !uname.isEmpty() && pass != null && !pass.isEmpty()) {
                if (ds.getUser(uname) == null) {
                    ds.register(uname, pass);
                    request.getSession().setAttribute("user", uname);
                    response.sendRedirect("catalog");
                } else {
                    request.setAttribute("error", "Username already exists.");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Username and password cannot be empty.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else {
            User u = ds.authenticate(uname, pass);
            if (u != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", u.getUsername());
                response.sendRedirect("catalog");
            } else {
                request.setAttribute("error", "Invalid username or password.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }
    }
}

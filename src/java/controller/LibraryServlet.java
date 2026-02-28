package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.DataStore;
import model.Flower;
import model.User;

@WebServlet("/library")
public class LibraryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        String username = (String) session.getAttribute("user");
        User user = DataStore.getInstance().getUser(username);

        if (user != null) {
            List<Flower> library = user.getLibrary();
            request.setAttribute("library", library);
            request.setAttribute("libraryCount", library.size());
            request.getRequestDispatcher("/library.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }
}

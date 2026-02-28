package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.DataStore;
import model.Flower;
import model.User;

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        String id = request.getParameter("id");
        Flower flower = DataStore.getInstance().getFlowerById(id);

        if (flower != null) {
            request.setAttribute("flower", flower);

            String username = (String) session.getAttribute("user");
            User user = DataStore.getInstance().getUser(username);
            int libraryCount = user != null ? user.getLibrary().size() : 0;
            boolean isSaved = user != null && user.getLibrary().contains(flower);

            request.setAttribute("libraryCount", libraryCount);
            request.setAttribute("isSaved", isSaved);

            request.getRequestDispatcher("/detail.jsp").forward(request, response);
        } else {
            response.sendRedirect("catalog");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        String id = request.getParameter("id");
        Flower flower = DataStore.getInstance().getFlowerById(id);

        if (flower != null) {
            String username = (String) session.getAttribute("user");
            User user = DataStore.getInstance().getUser(username);
            if (user != null) {
                String action = request.getParameter("action");
                if ("remove".equals(action)) {
                    user.removeFlowerFromLibrary(flower);
                } else {
                    user.addFlowerToLibrary(flower);
                }
            }
            response.sendRedirect("library");
        } else {
            response.sendRedirect("catalog");
        }
    }
}

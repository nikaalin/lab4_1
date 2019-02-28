package ru.ifmo.se.lab4.servlets;

import ru.ifmo.se.lab4.ejb.AuthBean;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(
        name = "AuthServlet",
        urlPatterns = {"/login"}
)
public class AuthServlet extends HttpServlet {
    @EJB
    AuthBean authBean;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            String login = request.getParameter("login");
            String password = request.getParameter("password");

            Boolean answer = authBean.userExist(login, password);


            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(answer.toString());





        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

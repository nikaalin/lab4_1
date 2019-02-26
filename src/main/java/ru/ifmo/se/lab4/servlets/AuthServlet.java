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
        response.setContentType("application/json");//Отправляем от сервера данные в JSON -формате
        response.setCharacterEncoding("utf-8");//Кодировка отправляемых данных
        try  {
//            PrintWriter out = response.getWriter();
//            JSONObject jsonEnt = new JSONObject();
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            authBean.userExist(login, password.getBytes(), new byte[10]);
            request.getServletContext().getRequestDispatcher("/area1.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

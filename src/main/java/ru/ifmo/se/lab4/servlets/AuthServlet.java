package ru.ifmo.se.lab4.servlets;

import org.json.JSONObject;
import ru.ifmo.se.lab4.ejb.AuthBean;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

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

            JSONObject jsonEnt = new JSONObject();
           // jsonEnt.append("answer", authBean.userExist("1","1".getBytes(), new byte[10]));

//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write(jsonEnt.toString());

//            if(authBean.userExist(login, password.getBytes(), new byte[10])){
                request.getServletContext().getRequestDispatcher("/area1.jsp").forward(request, response);
//            }else{
//                request.getServletContext().getRequestDispatcher("/auth_error1.jsp").forward(request, response);
//            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

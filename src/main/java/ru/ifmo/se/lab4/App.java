package ru.ifmo.se.lab4;

import ru.ifmo.se.lab4.ejb.AuthBean;

import javax.annotation.sql.DataSourceDefinition;
import javax.ejb.EJB;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Request;

@ApplicationPath("/api")
@Path("/login")
@DataSourceDefinition(name="java:app/PostgresDatasource",
        className = "org.postgresql.ds.PGConnectionPoolDataSource",
        portNumber = 1234,
        user = "s244702",
        password = "hnp585"
)
public class App {

    @Context
    Request request;

    @EJB
    AuthBean authBean;

    @POST
    public boolean authorization(@QueryParam("login")String login, @QueryParam("password")String password) {
        return authBean.userExist(login, password.getBytes(), new byte[10]);
    }


}

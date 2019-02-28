package ru.ifmo.se.lab4;

import ru.ifmo.se.lab4.ejb.AuthBean;

import javax.annotation.sql.DataSourceDefinition;
import javax.ejb.EJB;
import javax.ejb.Singleton;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Request;

//@Singleton
//@Path("/login")
@DataSourceDefinition(name="java:app/PostgresDatasource",
        className = "org.postgresql.ds.PGConnectionPoolDataSource",
        databaseName = "studs",
        portNumber = 1234,
        user = "s244702",
        password = "hnp585"
)
public class App {


}

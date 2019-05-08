package model;

import java.sql.*;

//--- To connect to a database Download the https://dev.mysql.com/downloads/connector/j/5.1.html library
//and copy the jar archive in  web-inf/lib folder

public class Connect {

	// ---- variables ----- //
	protected String driver = "com.mysql.jdbc.Driver";
	protected String url = "jdbc:mysql://10.22.72.35:3306/proyecto_final";
	protected String userBbdd = "root";
	protected String passBbdd = "";
	protected Connection con = null;

	public Connect() {
      	super();
      	{
            	try {
                  	// ----- connecting procedure ----//
                  	Class.forName(driver);
                  	con = DriverManager.getConnection(url, userBbdd, passBbdd);

            	} catch (Exception ex) {
                  	con = null;
            	}
      	}
	}

	public Connection getConnection()
	/*
	 * this function return the connection itself
	 */
	{
      	return this.con;
	}

	// ---------------------------------------------
	public void disconnect() {
      	this.con = null;
	}
}

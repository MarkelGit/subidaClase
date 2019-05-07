package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Categoria_productoModel extends Categoria_productoClass{
	
	private ArrayList<Categoria_productoClass> list = new ArrayList<Categoria_productoClass>();

	// ---- CONSTRUCTOR----

	public Categoria_productoModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Categoria_productoClass> getList() {
		return list;
	}

	// ---- methods
	public void loadData() throws SQLException 
	{
		Statement st = this.con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM categoria_producto");
		
		while (rs.next()) // reads the table line by line
		{ 
			Categoria_productoModel newC = new Categoria_productoModel();
			newC.setIdCategoria(Integer.parseInt(rs.getString(1)));
			newC.setIdProducto(Integer.parseInt(rs.getString(2)));
			this.list.add(newC);
		}
		this.con.close();
	}

}

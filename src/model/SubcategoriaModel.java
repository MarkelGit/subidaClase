package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class SubcategoriaModel extends SubcategoriaClass{
	
	private ArrayList<SubcategoriaClass> list = new ArrayList<SubcategoriaClass>();

	// ---- CONSTRUCTOR----

	public SubcategoriaModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArrayList<SubcategoriaClass> getList() {
		return list;
	}

	// ---- methods
	public void loadData() throws SQLException 
	{
		
		this.createConnection();
		
		Statement st = this.con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM categoria");
		
		while (rs.next()) // reads the table line by line
		{ 
			SubcategoriaModel newC = new SubcategoriaModel();
			newC.setIdSubcategoria(Integer.parseInt(rs.getString(1)));
			newC.setNombre_categoria(rs.getString(2));
			newC.setIdCategoria(Integer.parseInt(rs.getString(3)));
			this.list.add(newC);
		}
		this.con.close();
	}

}

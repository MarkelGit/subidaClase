package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CategoriaModel extends CategoriaClass{
	
	private ArrayList<CategoriaModel> list = new ArrayList<CategoriaModel>();

	// ---- CONSTRUCTOR----

	public CategoriaModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArrayList<CategoriaModel> getList() {
		return list;
	}

	// ---- methods
	public void loadData() throws SQLException 
	{
		
		this.createConnection();
		
		Statement st = this.con.createStatement();
		ResultSet rs = st.executeQuery(" CALL allCategorias ");
		
		while (rs.next()) // reads the table line by line
		{ 
			CategoriaModel newC = new CategoriaModel();
			newC.setIdCategoria(Integer.parseInt(rs.getString(1)));
			newC.setNombre_categoria(rs.getString(2));
			this.list.add(newC);
		}
		this.con.close();
	}

}

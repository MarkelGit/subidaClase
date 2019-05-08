package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class LineaModel extends LineaClass{
	
	private ArrayList<LineaClass> list = new ArrayList<LineaClass>();

	// ---- CONSTRUCTOR----

	public LineaModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArrayList<LineaClass> getList() {
		return list;
	}

	// ---- methods
	public void loadData() throws SQLException 
	{
		
		this.createConnection();
		
		Statement st = this.con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM linea");
		
		while (rs.next()) // reads the table line by line
		{ 
			LineaModel newC = new LineaModel();
			newC.setIdLinea(Integer.parseInt(rs.getString(1)));
			newC.setNombre_producto(rs.getString(2));
			newC.setCantidad(Integer.parseInt(rs.getString(3)));
			newC.setPrecio_linea(Double.parseDouble(rs.getString(4)));
			newC.setIdProducto(Integer.parseInt(rs.getString(5)));
			newC.setIdFactura(Integer.parseInt(rs.getString(6)));
			this.list.add(newC);
		}
		this.con.close();
	}

}

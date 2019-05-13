package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ProductoModel extends ProductoClass{
	
	private ArrayList<ProductoModel> list = new ArrayList<ProductoModel>();

	// ---- CONSTRUCTOR----

	public ProductoModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArrayList<ProductoModel> getList() {
		return list;
	}

	// ---- methods
	public void loadData() throws SQLException 
	{
		
		this.createConnection();
		
		Statement st = this.con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM producto");
		
		while (rs.next()) // reads the table line by line
		{ 
			ProductoModel newC = new ProductoModel();
			newC.setIdProducto(Integer.parseInt(rs.getString("id_producto")));
			newC.setIdCategoria(Integer.parseInt(rs.getString("id_categoria")));
			newC.setNombre_producto(rs.getString("nombre_producto"));
			newC.setPrecio_producto(Double.parseDouble(rs.getString("precio_producto")));
			newC.setDescripcion(rs.getString("descripcion"));
			newC.setStock(Integer.parseInt(rs.getString("stock")));
			newC.setImagen(rs.getString("imagen"));
			this.list.add(newC);
		}
		this.con.close();
	}

}

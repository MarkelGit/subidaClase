package model;

public class SubcategoriaClass extends Connect{
	
	protected int idSubcategoria;
	protected String nombre_categoria;
	protected int idCategoria;
	
	public SubcategoriaClass() {
		super();
		// TODO Auto-generated constructor stub
	}



	public int getIdSubcategoria() {
		return idSubcategoria;
	}



	public void setIdSubcategoria(int idSubcategoria) {
		this.idSubcategoria = idSubcategoria;
	}



	public int getIdCategoria() {
		return idCategoria;
	}



	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}



	public String getNombre_categoria() {
		return nombre_categoria;
	}

	public void setNombre_categoria(String nombre_categoria) {
		this.nombre_categoria = nombre_categoria;
	}

}

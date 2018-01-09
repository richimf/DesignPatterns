package com.PatronDecorador;

/**
 * (Decorator Concreto)
 * clase papas, siendo esta un adicional, cuenta 
 * con una descripcion y un precio
 * @author chenao
 *
 */
public class Papas extends Decorador{

	private Combo combo;
	
	public Papas(Combo combo) {
		this.combo=combo;	
	}
	
	@Override
	public String getDescripcion() {
		return combo.getDescripcion()+" , Porcion de Papas agregado";
	}

	@Override
	public int valor() {
		return 15+combo.valor();
	}

}
package com.PatronDecorador;

/**
 * (Decorator Concreto)
 * clase queso, siendo esta un adicional, 
 * cuenta con una descripcion y un precio
 * @author chenao
 *
 */
public class Queso extends Decorador{

	private Combo combo;
	
	public Queso(Combo combo)
	{
		this.combo=combo;	
	}
	
	@Override
	public String getDescripcion() {
		return combo.getDescripcion()+" , Porcion de Queso agregado";
	}

	@Override
	public int valor() {
		return 10+combo.valor();
	}

}
/*
El Modelo le avisa al Controlador sobre cualquier cambio, y luego, el Controlador le dice a la Vista que datos mostrar.
 Model <---> Controller <---> View
*/

import UIKit
// En el patron de diseño MVC, el Controlador: Es el intermediario entre el Modelo y la Vista.
// Este accede a los datos desde el Modelo y los muestra en las vistas, escucha a eventos y manipula los datos necesarios
/**
 Esta clase seria tu Controlador.
 */
class ViewController: UIViewController {

	@IBOutlet var dataTable: UITableView!
	@IBOutlet var toolbar: UIToolbar!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
        
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}



/**
    Singleton...
    Este patron de diseño se asegura que existirá solo una instancia de la clase y que ademas, habrá un acceso global para dicha clase.
    Por ejemplo, guardar la sesion de usuario, esta se realiza con una sola instancia de clase, y toda la app deberia poder tener acceso a ella.
 
    Apple por su parte usa este patron en... 
    NSUserDefaults.standardUserDefaults(), UIApplication.sharedApplication(), UIScreen.mainScreen(), NSFileManager.defaultManager()
    todas estas instancias devuelven un objeto Singleton.
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
                
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

}


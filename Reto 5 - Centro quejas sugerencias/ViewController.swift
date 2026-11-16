import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    var visorWeb: WKWebView!
    
    override func loadView() {
        // Configuramos el WebView antes de cargar la pantalla
        let configuracionWeb = WKWebViewConfiguration()
        visorWeb = WKWebView(frame: .zero, configuration: configuracionWeb)
        
        // Asignamos el delegado para permitir alertas de JavaScript (equivalente al WebChromeClient en Android)
        visorWeb.uiDelegate = self
        view = visorWeb
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // IMPORTANTE: URL pública para que el simulador web pueda cargar sin dar error de IP local
        if let urlApp = URL(string: "https://uveg.edu.mx") {
            let peticion = URLRequest(url: urlApp)
            visorWeb.load(peticion)
        }
    }
    
    // Esta función permite que los alert() y confirm() de tu JavaScript aparezcan nativamente en iOS
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alerta = UIAlertController(title: "Buzón de sugerencias", message: message, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            completionHandler()
        }))
        self.present(alerta, animated: true, completion: nil)
    }
}
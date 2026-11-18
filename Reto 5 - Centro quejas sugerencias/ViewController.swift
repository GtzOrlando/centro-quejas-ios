import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    var visorWeb: WKWebView!
    
    override func loadView() {
        let configuracionWeb = WKWebViewConfiguration()
        visorWeb = WKWebView(frame: .zero, configuration: configuracionWeb)
        visorWeb.uiDelegate = self
        view = visorWeb
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // PEGA AQUÍ TU URL DE LOCALTUNNEL + TU CARPETA
        if let urlApp = URL(string: "https://ten-files-bet.loca.lt/tuapp/") {
            let peticion = URLRequest(url: urlApp)
            visorWeb.load(peticion)
        }
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alerta = UIAlertController(title: "Buzón de sugerencias", message: message, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            completionHandler()
        }))
        self.present(alerta, animated: true, completion: nil)
    }
}
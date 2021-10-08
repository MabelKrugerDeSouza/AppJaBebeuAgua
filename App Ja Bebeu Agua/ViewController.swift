//
//  ViewController.swift
//  App Ja Bebeu Agua
//
//  Created by Mabel Kruger de Souza on 07/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uilQntAgua: UILabel!
    @IBOutlet weak var bntIncrementar: UIButton!
    @IBOutlet weak var btnDiminuir: UIButton!
    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var uiLabelMeta: UILabel!
    @IBOutlet weak var TxtDigitarMeta: UITextField!
    
    var contatorCopo = 0
    let unidadeExposta: Unidade = .litro
    
    var faltaParaMeta: Int{
        return 20 - contatorCopo
    }
    
    //Aqui ele esta pegando o q o usuario digitou na text field e colocando como meta
    var metaDeAgua: Int {
        
        // Aqui estou usando um ternario e vendo se tem algo no campo de digitar meta, caso nao tiver ele apenas apenas vai colocar um string vazia
        let pegarOqueoUsuarioDigitou : String = TxtDigitarMeta.text ?? ""
        
        //Nessa parte ele ta transformando a meta em Int, veja que se o usuario nao digitou nada, o programa vai colocar uma meta automatica pra ele
        let transformarEmInteiro = Int(pegarOqueoUsuarioDigitou) ?? 20
        return transformarEmInteiro
    }
    
    //Aqui estao verificando se a meta digirada na variavel computada está comprida ou nao
    var metaEstaComprida: Bool = false{
        didSet{
            // se estiver ele vai mudar a cor do backgound para verde
            if metaEstaComprida{
                view.backgroundColor = UIColor.green
            }else{
                // se nao constinua como branco, vale tambem caso o usuario excluir um copo
                view.backgroundColor = UIColor.white
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        uiImage.image = UIImage(named: "bebe-agua-ahora" )
        
        // e aqui fazendo referencia a ela e pegando a informacao
        TxtDigitarMeta.addTarget(self, action: #selector(atualizaMeta), for: .editingChanged)
    }
    
    //Aqui está validando se a label meta tem algo
     @objc func atualizaMeta(){
         guard let txtUsuario = TxtDigitarMeta.text else{
             return
         }
        uiLabelMeta.text = "Meta: " + txtUsuario
    }
    
    //Essa parte mostra para atualizar os copos que estou bebendo
    func atualizarLabel( ){
        
        // aqui estamos fazendo referenia ao um enum sobre a mensagem de quantidade de copos que o usuario bebeu
        let mensagem: String = unidadeExposta.formarMensagem(copos: contatorCopo)
        uilQntAgua.text = mensagem // aqui vai mostrar na label
        
        print(String(faltaParaMeta) + Unidade.copo.sigla) // aqui vai mostrar no console, so pra verificar se realmente foi algo
    }
    
    //Aqui a acao que o botao estao fazendo ao ser clicado pelo usuario
    @IBAction func AcrescentarAgua(_ sender: UIButton) {
        
        //automaticamente o contator vai somando a quantidade de copo
        contatorCopo += 1
        
        //Aqui esta verificando se a meta ja esta sendo comprida
        metaEstaComprida = metaDeAgua <= contatorCopo
        
        //Atualizando a label
        atualizarLabel()
    }
    
    //Aqui a mesma coisa que a funcao de cima, so que dominuindo
    @IBAction func DiminuirAgua(_ sender: UIButton) {
        if contatorCopo > 0 {
            contatorCopo -= 1
            metaEstaComprida = metaDeAgua <= contatorCopo
            atualizarLabel()
        }
    }
    
}


//
//  ElementosGlobais.swift
//  DesafioGravador
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import Foundation

var caminhoParaSandBox = NSHomeDirectory()
var pathDocuments = (caminhoParaSandBox as NSString).appendingPathComponent("Documents")
var pathArquivo = (pathDocuments as NSString).appendingPathComponent("gravacoes.plist") // local onde serão armazaendas as gravacoes



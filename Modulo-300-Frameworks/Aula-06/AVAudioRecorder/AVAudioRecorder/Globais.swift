//
//  Globais.swift
//  AVAudioRecorder
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Ken Aramaki. All rights reserved.
//

import Foundation

// Criando o caminho até o documento salvos

var caminhoParaSandBox = NSHomeDirectory()
var pathDocuments = caminhoParaSandBox.appendingPathComponent(string: "Documents")
var pathArquivo = pathDocuments.appendingPathComponent(string: "gravacao.caf")



//
//  MoyaLoggingPlugin.swift
//  CleanArchitecture
//
//  Created by Chaekyeong Lee on 3/3/25.
//

import Foundation
import Moya

final class MoyaLoggingPlugin: PluginType {
    // Request를 보낼 때 호출
    func willSend(_ request: RequestType, target: TargetType) {
        guard let httpRequest = request.request else {
            print("🚨 --> 유효하지 않은 요청")
            return
        }
        let url = httpRequest.description
        let method = httpRequest.httpMethod ?? "UNKNOWN METHOD"
        
        var log = "\n🌍 [REQUEST] -----------------------------------\n"
        log.append("📌 [\(method)] \(url)\n")
        log.append("🔗 API: \(target)\n")
        
        if let headers = httpRequest.allHTTPHeaderFields, !headers.isEmpty {
            log.append("📝 Headers: \n")
            headers.forEach { log.append("   ◦ \($0.key): \($0.value)\n") }
        }
        
        if let body = httpRequest.httpBody, let bodyString = String(bytes: body, encoding: .utf8) {
            log.append("📦 Body: \n\(bodyString)\n")
        }
        
        log.append("---------------------------------------------- ✅\n")
        print(log)
    }
    
    // Response가 왔을 때
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case let .success(response):
            onSuceed(response, target: target, isFromError: false)
        case let .failure(error):
            onFail(error, target: target)
        }
    }
    
    func onSuceed(_ response: Response, target: TargetType, isFromError: Bool) {
        let url = response.request?.url?.absoluteString ?? "nil"
        let statusCode = response.statusCode
        
        var log = "\n✅ [SUCCESS] ----------------------------------\n"
        log.append("🔗 URL: \(url)\n")
        log.append("📌 Status Code: [\(statusCode)]\n")
        log.append("🔗 API: \(target)\n")
        
        response.response?.allHeaderFields.forEach {
            log.append("📝 Header: \n   ◦ \($0): \($1)\n")
        }
        
        if let responseString = String(bytes: response.data, encoding: .utf8) {
            log.append("📦 Response Body: \n\(responseString)\n")
        }
        
        log.append("---------------------------------------------- 🎯\n")
        print(log)
    }
    
    func onFail(_ error: MoyaError, target: TargetType) {
        if let response = error.response {
            onSuceed(response, target: target, isFromError: true)
            return
        }
        
        var log = "\n❌ [ERROR] -----------------------------------\n"
        log.append("🚨 Error Code: \(error.errorCode)\n")
        log.append("🔗 API: \(target)\n")
        log.append("⚠️ Reason: \(error.failureReason ?? error.errorDescription ?? "Unknown error")\n")
        log.append("---------------------------------------------- ❌\n")
        print(log)
    }
}


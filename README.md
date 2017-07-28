# OrchextraAuth
SDK Para el API Auth de Orchextra

## Getting Started

Clona o descarga el proyecto para tener una copia en tu maquina.

### Prerequisites

Los requisitos para el framework son:
```
- iOS 9.0 +
- XCode 8.3.3
- Swift 3.0, 3.1, 3.2
```
### Installing

Una vez descargado o clonado arrastre a su proyecto el paquete Auth.framework y copie si es necesario, asegúrese que el framework se agrego correctamente en "Embedded Binaries" y "Linked Frameworks and Libraries".

### Usage

Para usarse lo primero que se debe hacer es:

```swift
import Auth
```

Una vez importado se manda a llamar:

Llamada auth:
```swift
auth.auth(clientId: "string", password: "string") { authResponse in

            if authResponse.isSuccess {
                print("Success request")
                print(authResponse.access!)
            }else{
                print((authResponse.error?.description ?? ""))
            }
        }
```

Llamada login:
```swift
auth.login(username: "string", password: "string", client: "string") { loginResponse in
            if loginResponse.isSuccess {
                print("Success request")
                print(loginResponse.user ?? "")
            }else{
                print((loginResponse.error?.description ?? ""))
            }
        }
```

Para hacer un llamdo personalizado:
```swift
auth.customLogin(username: "String", password: "String", client: "String", options: "String", delegate: self)
```

Para el llamado personalizado debemos suscribir al delegado AuthDelegate e implementar los metodos:

```swift
func onSuccess(response: AnyObject?) {
        //My code
    }
    
func onFail(response: AnyObject?, error: String?) {
        //My code
    }
```

## Versioning

Nosotros usamos versionamiento semantico para el proyecto, para mas información visitar: https://es.wikipedia.org/wiki/Control_de_versiones

## Authors

* **Arturo López Arce** [@Hitilien](https://github.com/Hitilien)
* **Francisco Garcia Galvan** [@yavier](https://github.com/yavier)

## License

Copyright (c) 2017 [@Hitilien](https://github.com/Hitilien) and [@yavier](https://github.com/yavier)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

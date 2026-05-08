//Pasajeros
object neo {
    var energia = 100

    /*method energia() = energia*/

    method saltar() {
      energia = energia / 2
    }

    method vitalidad()= energia/10

    method esElElegido() = true 
}

object morfeo {
    var vitalidad = 8
    var descansado = true  

    method vitalidad() = vitalidad

    method saltar(){
        vitalidad -= 1

        descansado = !descansado
    }

    method esElElegido() = false
}

object trinity {
    method vitalidad() = 0

    method saltar(){}

    method esElElegido() = false 
}

//Nave

object nave {
  const pasajeros = [trinity, morfeo, neo]

  method cuantosPasajerosHay() = pasajeros.size()

  method agregarPasajero(pasajero) {
    pasajeros.add(pasajero)
  }

  method bajarPasajero(pasajero) {
    pasajero.remove(pasajero)
  }

  method pasajeroMayorVitalidad() = pasajeros.max({lista=>lista.vitalidad()})

  method pasajeroConMenorVitalidad() = pasajeros.min({m=>m.vitalidad()})

  method estaEquilibrado() {
    return pasajeros.any({p=>p.pasajeroConMenorVitalidad() >p.pasajeroConMenorVitalidad()*2})
  }

  method estaElElegido() {
    return pasajeros.any({m=>m.esElElegido()})
  } 

  method chocar() {
    pasajeros.forEach({unPasajero => unPasajero.saltar()
                            self.bajarPasajero(unPasajero)})
  }

  method acelerar() {
    self.listaDeNoElegidos().forEach({noElegido => noElegido.saltar()})     
  }

  method listaDeNoElegidos() {
    return pasajeros.filter({unPasajero => not unPasajero.esElegido()})
  }

  method pasajerosValiosos() { //1
    return pasajeros.filter({unPasajero => unPasajero.vitalidad() > 5})
  }

  method algunPasajeroNoTieneVida() {//2
    return pasajeros.any({unPasajero => unPasajero.vitalidad() == 0})
  }

  method puedenEnfrentarAgente() {//3
    return pasajeros.all({unPasajero => unPasajero.vitalidad() > 2})
  }

  method vitalidadPromedio() {//4
    return self.sumaVitalidad() / pasajeros.size()
  }

  method sumaVitalidad() {
    return pasajeros.sum({unPasajero => unPasajero.vitalidad()})
  }

  method pasajerosConVitalidadPar() {//5
    return pasajeros.size({unPasajero => unPasajero.vitalidad().even()}) 
  }

  method simulacroDeCombate() { //6
    pasajeros.forEach({p=>p.saltar()})
    pasajeros.forEach({p=>p.saltar()})//repetirlo 3 veces 
    pasajeros.forEach({p=>p.saltar()})
  }

  method vitalidadDePasajeros() {//7
    return pasajeros.map({unPasajero => unPasajero.vitalidad()})
  }

  method ordenarPasajerosPorVitalidad() {//8
    return pasajeros.sortBy({a, b => a < b})
  }

  method limpiarBaño() = pasajeros.anyOne()//9

  method cantidadElegidos() = pasajeros.count({unPasajero => unPasajero.esElElegido()}) //10

  method potenciaVital() {//11
    return pasajeros.fold(1, {a, b => a.vitalidad() * b.vitalidad()})
  }

}/*la diferencia entre listas y conjusto es que las listas son ordenadas.//transforma la lista de pasajeros a una lista de numeros a traves de un closure (es bloque de codigo que hace algo) recorre 1x1, lo guarda en una variable y ejecuta lo que quiere. Adentro de un closure puedo tener mas de un comando solo los que tienen comandos, porque en general los demas tienen una sola linea.*/




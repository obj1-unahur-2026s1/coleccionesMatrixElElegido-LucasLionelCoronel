
//Pasajeros
object neo {
    var energia = 100

    method energia() = energia

    method saltar() {
      energia = energia / 2
    }

    method vitalidad() {
      return energia * 0.1
    }

    method esElElegido() = true 
}

object morfeo {
    var vitalidad = 8
    var descansado = true

    method estaDescansado() = descansado  

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
  const pasajeros = []

  method agregarPasajero(nombre) {
    pasajeros.add(nombre)
  }

  method cuantosPasajerosHay() = pasajeros.size()

  method pasajeroConMayorVitalidad() {
    return pasajeros.max({m => m.vitalidad()})
  }

  method pasajeroConMenorVitalidad() {
    return pasajeros.min({m => m.vitalidad()})
  }

  method estaEquilibrado() {
    return self.pasajeroConMayorVitalidad() <= self.pasajeroConMayorVitalidad() * 2
  }

  method estaElElegidoEnLaNave() {
    return pasajeros.any({m => m.esElElegido()})
  }

  //Hechos de la nave

  method naveChoco() {
  pasajeros.forEach({m => m.saltar()})//Saltan todos los personajes de la lista
  pasajeros.clear()
  }

  method naveAcelera() { 
  pasajeros.filter({m => !m.esElElegido().saltar()})
  pasajeros.forEach({m => m.saltar()})
  }
}
object tito {
  var cantidad = 0
  var bebida = cianuro
  
  method peso() = 70
  
  method inerciaBase() = 490
  
  method consumir(unaCantidad, unaBebida) {
    bebida = unaBebida
    cantidad = unaCantidad
  }
  
  method bebida() = bebida
  
  method velocidad() = (bebida.rendimiento(
    cantidad
  ) * self.inerciaBase()) / self.peso()
}

object wisky {
  method rendimiento(cantidad) = 0.9 ** cantidad
}

object cianuro {
  method rendimiento(cantidad) = 0
}

object terere {
  method rendimiento(cantidad) = 1.max(cantidad * 0.1)
} ////////////////////LICUADO/////////////////////////////

object licuado {
  const ingredientes = [banana, piña, frutilla]
  
  method ingredientes() = ingredientes
  
  method agregar(unaFruta) {
    ingredientes.add(unaFruta)
  }
  
  method rendimiento(cantidad) = cantidad * ingredientes.map(
    { x => x.nutrientes() }
  ).sum()
} //

/////////////////PUTAS/////////////////////////////////
object banana {
  method nutrientes() = 5
}

object piña {
  method nutrientes() = 10
}

object frutilla {
  method nutrientes() = 20
}

object leche {
  method nutrientes() = 0
}

object hielo {
  method nutrientes() = 0
} ///////////////////////Saborizada//////////////////////////////////////

object saborizada {
  var bebida = 0
  
  method bebida() = bebida
  
  method bebida(nuevaBebida) {
    bebida = nuevaBebida
  }
  
  method rendimiento(cantidad) = 1 + (cantidad * (self.bebida() / 4))
} ///////////////////////Coctel//////////////////////////////////////

object coctel {
  const ingredientes = [wisky, saborizada]
  
  method ingredientes() = ingredientes
  
  method agregar(unaFruta) {
    ingredientes.add(unaFruta)
  }
  
  method rendimiento(cantidad) = cantidad * matematica.multiplicar(
    ingredientes.map({ x => x.rendimiento(10) })
  )
} //[2,3,4,5].forEach({a,b => })//[2,3,4,5].forEach({a,b => })

object matematica {
  method multiplicar(unaLista) {
    var res = 1
    unaLista.forEach({ x => res *= x })
    return res
  }
}

object coctelSuave {
  const ingredientes = [wisky, saborizada, terere]
  
  method ingredientes() = ingredientes
  
  method agregar(unaFruta) {
    ingredientes.add(unaFruta)
  }
  
  method rendimiento(cantidad) = cantidad * matematica.multiplicar(
    ingredientes.map({ x => x.rendimiento(10) }).filter({ x => x > 0.5 })
  )
}
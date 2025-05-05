object tito {
    var cantidad = 0
    var bebida = cianuro

    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}
// bebidas 
object whisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}
// nuevas bebidas
object fruta { // valores inventados para realizar el licuado
    method nutriente() = 10 
}
object leche {
    method nutriente() = 20 
}
object hielo {
    method nutriente() = 30 
}
object licuadoDeFruta { //¿? estoy en dudas
    const nutrientes = #{fruta, leche , hielo}
    var rendimiento = 0

    method rendimiento(cantidad) {
        rendimiento = nutrientes.sum({n=>n.nutriente()}) / cantidad
    }
}
object aguaSaborizada {
    var rendimiento = 0 
    method rendimientoAgua() = 1 
    method rendimiento() = rendimiento 
    method bebida() = whisky 
    
    method rendimiento(cantidad) {
        rendimiento = self.rendimientoAgua() + cantidad * 0.25
    // rendimiento = rendimientoAgua + rendimientobebida(1/4)
    }
}
object coctel {
    const bebidas = #{whisky, terere, cianuro}

    method cantidadDeBebidas() {
        return bebidas.size()
    }
    method proporcionDeLasBebidas(unaCantidad){
        return unaCantidad / self.cantidadDeBebidas() 
    }
    method rendimiento(cantidad) {
        return bebidas.map({b=>b.rendimiento(cantidad)})
    } 
}
object coctelSuave {
    method rendiminto(cantidad) {
        bebidas.any({b=>b.rendimiento(cantidad)})
    }
}
package Krisseldu.Krisseldu.repository;

import org.springframework.stereotype.Repository;

@Repository
public class TerapeutaRepository {

    public String getTerapeutaById(int id) {
        // Obtener terapeuta por ID (por ejemplo, basado en la sesión)
        return "Carlos Serna";  // Retorna un nombre de terapeuta como ejemplo
    }
}

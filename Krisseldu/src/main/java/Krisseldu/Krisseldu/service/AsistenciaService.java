package Krisseldu.Krisseldu.service;

import Krisseldu.Krisseldu.model.Asistencia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AsistenciaService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Registrar nueva asistencia (inserta registro)
    public void registrarAsistencia(Asistencia asistencia) {
        String sql = "INSERT INTO asistencias (ejercicio_id, usuario_id, realizado) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, asistencia.getEjercicioId(), asistencia.getUsuarioId(), asistencia.isRealizado());
    }

    // Actualizar asistencia como realizada
    public void marcarAsRealizado(Long asistenciaId) {
        String sql = "UPDATE asistencias SET realizado = true WHERE id = ?";
        jdbcTemplate.update(sql, asistenciaId);
    }

    // Opcional: obtener lista de asistencias por ejercicio
    public List<Asistencia> getAsistenciasByEjercicio(Long ejercicioId) {
        String sql = "SELECT * FROM asistencias WHERE ejercicio_id = ?";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Asistencia a = new Asistencia();
            a.setId(rs.getLong("id"));
            a.setEjercicioId(rs.getLong("ejercicio_id"));
            a.setUsuarioId(rs.getLong("usuario_id"));
            a.setRealizado(rs.getBoolean("realizado"));
            return a;
        }, ejercicioId);
    }
}

package Krisseldu.Krisseldu.service;

import Krisseldu.Krisseldu.model.Ejercicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class EjercicioService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * Obtener ejercicios filtrados según condiciones del usuario y estado individual por usuario.
     * @param condicionesIds Lista de IDs de condiciones del usuario (ej. esguince, tendinitis).
     * @param usuarioId ID del usuario para consultar el estado realizado.
     * @return Lista de ejercicios filtrados con su estado para el usuario.
     */
    public List<Ejercicio> obtenerEjerciciosPorCondicionesYUsuario(List<Long> condicionesIds, Long usuarioId) {
        if (condicionesIds == null || condicionesIds.isEmpty()) {
            return Collections.emptyList();
        }

        // Construye placeholders para el IN (?, ?, ...)
        String inSql = condicionesIds.stream()
                .map(id -> "?")
                .collect(Collectors.joining(", "));

        String sql = "SELECT DISTINCT e.id, e.nombre, e.descripcion, e.horarios, " +
                "COALESCE(ue.realizado, FALSE) AS realizado " +
                "FROM ejercicios e " +
                "JOIN condicion_ejercicio ce ON e.id = ce.ejercicio_id " +
                "JOIN usuario_condicion uc ON ce.condicion_id = uc.condicion_id AND uc.usuario_id = ? " +
                "LEFT JOIN usuario_ejercicio ue ON e.id = ue.ejercicio_id AND ue.usuario_id = ? " +
                "WHERE ce.condicion_id IN (" + inSql + ")";

        // Parámetros: usuarioId, usuarioId, + condicionesIds
        Object[] params = new Object[condicionesIds.size() + 2];
        params[0] = usuarioId;
        params[1] = usuarioId;
        for (int i = 0; i < condicionesIds.size(); i++) {
            params[i + 2] = condicionesIds.get(i);
        }

        return jdbcTemplate.query(sql, params, (rs, rowNum) -> {
            Ejercicio ejercicio = new Ejercicio();
            ejercicio.setId(rs.getLong("id"));
            ejercicio.setNombre(rs.getString("nombre"));
            ejercicio.setDescripcion(rs.getString("descripcion"));
            ejercicio.setHorarios(rs.getString("horarios"));
            ejercicio.setRealizado(rs.getBoolean("realizado"));
            return ejercicio;
        });
    }

    /**
     * Marcar ejercicio como pendiente (no realizado) para un usuario específico.
     */
    public void marcarEjercicioPendiente(Long usuarioId, Long ejercicioId) {
        String sql = "UPDATE usuario_ejercicio SET realizado = FALSE WHERE usuario_id = ? AND ejercicio_id = ?";
        jdbcTemplate.update(sql, usuarioId, ejercicioId);
    }

    /**
     * Marcar ejercicio como realizado para un usuario específico.
     */
    public void marcarEjercicioRealizadoParaUsuario(Long ejercicioId, Long usuarioId) {
        String sqlCheck = "SELECT COUNT(*) FROM usuario_ejercicio WHERE usuario_id = ? AND ejercicio_id = ?";
        Integer count = jdbcTemplate.queryForObject(sqlCheck, new Object[]{usuarioId, ejercicioId}, Integer.class);

        if (count != null && count > 0) {
            String sqlUpdate = "UPDATE usuario_ejercicio SET realizado = TRUE WHERE usuario_id = ? AND ejercicio_id = ?";
            jdbcTemplate.update(sqlUpdate, usuarioId, ejercicioId);
        } else {
            String sqlInsert = "INSERT INTO usuario_ejercicio (usuario_id, ejercicio_id, realizado) VALUES (?, ?, TRUE)";
            jdbcTemplate.update(sqlInsert, usuarioId, ejercicioId);
        }
    }

    /**
     * Crear registro usuario_ejercicio si no existe para usuario y ejercicio.
     */
    public void crearUsuarioEjercicioSiNoExiste(Long usuarioId, Long ejercicioId) {
        String sqlCheck = "SELECT COUNT(*) FROM usuario_ejercicio WHERE usuario_id = ? AND ejercicio_id = ?";
        Integer count = jdbcTemplate.queryForObject(sqlCheck, new Object[]{usuarioId, ejercicioId}, Integer.class);

        if (count == null || count == 0) {
            String sqlInsert = "INSERT INTO usuario_ejercicio (usuario_id, ejercicio_id, realizado) VALUES (?, ?, FALSE)";
            jdbcTemplate.update(sqlInsert, usuarioId, ejercicioId);
        }
    }
}

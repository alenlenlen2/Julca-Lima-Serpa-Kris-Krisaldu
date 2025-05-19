package Krisseldu.Krisseldu.service;

import Krisseldu.Krisseldu.model.Paciente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PacienteService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Obtener todos los pacientes
    public List<Paciente> obtenerTodosPacientes() {
        String sql = "SELECT id, nombre, condicion, edad, horarios, asistencia, video FROM paciente";
        return jdbcTemplate.query(sql, (rs, rowNum) -> mapPaciente(rs));
    }

    // Obtener un paciente por ID
    public Paciente obtenerPacientePorId(Long id) {
        try {
            String sql = "SELECT id, nombre, condicion, edad, horarios, asistencia, video FROM paciente WHERE id = ?";
            return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> mapPaciente(rs));
        } catch (EmptyResultDataAccessException e) {
            return null; // No encontrado
        }
    }

    // Agregar nuevo paciente
    public int agregarPaciente(Paciente paciente) {
        String sql = "INSERT INTO paciente (nombre, condicion, edad, horarios, asistencia, video) VALUES (?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql,
                paciente.getNombre(),
                paciente.getCondicion(),
                paciente.getEdad(),
                paciente.getHorarios(),
                paciente.getAsistencia(),
                paciente.getVideo());
    }

    // Actualizar paciente existente
    public int actualizarPaciente(Paciente paciente) {
        String sql = "UPDATE paciente SET nombre = ?, condicion = ?, edad = ?, horarios = ?, asistencia = ?, video = ? WHERE id = ?";
        return jdbcTemplate.update(sql,
                paciente.getNombre(),
                paciente.getCondicion(),
                paciente.getEdad(),
                paciente.getHorarios(),
                paciente.getAsistencia(),
                paciente.getVideo(),
                paciente.getId());
    }

    // Eliminar paciente por ID
    public int eliminarPaciente(Long id) {
        String sql = "DELETE FROM paciente WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    // Mapear ResultSet a objeto Paciente
    private Paciente mapPaciente(java.sql.ResultSet rs) throws java.sql.SQLException {
        Paciente p = new Paciente();
        p.setId(rs.getLong("id"));
        p.setNombre(rs.getString("nombre"));
        p.setCondicion(rs.getString("condicion"));
        p.setEdad(rs.getInt("edad"));
        p.setHorarios(rs.getString("horarios"));
        p.setAsistencia(rs.getString("asistencia"));
        p.setVideo(rs.getString("video"));
        return p;
    }
}

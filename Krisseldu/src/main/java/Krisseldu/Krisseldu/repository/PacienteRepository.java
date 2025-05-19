package Krisseldu.Krisseldu.repository;

import Krisseldu.Krisseldu.model.Paciente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PacienteRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Obtener todos los pacientes
    public List<Paciente> findAll() {
        String sql = "SELECT id, nombre, condicion, edad, horarios, asistencia, video FROM paciente";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Paciente p = new Paciente();
            p.setId(rs.getLong("id"));
            p.setNombre(rs.getString("nombre"));
            p.setCondicion(rs.getString("condicion"));
            p.setEdad(rs.getInt("edad"));
            p.setHorarios(rs.getString("horarios"));
            p.setAsistencia(rs.getString("asistencia"));
            p.setVideo(rs.getString("video"));
            return p;
        });
    }

    // Obtener paciente por ID
    public Paciente findById(Long id) {
        try {
            String sql = "SELECT id, nombre, condicion, edad, horarios, asistencia, video FROM paciente WHERE id = ?";
            return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> {
                Paciente p = new Paciente();
                p.setId(rs.getLong("id"));
                p.setNombre(rs.getString("nombre"));
                p.setCondicion(rs.getString("condicion"));
                p.setEdad(rs.getInt("edad"));
                p.setHorarios(rs.getString("horarios"));
                p.setAsistencia(rs.getString("asistencia"));
                p.setVideo(rs.getString("video"));
                return p;
            });
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    // Otros métodos: insert, update, delete, etc. pueden ir aquí
}

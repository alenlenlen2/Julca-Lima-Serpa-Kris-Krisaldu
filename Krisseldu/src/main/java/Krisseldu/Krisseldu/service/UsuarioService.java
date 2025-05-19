package Krisseldu.Krisseldu.service;

import Krisseldu.Krisseldu.model.Condicion;
import Krisseldu.Krisseldu.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuarioService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Guardar usuario sin condiciones (solo datos básicos y rol)
    public void guardarUsuario(Usuario usuario) {
        String insertSql = "INSERT INTO usuario (nombre, apellido, edad, dni, username, password, rol) VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(insertSql,
                usuario.getNombre(),
                usuario.getApellido(),
                usuario.getEdad(),
                usuario.getDni(),
                usuario.getUsername(),
                usuario.getPassword(),
                usuario.getRol()); // rol fijo PACIENTE
    }

    // Obtener id de condición por nombre
    public Long obtenerIdCondicionPorNombre(String nombreCondicion) {
        String sql = "SELECT id FROM condiciones WHERE nombre = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{nombreCondicion}, Long.class);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    // Guardar relación usuario-condicion
    public void guardarUsuarioCondicion(Long usuarioId, Long condicionId) {
        String sql = "INSERT INTO usuario_condicion (usuario_id, condicion_id) VALUES (?, ?)";
        jdbcTemplate.update(sql, usuarioId, condicionId);
    }

    // Obtener usuario completo por username (sin condiciones)
    public Usuario obtenerUsuarioPorUsername(String username) {
        try {
            String sql = "SELECT * FROM usuario WHERE username = ?";
            Usuario usuario = jdbcTemplate.queryForObject(sql, new Object[]{username}, (rs, rowNum) -> {
                Usuario u = new Usuario();
                u.setId(rs.getLong("id"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setEdad(rs.getInt("edad"));
                u.setDni(rs.getString("dni"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRol(rs.getString("rol"));
                return u;
            });
            return usuario;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    // Obtener lista de condiciones de un usuario por su ID
    public List<Condicion> obtenerCondicionesPorUsuario(Long usuarioId) {
        String sql = "SELECT c.id, c.nombre FROM condiciones c " +
                "JOIN usuario_condicion uc ON c.id = uc.condicion_id " +
                "WHERE uc.usuario_id = ?";
        return jdbcTemplate.query(sql, new Object[]{usuarioId}, (rs, rowNum) -> {
            Condicion c = new Condicion();
            c.setId(rs.getLong("id"));
            c.setNombre(rs.getString("nombre"));
            return c;
        });
    }

    // Método para autenticar usuario simplificado
    public Usuario authenticate(String username, String password) {
        Usuario usuario = obtenerUsuarioPorUsername(username);
        if (usuario == null) {
            throw new RuntimeException("Usuario no existe.");
        }
        if (!usuario.getPassword().equals(password)) {
            throw new RuntimeException("Contraseña incorrecta.");
        }
        return usuario;
    }
}

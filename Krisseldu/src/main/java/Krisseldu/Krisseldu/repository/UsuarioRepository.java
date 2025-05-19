package Krisseldu.Krisseldu.repository;

import Krisseldu.Krisseldu.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Guardar usuario sin campo condición
    public int save(Usuario usuario) {
        String sql = "INSERT INTO usuario (nombre, apellido, edad, dni, username, password, rol) VALUES (?, ?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql,
                usuario.getNombre(),
                usuario.getApellido(),
                usuario.getEdad(),
                usuario.getDni(),
                usuario.getUsername(),
                usuario.getPassword(),
                usuario.getRol());
    }

    // Obtener usuario por username sin campo condición
    public Usuario findByUsername(String username) {
        String sql = "SELECT * FROM usuario WHERE username = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{username}, (rs, rowNum) -> {
            Usuario user = new Usuario();
            user.setId(rs.getLong("id"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setNombre(rs.getString("nombre"));
            user.setApellido(rs.getString("apellido"));
            user.setEdad(rs.getInt("edad"));
            user.setDni(rs.getString("dni"));
            user.setRol(rs.getString("rol"));
            return user;
        });
    }

    // Aquí puedes agregar métodos para guardar y obtener relaciones usuario_condicion
    public void saveUsuarioCondicion(Long usuarioId, Long condicionId) {
        String sql = "INSERT INTO usuario_condicion (usuario_id, condicion_id) VALUES (?, ?)";
        jdbcTemplate.update(sql, usuarioId, condicionId);
    }

    // Otros métodos relacionados con condiciones o usuario pueden ir aquí
}

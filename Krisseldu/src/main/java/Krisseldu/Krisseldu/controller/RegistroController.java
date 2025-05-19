package Krisseldu.Krisseldu.controller;

import Krisseldu.Krisseldu.model.Usuario;
import Krisseldu.Krisseldu.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegistroController {

    @Autowired
    private UsuarioService usuarioService;

    // Muestra el formulario de registro
    @GetMapping("/registro")
    public String showRegistrationForm() {
        return "registro";  // Retorna la vista registro.html
    }

    // Procesa el registro de usuario
    @PostMapping("/registro")
    public String registerUser(@RequestParam String nombre, @RequestParam String apellido, @RequestParam int edad,
                               @RequestParam String condicion, @RequestParam String dni,
                               @RequestParam String username, @RequestParam String password,
                               Model model) {
        try {
            // Crear un objeto Usuario con los datos del formulario (sin condición textual)
            Usuario usuario = new Usuario();
            usuario.setNombre(nombre);
            usuario.setApellido(apellido);
            usuario.setEdad(edad);
            usuario.setDni(dni);
            usuario.setUsername(username);
            usuario.setPassword(password);
            usuario.setRol("PACIENTE"); // rol fijo

            // Guardar usuario (sin condición en tabla usuario)
            usuarioService.guardarUsuario(usuario);

            // Obtener usuario guardado para obtener su ID
            Usuario usuarioGuardado = usuarioService.obtenerUsuarioPorUsername(username);

            // Obtener el id de la condición por nombre
            Long condicionId = usuarioService.obtenerIdCondicionPorNombre(condicion);
            if (condicionId == null) {
                model.addAttribute("errorMessage", "Condición no válida.");
                return "registro";
            }

            // Guardar la relación usuario-condicion
            usuarioService.guardarUsuarioCondicion(usuarioGuardado.getId(), condicionId);

            model.addAttribute("successMessage", "¡Usuario registrado exitosamente!");
            return "redirect:/login";  // Redirige al login

        } catch (Exception e) {
            model.addAttribute("errorMessage", "Hubo un error al registrar el usuario. Intenta de nuevo.");
            return "registro";  // Volver al formulario en caso de error
        }
    }
}

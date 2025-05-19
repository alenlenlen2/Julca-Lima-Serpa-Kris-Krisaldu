package Krisseldu.Krisseldu.controller;

import Krisseldu.Krisseldu.model.Usuario;
import Krisseldu.Krisseldu.service.UsuarioService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";  // Devuelve la vista de login
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String usuario, @RequestParam String contrasena,
                            Model model, HttpSession session) {
        try {
            Usuario usuarioObj = usuarioService.authenticate(usuario, contrasena);

            // Guardar el username en la sesión
            session.setAttribute("username", usuarioObj.getUsername());

            // Redirigir según rol
            if ("TERAPEUTA".equalsIgnoreCase(usuarioObj.getRol())) {
                return "redirect:/terapeuta";  // Redirige a vista terapeuta
            } else {
                return "redirect:/home";  // Redirige a home u otra vista según rol
            }
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Usuario o contraseña incorrectos.");
            return "login";  // Queda en login si falla autenticación
        }
    }
}

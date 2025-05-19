package Krisseldu.Krisseldu.controller;

import Krisseldu.Krisseldu.model.Asistencia;
import Krisseldu.Krisseldu.service.AsistenciaService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AsistenciaController {

    @Autowired
    private AsistenciaService asistenciaService;

    // Mostrar la página de asistencias con username desde sesión
    @GetMapping("/asistencias")
    public String mostrarAsistencias(@RequestParam(required = false) Long ejercicioId,
                                     Model model, HttpSession session) {
        // Agregar ejercicioId para la vista
        model.addAttribute("ejercicioId", ejercicioId);

        // Obtener username de sesión
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/login";  // Si no hay sesión, redirige a login
        }

        model.addAttribute("username", username);

        return "asistencias";  // Vista asistencias.html
    }

    // Registrar una nueva asistencia cuando se inicia la grabación (si no existe)
    @PostMapping("/registrarAsistencia")
    public String registrarAsistencia(@RequestParam Long ejercicioId, @RequestParam Long usuarioId) {
        Asistencia asistencia = new Asistencia();
        asistencia.setEjercicioId(ejercicioId);
        asistencia.setUsuarioId(usuarioId);
        asistencia.setRealizado(false);  // Estado inicial
        asistenciaService.registrarAsistencia(asistencia);
        return "redirect:/asistencias?ejercicioId=" + ejercicioId;
    }

    // Marcar la asistencia como realizada (cuando el video se envía)
    @PostMapping("/marcarAsistenciaRealizada")
    public String marcarAsistenciaRealizada(@RequestParam Long asistenciaId, @RequestParam Long ejercicioId) {
        asistenciaService.marcarAsRealizado(asistenciaId);
        return "redirect:/ejercicios";
    }
}

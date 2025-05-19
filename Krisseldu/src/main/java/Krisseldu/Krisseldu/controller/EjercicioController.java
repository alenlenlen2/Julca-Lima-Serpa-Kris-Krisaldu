package Krisseldu.Krisseldu.controller;

import Krisseldu.Krisseldu.model.Asistencia;
import Krisseldu.Krisseldu.model.Ejercicio;
import Krisseldu.Krisseldu.model.Usuario;
import Krisseldu.Krisseldu.service.AsistenciaService;
import Krisseldu.Krisseldu.service.EjercicioService;
import Krisseldu.Krisseldu.service.UsuarioService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class EjercicioController {

    @Autowired
    private EjercicioService ejercicioService;

    @Autowired
    private AsistenciaService asistenciaService;

    @Autowired
    private UsuarioService usuarioService;

    // Mostrar la página de ejercicios filtrados por condiciones del usuario
    @GetMapping("/ejercicios")
    public String mostrarEjerciciosPage(Model model, HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/login";
        }

        Usuario usuario = usuarioService.obtenerUsuarioPorUsername(username);
        if (usuario == null) {
            return "redirect:/login";
        }

        // Obtener IDs de condiciones asignadas al usuario
        List<Long> condicionesIds = usuarioService.obtenerCondicionesPorUsuario(usuario.getId())
                .stream()
                .map(condicion -> condicion.getId())
                .collect(Collectors.toList());

        // Obtener ejercicios filtrados por condiciones y usuario
        List<Ejercicio> ejercicios = ejercicioService.obtenerEjerciciosPorCondicionesYUsuario(condicionesIds, usuario.getId());

        model.addAttribute("ejercicios", ejercicios);
        model.addAttribute("username", username);

        return "ejercicios";  // Retorna la vista de ejercicios filtrada
    }

    // Iniciar ejercicio: registra asistencia y marca ejercicio como pendiente para usuario
    @GetMapping("/iniciarEjercicio")
    public String iniciarEjercicio(@RequestParam Long ejercicioId, HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/login";
        }

        Usuario usuario = usuarioService.obtenerUsuarioPorUsername(username);
        if (usuario == null) {
            return "redirect:/login";
        }

        // Registrar asistencia inicial
        Asistencia asistencia = new Asistencia();
        asistencia.setEjercicioId(ejercicioId);
        asistencia.setUsuarioId(usuario.getId());
        asistencia.setRealizado(false);
        asistenciaService.registrarAsistencia(asistencia);

        // Marcar ejercicio pendiente para el usuario
        ejercicioService.marcarEjercicioPendiente(usuario.getId(), ejercicioId);

        // Redirigir a página de asistencias o donde corresponda
        return "redirect:/asistencias?ejercicioId=" + ejercicioId;
    }

    // Marcar ejercicio como realizado para usuario
    @GetMapping("/marcarEjercicioRealizado")
    public String marcarEjercicioRealizado(@RequestParam Long ejercicioId, HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/login";
        }

        Usuario usuario = usuarioService.obtenerUsuarioPorUsername(username);
        if (usuario == null) {
            return "redirect:/login";
        }

        ejercicioService.marcarEjercicioRealizadoParaUsuario(ejercicioId, usuario.getId());
        return "redirect:/ejercicios";
    }

    // Finalizar ejercicio: marcar como realizado para usuario
    @GetMapping("/finalizarEjercicio")
    public String finalizarEjercicio(@RequestParam Long ejercicioId, HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username == null) {
            return "redirect:/login";
        }

        Usuario usuario = usuarioService.obtenerUsuarioPorUsername(username);
        if (usuario == null) {
            return "redirect:/login";
        }

        ejercicioService.marcarEjercicioRealizadoParaUsuario(ejercicioId, usuario.getId());
        return "redirect:/ejercicios";
    }
}

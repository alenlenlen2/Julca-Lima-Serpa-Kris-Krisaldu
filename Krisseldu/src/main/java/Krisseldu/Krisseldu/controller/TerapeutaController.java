package Krisseldu.Krisseldu.controller;

import Krisseldu.Krisseldu.model.Paciente;
import Krisseldu.Krisseldu.service.PacienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class TerapeutaController {

    @Autowired
    private PacienteService pacienteService;

    // Mostrar vista principal del terapeuta (puedes adaptar para mostrar datos del terapeuta)
    @GetMapping("/terapeuta")
    public String mostrarVistaTerapeuta(Model model) {
        model.addAttribute("nombreTerapeuta", "Carlos Serna"); // O traer de sesión/usuario real
        return "terapeuta";
    }

    // Mostrar lista de pacientes desde la base de datos
    @GetMapping("/verPaciente")
    public String verDatosPaciente(Model model) {
        List<Paciente> pacientes = pacienteService.obtenerTodosPacientes();
        model.addAttribute("pacientes", pacientes);
        return "verPaciente";
    }

    // Mostrar detalles de paciente específico por su ID (no índice)
    @GetMapping("/verPaciente/{id}")
    public String verDetallePaciente(@PathVariable Long id, Model model) {
        Paciente paciente = pacienteService.obtenerPacientePorId(id);

        if (paciente == null) {
            return "error"; // O página de no encontrado, según prefieras
        }

        model.addAttribute("paciente", paciente);
        return "detallePaciente";
    }
}
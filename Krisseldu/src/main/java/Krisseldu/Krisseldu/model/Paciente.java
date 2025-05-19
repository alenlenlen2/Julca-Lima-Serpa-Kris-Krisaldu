package Krisseldu.Krisseldu.model;

public class Paciente {
    private Long id;
    private String nombre;
    private String condicion;  // Si usas la tabla condiciones, este campo puede eliminarse o mantenerse para datos rápidos
    private int edad;
    private String horarios;
    private String asistencia;
    private String video;

    private Long terapeutaId;  // Nuevo campo para relacionar al terapeuta

    // Constructor vacío
    public Paciente() {}

    // Constructor con todos los parámetros
    public Paciente(Long id, String nombre, String condicion, int edad, String horarios, String asistencia, String video, Long terapeutaId) {
        this.id = id;
        this.nombre = nombre;
        this.condicion = condicion;
        this.edad = edad;
        this.horarios = horarios;
        this.asistencia = asistencia;
        this.video = video;
        this.terapeutaId = terapeutaId;
    }

    // Getters y setters
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCondicion() {
        return condicion;
    }
    public void setCondicion(String condicion) {
        this.condicion = condicion;
    }

    public int getEdad() {
        return edad;
    }
    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getHorarios() {
        return horarios;
    }
    public void setHorarios(String horarios) {
        this.horarios = horarios;
    }

    public String getAsistencia() {
        return asistencia;
    }
    public void setAsistencia(String asistencia) {
        this.asistencia = asistencia;
    }

    public String getVideo() {
        return video;
    }
    public void setVideo(String video) {
        this.video = video;
    }

    public Long getTerapeutaId() {
        return terapeutaId;
    }
    public void setTerapeutaId(Long terapeutaId) {
        this.terapeutaId = terapeutaId;
    }
}

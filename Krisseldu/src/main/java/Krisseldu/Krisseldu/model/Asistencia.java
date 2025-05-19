package Krisseldu.Krisseldu.model;

public class Asistencia {
    private Long id;
    private Long ejercicioId;
    private Long usuarioId;
    private boolean realizado;

    // Getters y Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getEjercicioId() { return ejercicioId; }
    public void setEjercicioId(Long ejercicioId) { this.ejercicioId = ejercicioId; }

    public Long getUsuarioId() { return usuarioId; }
    public void setUsuarioId(Long usuarioId) { this.usuarioId = usuarioId; }

    public boolean isRealizado() { return realizado; }
    public void setRealizado(boolean realizado) { this.realizado = realizado; }
}

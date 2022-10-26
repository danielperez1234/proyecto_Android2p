class Persona {
  int id;
  String nombre;
  String usuario;
  String password;
  String especialidad;
  String edoCivil;
  List<String> habilidades;

  Persona(this.id, this.nombre, this.usuario, this.password, this.especialidad,
      this.edoCivil, this.habilidades);
  Map<String, dynamic> toMap() {
    String h = "";
    habilidades.forEach((element) {
      h = h + '/' + element;
    });
    return {
      'id': id,
      'usuario': usuario,
      'nombre': nombre,
      'password': password,
      'especialidad': especialidad,
      'estadoCivil': edoCivil,
      'habilidades': h
    };
  }
}

class Keyboard {
    Keyboard({
        this.id,
        this.name,
        this.description,
        this.status,
        this.idBranchOfficesVSdepartments,
        this.idTypeArticle,
        this.conexion,
        this.distribucion,
    });

    int id;
    String name;
    String description;
    bool status;
    int idBranchOfficesVSdepartments;
    int idTypeArticle;
    String conexion;
    String distribucion;

    factory Keyboard.fromJson(Map<String, dynamic> json) => Keyboard(
        id: json["id"] == null ? null : json["id"],
        idTypeArticle: json["id_type_article"] == null ? null : json["id_type_article"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        status: json["status"] == null ? null : json["status"],
        idBranchOfficesVSdepartments: json["id_branch_officesVSdepartments"] == null ? null : json["id_branch_officesVSdepartments"],
        conexion: json["feature"]["conexion"] == null ? null : json["feature"]["conexion"],
        distribucion: json["feature"]["distribucion"] == null ? null : json["feature"]["distribucion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "id_type_article": idTypeArticle == null ? null : idTypeArticle,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "status": status == null ? null : status,
        "id_branch_officesVSdepartments": idBranchOfficesVSdepartments == null ? null : idBranchOfficesVSdepartments,
        "conexion": conexion == null ? null : conexion,
        "distribucion": distribucion == null ? null : distribucion,
    };
}

class Monitor {
    Monitor({
        this.id,
        this.name,
        this.description,
        this.status,
        this.idBranchOfficesVSdepartments,
        this.idTypeArticle,
        this.tamano,
        this.conexion,
    });

    int id;
    String name;
    String description;
    bool status;
    int idBranchOfficesVSdepartments;
    int idTypeArticle;
    String tamano;
    String conexion;

    factory Monitor.fromJson(Map<String, dynamic> json) => Monitor(
        id: json["id"] == null ? null : json["id"],
        idTypeArticle: json["id_type_article"] == null ? null : json["id_type_article"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        status: json["status"] == null ? null : json["status"],
        idBranchOfficesVSdepartments: json["id_branch_officesVSdepartments"] == null ? null : json["id_branch_officesVSdepartments"],
        tamano: json["feature"]["tamano"] == null ? null : json["feature"]["tamano"],
        conexion: json["feature"]["conexion"] == null ? null : json["feature"]["conexion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "id_type_article": idTypeArticle == null ? null : idTypeArticle,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "status": status == null ? null : status,
        "id_branch_officesVSdepartments": idBranchOfficesVSdepartments == null ? null : idBranchOfficesVSdepartments,
        "tamano": tamano == null ? null : tamano,
        "conexion": conexion == null ? null : conexion,
    };
}

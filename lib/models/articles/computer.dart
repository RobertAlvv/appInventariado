class Computer {
    Computer({
        this.id,
        this.name,
        this.description,
        this.status,
        this.idBranchOfficesVSdepartments,
        this.idTypeArticle,
        this.processor,
        this.hardDisk,
        this.ram,
    });
    
    
    int id;
    String name;
    String description;
    bool status;
    int idBranchOfficesVSdepartments;
    int idTypeArticle;
    String processor;
    String hardDisk;
    String ram;

    factory Computer.fromJson(Map<String, dynamic> json) => Computer(
        id: json["id"] == null ? null : json["id"],
        idTypeArticle: json["id_type_article"] == null ? null : json["id_type_article"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        status: json["status"] == null ? null : json["status"],
        idBranchOfficesVSdepartments: json["id_branch_officesVSdepartments"] == null ? null : json["id_branch_officesVSdepartments"],
        processor: json["feature"]["processor"] == null ? null : json["feature"]["processor"],
        hardDisk: json["feature"]["hard disk"] == null ? null : json["feature"]["hard disk"],
        ram: json["feature"]["RAM"] == null ? null : json["feature"]["RAM"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "id_type_article": idTypeArticle == null ? null : idTypeArticle,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "status": status == null ? null : status,
        "id_branch_officesVSdepartments": idBranchOfficesVSdepartments == null ? null : idBranchOfficesVSdepartments,
        "processor": processor == null ? null : processor,
        "hard disk": hardDisk == null ? null : hardDisk,
        "RAM": ram == null ? null : ram,
    };
}
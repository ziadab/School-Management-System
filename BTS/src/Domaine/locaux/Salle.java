package Domaine.locaux;

public class Salle {
	private int id;
	private String code;
	private String nom_Fr;
	private String nom_Ar;
	private TypeSalle typeSalle;
	private Bloc bloc;
	public Salle() {
		super();
	}
	public Salle(int id, String code, String nom_Fr, String nom_Ar,
				 TypeSalle typeSalle, Bloc bloc) {
		super();
		this.id = id;
		this.code = code;
		this.nom_Fr = nom_Fr;
		this.nom_Ar = nom_Ar;
		this.typeSalle = typeSalle;
		this.bloc = bloc;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getNom_Fr() {
		return nom_Fr;
	}
	public void setNom_Fr(String nom_Fr) {
		this.nom_Fr = nom_Fr;
	}
	public String getNom_Ar() {
		return nom_Ar;
	}
	public void setNom_Ar(String nom_Ar) {
		this.nom_Ar = nom_Ar;
	}
	public TypeSalle getTypeSalle() {
		return typeSalle;
	}
	public void setTypeSalle(TypeSalle typeSalle) {
		this.typeSalle = typeSalle;
	}
	public Bloc getBloc() {
		return bloc;
	}
	public void setBloc(Bloc bloc) {
		this.bloc = bloc;
	}
	@Override
	public String toString() {
		return "Salle [id=" + id + ", code=" + code + ", nom_Fr=" + nom_Fr
				+ ", nom_Ar=" + nom_Ar 
				+ ", typeSalle=" + typeSalle + ", bloc=" + bloc + "]";
	}
}
package dao.etablissement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Domaine.etablissement.Province;
import Domaine.etablissement.Region;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import dao.database.Db;

public class ProvinceDAO {
	private Connection con;
	public ProvinceDAO() {
		this.con = Db.getInstance().con;
	}
	public void insert(Province province) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("insert into province (ID, RegionID, Code, Nom_Fr, Nom_Ar) values (null, ?, ?, ?, ?)");
		statement.setString(1, province.getRegion().getCode());
		statement.setString(2, province.getCode());
		statement.setString(3, province.getNom_Fr());
		statement.setString(4, province.getNom_Ar());
		statement.execute();
		statement.close();
	}
	public ArrayList<Province> getAll() throws SQLException{
		String query="select " +
				"`province`.`ID` AS provinceID, \r\n" +
				"`region`.`ID` AS regionID, \r\n" +
				"`region`.`Code` AS regionCode, \r\n" +
				"`region`.`Nom_Fr` AS regionNom_Fr, \r\n" +
				"`region`.`Nom_Ar` AS regionNom_Ar, \r\n" +
				"`province`.`Code` AS provinceCode, \r\n" +
				"`province`.`Nom_Fr` AS provinceNom_Fr, \r\n" +
				"`province`.`Nom_Ar` AS provinceNom_Ar \r\n" +
				"FROM \r\n" +
				"`province`,`region` \r\n" +
				"WHERE \r\n" +
				"`province`.`RegionID` =  `region`.`ID`;";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
		ResultSet rs = statement.executeQuery();
		ArrayList<Province> provinces = new ArrayList<Province>();
		while (rs.next()) {
			Province province = new Province();
			province.setId(rs.getInt("provinceID"));
			Region region = new Region();
			region.setId(rs.getInt("regionID"));
			region.setCode(rs.getString("regionCode"));
			region.setNom_Fr(rs.getString("regionNom_Fr"));
			region.setNom_Ar(rs.getString("regionNom_Ar"));
			province.setRegion(region);
			province.setCode(rs.getString("provinceCode"));
			province.setNom_Fr(rs.getString("provinceNom_Fr"));
			province.setNom_Ar(rs.getString("provinceNom_Ar"));
			provinces.add(province);
		}
		rs.close();
		statement.close();
		return provinces;
	}
	public ArrayList<Province> getByRegion(Region reg) throws SQLException{
		String query="select " +
				"`province`.`ID` AS provinceID, \r\n" +
				"`region`.`ID` AS regionID, \r\n" +
				"`region`.`Code` AS regionCode, \r\n" +
				"`region`.`Nom_Fr` AS regionNom_Fr, \r\n" +
				"`region`.`Nom_Ar` AS regionNom_Ar, \r\n" +
				"`province`.`Code` AS provinceCode, \r\n" +
				"`province`.`Nom_Fr` AS provinceNom_Fr, \r\n" +
				"`province`.`Nom_Ar` AS provinceNom_Ar \r\n" +
				"FROM \r\n" +
				"`province`,`region` \r\n" +
				"WHERE \r\n" +
				"(`province`.`RegionID` =  `region`.`ID`) AND \r\n"+
				"(`province`.`RegionID` =  ? );";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
		statement.setInt(1, reg.getId());
		ResultSet rs = statement.executeQuery();
		ArrayList<Province> provinces = new ArrayList<Province>();
		while (rs.next()) {
			Province province = new Province();
			province.setId(rs.getInt("provinceID"));
			Region region = new Region();
			region.setId(rs.getInt("regionID"));
			region.setCode(rs.getString("regionCode"));
			region.setNom_Fr(rs.getString("regionNom_Fr"));
			region.setNom_Ar(rs.getString("regionNom_Ar"));
			province.setRegion(region);
			province.setCode(rs.getString("provinceCode"));
			province.setNom_Fr(rs.getString("provinceNom_Fr"));
			province.setNom_Ar(rs.getString("provinceNom_Ar"));
			provinces.add(province);
		}
		rs.close();
		statement.close();
		return provinces;	
	}
	public Province getById(int id) throws SQLException{
		String query="select " +
		"`province`.`ID` AS provinceID, \r\n" +
		"`region`.`ID` AS regionID, \r\n" +
		"`region`.`Code` AS regionCode, \r\n" +
		"`region`.`Nom_Fr` AS regionNom_Fr, \r\n" +
		"`region`.`Nom_Ar` AS regionNom_Ar, \r\n" +
		"`province`.`Code` AS provinceCode, \r\n" +
		"`province`.`Nom_Fr` AS provinceNom_Fr, \r\n" +
		"`province`.`Nom_Ar` AS provinceNom_Ar \r\n" +
		"FROM \r\n" +
		"`province`,`region` \r\n" +
		"WHERE \r\n" +
		"(`province`.`RegionID` =  `region`.`ID`) AND \r\n"+
		"(`province`.`ID` =  ? );";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
		statement.setInt(1, id);
		ResultSet rs = statement.executeQuery();
		Province province = new Province();
		while (rs.next()) {
			province.setId(rs.getInt("provinceID"));
			Region region = new Region();
			region.setId(rs.getInt("regionID"));
			region.setCode(rs.getString("regionCode"));
			region.setNom_Fr(rs.getString("regionNom_Fr"));
			region.setNom_Ar(rs.getString("regionNom_Ar"));
			province.setRegion(region);
			province.setCode(rs.getString("provinceCode"));
			province.setNom_Fr(rs.getString("provinceNom_Fr"));
			province.setNom_Ar(rs.getString("provinceNom_Ar"));
		}
		rs.close();
		statement.close();
		return province;
	}
	public void update (Province province) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("update province set RegionID = ?, Code = ?, Nom_Fr = ?, Nom_Ar = ? where ID = ?");
		statement.setInt(1, province.getRegion().getId());
		statement.setString(2, province.getCode());
		statement.setString(3, province.getNom_Fr());
		statement.setString(4, province.getNom_Ar());
		statement.setInt(5,province.getId());
		statement.execute();
	}
	public void delete(Province province) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("delete from province where ID = ?");
		statement.setInt(1, province.getId());
		statement.execute();
		statement.close();
	}
}

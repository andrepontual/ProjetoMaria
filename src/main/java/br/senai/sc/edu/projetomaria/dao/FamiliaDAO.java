package br.senai.sc.edu.projetomaria.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import br.senai.sc.edu.projetomaria.model.Familia;
import br.senai.sc.edu.projetomaria.resource.Messages;
import br.senai.sc.edu.projetomaria.resource.SQL;

public class FamiliaDAO extends AbstractDAO {

	private static final Logger LOGGER = LogManager.getLogger();

	public List<Familia> getFamilias() {
		String sql = "SELECT * FROM familia_comercial;";
		List<Familia> familias = new ArrayList<>();
		try (Statement stmt = getConnection().createStatement()) {
			this.readCanais(stmt, sql, familias);
		} catch (SQLException e) {
			LOGGER.debug(e.getSQLState() + " - " + e.getMessage());

		}
		return familias;
	}

	public void readCanais(Statement stmt, String sql, List<Familia> familias) {
		try (ResultSet rs = stmt.executeQuery(sql)) {
			while (rs.next()) {
				Familia familia = new Familia();
				//familia.setId(rs.getInt("ID_FAMILIA"));
				familia.setCodigo(rs.getString("COD_FAMILIA_COMERCIAL"));
				familia.setNome(rs.getString("NOME_FAMILIA_COMERCIAL"));
				familias.add(familia);
			}
		} catch (SQLException e) {
			LOGGER.debug(e.getSQLState() + " - " + e.getMessage());
		}
	}

	public void insert(List<Familia> familia){
		String sql = SQL.INSERT_FAMILIA_INCREMENT;
		try (PreparedStatement stmt = getConnection().prepareStatement(sql)) {
			for (int i = 0; i < familia.size(); i++) {
				stmt.setString(1, familia.get(i).getCodigo());
				stmt.setString(2, familia.get(i).getNome());
				stmt.setString(3, familia.get(i).getNome());
				stmt.execute();
				LOGGER.info(Messages.INSERIR_FAMILIA);
			}
		} catch (SQLException e) {
			LOGGER.debug(e.getMessage());
			LOGGER.debug(Messages.ERRO_FAMILIA_INSERIR);
		}
	}
/*
	public void update(Familia familia) throws SQLException {
		String sql = SQL.UPDATE_FAMILIA;
		try (PreparedStatement stmt = getConnection().prepareStatement(sql)) {
			stmt.setString(1, familia.getCodigo());
			stmt.setString(2, familia.getNome());
			stmt.setInt(3, familia.getId());
			stmt.execute();
			LOGGER.info(Messages.ATUALIZAR_FAMILIA);
		} catch (SQLException e) {
			LOGGER.debug(e.getMessage());
			LOGGER.debug(Messages.ERRO_FAMILIA_ATUALIZAR);
		}

	}*/

	public void delete(List<Familia> familias) throws SQLException {
		Connection conn = getConnection();
		String sql = SQL.DELETE_FAMILIA;
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			for (Familia familia : familias) {
				ps.setString(1, familia.getCodigo());
				ps.execute();
			}
			LOGGER.info(Messages.DELETAR_FAMILIA);
		} catch (SQLException e1) {
			LOGGER.debug(Messages.ERRO_FAMILIA_DELETAR);
			LOGGER.debug(e1.getMessage());
		}finally {
			conn.close();
		}
	}
}

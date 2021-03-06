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

import br.senai.sc.edu.projetomaria.model.Canal;
import br.senai.sc.edu.projetomaria.resource.Messages;
import br.senai.sc.edu.projetomaria.resource.SQL;

public class CanalDAO extends AbstractDAO {

	private static final Logger LOGGER = LogManager.getLogger();

	public List<Canal> getCanais() throws SQLException {
		String sql = SQL.GET_CANAL;
		List<Canal> canais = new ArrayList<>();
		try (Statement stmt = getConnection().createStatement()){
			this.readCanais(stmt, sql, canais);
		} catch (SQLException e) {
			LOGGER.debug(e.getMessage());
			LOGGER.debug(e.getSQLState() + " - " + e.getMessage());
		}
		return canais;
	}
	
	public void readCanais(Statement stmt, String sql, List<Canal> canais){
		try (ResultSet rs = stmt.executeQuery(sql)){
			while (rs.next()) {
				Canal canal = new Canal();
				canal.setId(rs.getInt("ID_CANAL"));
				canal.setDescricao(rs.getString("DESCRICAO"));
				canais.add(canal);
			}
		} catch (SQLException e){
			LOGGER.debug(e.getMessage());
			LOGGER.debug(e.getSQLState() + " - " + e.getMessage());
		}
	}

	public void insert(List<Canal> canal){
		String sql =  SQL.INSERT_CANAL;
		try (PreparedStatement stmt =  getConnection().prepareStatement(sql)){
			for (Canal cn : canal) {
				stmt.setString(1, cn.getDescricao());
				stmt.execute();				
				LOGGER.info(Messages.SUCESSO_CANAL_INSERIR);
			}
		} catch (SQLException e) {
			LOGGER.debug(e.getMessage());
			LOGGER.debug(Messages.ERRO_CANAL_INSERIR);
		}
	}
	public void update(Canal canal) throws SQLException {
		String sql = SQL.UPDATE_CANAL;
		try (PreparedStatement stmt =  getConnection().prepareStatement(sql)){
			stmt.setString(1, canal.getDescricao());
			stmt.setInt(2, canal.getId());
			stmt.execute();
			LOGGER.info(Messages.SUCESSO_CANAL_ATUALIZAR);
		} catch (SQLException e) {
			LOGGER.debug(e.getMessage());
			LOGGER.debug(Messages.ERRO_CANAL_ATUALIZAR);
		}

	}
	public void delete(List<Canal> canais) throws SQLException {
		Connection conn = getConnection();
		String sql = SQL.DELETE_CANAL;
		try (PreparedStatement ps = conn.prepareStatement(sql)){
			for (Canal canal : canais) {
				ps.setInt(1, canal.getId());
				ps.execute();
			}
			LOGGER.info(Messages.SUCESSO_CANAL_DELETAR);
		} catch (SQLException e1) {
			LOGGER.debug(Messages.ERRO_CANAL_DELETAR);
			LOGGER.debug(e1.getMessage());
		}finally {
			conn.close();
		}
	}
}

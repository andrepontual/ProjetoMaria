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
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import br.senai.sc.edu.projetomaria.model.RetornoHistorico;
import br.senai.sc.edu.projetomaria.resource.Messages;

public class EstimativaDAO extends AbstractDAO {
	private static final Logger LOGGER = LogManager.getLogger();
	DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyy-MM-dd");
	DateTimeFormatter fmt1 = DateTimeFormat.forPattern("dd-MM-yyyy");
	
	public List<Integer> listarSKU() {
		String sql = "SELECT SKU FROM PRODUTO WHERE SKU IN (SELECT PRODUTO_SKU FROM HISTORICO WHERE "
				+ "MES_ANO > (SELECT DATE_ADD(SYSDATE(),INTERVAL -6 MONTH))) GROUP BY SKU;";
		List<Integer> listSku = new ArrayList<>();

		try (Connection conn = getConnection();
				Statement stmt = conn.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery(sql);) {

			while (rs.next()) {
				Integer sku;
				sku = rs.getInt("SKU");
				listSku.add(sku);
			}
		} catch (SQLException e) {
			LOGGER.info(Messages.BD_ERRO_CONEXAO);
		}
		return listSku;
	}
	
	public List<Integer> listarSKU_OUT(Integer sku) {
		String sql = "SELECT SKU_PHASE_OUT FROM SKU_PHASE WHERE SKU_PHASE_IN = " + sku + ";";
		List<Integer> listaSkuPhase = new ArrayList<>();
		
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			
			while (rs.next()) {
				Integer sku_out;
				sku_out = rs.getInt("SKU_PHASE_OUT");
				listaSkuPhase.add(sku_out);
			}
		}
			catch (SQLException e) {
			LOGGER.info(Messages.BD_ERRO_CONEXAO);
		}
			return listaSkuPhase;
}
	
	public RetornoHistorico listaHistorico(Integer sku, DateTime data1) {
		String data = fmt.print(data1);
		String sql = "SELECT SUM(QUANTIDADE),MES_ANO FROM HISTORICO WHERE PRODUTO_SKU IN (SELECT SKU_PHASE_OUT "
			 		+ "FROM SKU_PHASE WHERE SKU_PHASE_IN = " + sku + " AND MES_ANO >= ' " + data + " ') "
			 				+ "OR PRODUTO_SKU = " + sku + " AND MES_ANO >= ' " + data + " ' GROUP BY MES_ANO ORDER BY MES_ANO ASC;";
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {

			RetornoHistorico listaValor = new RetornoHistorico();
			
			List<Double> listaHistorico = new ArrayList<>();
			List<Double> listaDemanda = new ArrayList<>();
			List<DateTime> listaSkuData = new ArrayList<>();
			
			while (rs.next()) {
				Double skuHistorico;
				DateTime skuDataBanco;
				skuHistorico = rs.getDouble("SUM(QUANTIDADE)");
				
				DateTime dt = new DateTime(rs.getDate("MES_ANO"));
				skuDataBanco = dt;
				listaHistorico.add(skuHistorico);
				listaDemanda.add(skuHistorico);
				listaSkuData.add(skuDataBanco);
				
			}
			
			listaValor.setListaValor(listaHistorico);
			listaValor.setListaDataSku(listaSkuData);
			listaValor.setListaDemanda(listaDemanda);
			
			return listaValor;
				
		} catch (SQLException e) {
			LOGGER.info(Messages.BD_ERRO_CONEXAO);
		}
			RetornoHistorico retorno = new RetornoHistorico();
		return retorno;
	}
}

package br.senai.sc.edu.projetomaria.io;

import java.util.ArrayList;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import br.senai.sc.edu.projetomaria.dao.EstimativaDAO;
import br.senai.sc.edu.projetomaria.model.Resultado;
import br.senai.sc.edu.projetomaria.model.RetornoHistorico;
import br.senai.sc.edu.projetomaria.stat.CalculoPI;

public class Estimativa {
	DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy");
	Double menorEqm = 0.0;
	Double valorEqm = 0.0;
	
	public List<Resultado> calculo(DateTime data1, DateTime data2) {
		List<Resultado> result = new ArrayList<>();
		EstimativaDAO dao = new EstimativaDAO();
		List<Integer> listaSku = dao.listarSKU();
		
		
		for (int i = 0; i < listaSku.size(); i++) {
			
			RetornoHistorico retornoLista =  dao.listaHistorico(listaSku.get(i), data1);
			List<Integer> listaSkuOut = dao.listarSKU_OUT(listaSku.get(i));
			
			List<Double> listaHistorico = new ArrayList<>();
			listaHistorico = retornoLista.getListaValor();
			List<Double> listaDemanda = new ArrayList<>();
			listaDemanda = retornoLista.getListaDemanda();
			DateTime dataIniciop = new DateTime();
			dataIniciop = retornoLista.getListaDataSku().get(0);
			
			CalculoPI media_2 = new CalculoPI();
				media_2.setTamMediaMovel(2);
				List<Double> listaHistorico_2 = new ArrayList<>(listaHistorico);
				media_2.setListaHistorico(listaHistorico_2);
				media_2.setDataInicioPrevisao(dataIniciop);
				media_2.setDataFinalPrevisao(data2);
				media_2.calcularMediaMovel();
				media_2.calcularMenorAlpha();
				media_2.calcuarSuavizacaoExponencial(media_2.getValorAlpha());
				media_2.calcularEqmMM();
				media_2.calcularEqmSV();
			
			CalculoPI media_4 = new CalculoPI();	
				media_4.setTamMediaMovel(4);
				List<Double> listaHistorico_4 = new ArrayList<>(listaHistorico);
				media_4.setListaHistorico(listaHistorico_4);
				media_4.setDataInicioPrevisao(dataIniciop);
				media_4.setDataFinalPrevisao(data2);
				media_4.calcularMediaMovel();
				media_4.calcularMenorAlpha();
				media_4.calcuarSuavizacaoExponencial(media_4.getValorAlpha());
				media_4.calcularEqmMM();
				media_4.calcularEqmSV();
			
			CalculoPI media_6 = new CalculoPI();
				media_6.setTamMediaMovel(6);
				List<Double> listaHistorico_6 = new ArrayList<>(listaHistorico);
				media_6.setListaHistorico(listaHistorico_6);
				media_6.setDataInicioPrevisao(dataIniciop);
				media_6.setDataFinalPrevisao(data2);
				media_6.calcularMediaMovel();
				media_6.calcularMenorAlpha();
				media_6.calcuarSuavizacaoExponencial(media_6.getValorAlpha());
				media_6.calcularEqmMM();
				media_6.calcularEqmSV();
			
			List<Double> listaEqm = new ArrayList<>();
			listaEqm.add(media_2.getEqm());
			listaEqm.add(media_4.getEqm());
			listaEqm.add(media_6.getEqm());
			listaEqm.add(media_2.getEqmSV());
			listaEqm.add(media_4.getEqmSV());
			listaEqm.add(media_6.getEqmSV());
			
			int cont = 0;
			do{
				valorEqm = listaEqm.get(cont);
				cont ++;
			if(cont==1){
				menorEqm = valorEqm;
			}else{
				if(valorEqm < menorEqm){
					menorEqm = valorEqm;
				}
			}
			}while(cont < listaEqm.size());
				
			Resultado r = new Resultado();
			r.setSKU(listaSku.get(i));	
			r.setDataInicioPrevisao(dataIniciop);
			r.setDataFinalPrevisao(data2);
			r.setListaMediaMovel_2(media_2.getListaMediaMovel());
			r.setListaMediaMovel_4(media_4.getListaMediaMovel());
			r.setListaMediaMovel_6(media_6.getListaMediaMovel());
			r.setListaSuavizacaoExponencial_2(media_2.getListaSuavizacaoExponencial());
			r.setListaSuavizacaoExponencial_4(media_4.getListaSuavizacaoExponencial());
			r.setListaSuavizacaoExponencial_6(media_6.getListaSuavizacaoExponencial());
			r.setEqm_2(media_2.getEqm());
			r.setEqm_4(media_4.getEqm());
			r.setEqm_6(media_6.getEqm());
			r.setEqmSV_2(media_2.getEqmSV());
			r.setEqmSV_4(media_4.getEqmSV());
			r.setEqmSV_6(media_6.getEqmSV());
			r.setValorAlpha_2(media_2.getValorAlpha());
			r.setValorAlpha_4(media_4.getValorAlpha());
			r.setValorAlpha_6(media_6.getValorAlpha());
			r.setDataResultado(data2);
			r.setListaHistorico(media_2.getListaHistorico());
			r.setListaDemanda(listaDemanda);
			r.popularListaDemanda(); 
			r.setMenorEqm(menorEqm);
			r.setListaSkuOut(listaSkuOut);
			result.add(r);
		}
		return result;
	}
}
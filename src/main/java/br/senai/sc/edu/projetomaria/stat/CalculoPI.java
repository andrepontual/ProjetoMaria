package br.senai.sc.edu.projetomaria.stat;
import java.util.Deque;
import java.util.LinkedList;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.Months;

public class CalculoPI {

	private Deque<Double> Media;
	private double soma;
	private double eqm;
	private double eqmSV;
	private int tamMediaMovel;
	private int previsao;
	private List<Double> listaMediaMovel;
	private List<Double> listaHistorico;
	private List<Double> listaSuavizacaoExponencial;
	private Deque<Double> mediaMovel;
	private Double menorValor;
	private Double valorAlpha;
	private DateTime dataInicioPrevisao;
	private DateTime dataFinalPrevisao;
	private double alpha;
	
	public CalculoPI() {
		super();
	}

	public CalculoPI(int tamMediaMovel, List<Double> listaHistorico, DateTime dataInicioPrevisao,
			DateTime dataFinalPrevisao) {
		super();
		this.tamMediaMovel = tamMediaMovel;
		this.listaHistorico = listaHistorico;
		this.dataInicioPrevisao = dataInicioPrevisao;
		this.dataFinalPrevisao = dataFinalPrevisao;
	}

	public Double getMenorValor() {
		return menorValor;
	}

	public void setMenorValor(Double menorValor) {
		this.menorValor = menorValor;
	}

	public Double getValorAlpha() {
		return valorAlpha;
	}

	public void setValorAlpha(Double valorAlpha) {
		this.valorAlpha = valorAlpha;
	}

	public double getEqmSV() {
		return eqmSV;
	}

	public void setEqmSV(double eqmSV) {
		this.eqmSV = eqmSV;
	}

	public double getAlpha() {
		return alpha;
	}

	public void setAlpha(double alpha) {
		this.alpha = alpha;
	}

	public DateTime getDataInicioPrevisao() {
		return dataInicioPrevisao;
	}

	public void setDataInicioPrevisao(DateTime dataInicioPrevisao) {
		this.dataInicioPrevisao = dataInicioPrevisao;
	}

	public DateTime getDataFinalPrevisao() {
		return dataFinalPrevisao;
	}

	public void setDataFinalPrevisao(DateTime dataFinalPrevisao) {
		this.dataFinalPrevisao = dataFinalPrevisao;
	}

	public double getEqm() {
		return eqm;
	}

	public void setEqm(double eqm) {
		this.eqm = eqm;
	}

	public Deque<Double> getMediaMovel() {
		return mediaMovel;
	}

	public void setMediaMovel(Deque<Double> mediaMovel) {
		this.mediaMovel = mediaMovel;
	}

	public Deque<Double> getMedia() {
		return Media;
	}

	public void setMedia(Deque<Double> media) {
		Media = media;
	}

	public double getSoma() {
		return soma;
	}

	public void setSoma(double soma) {
		this.soma = soma;
	}

	public int getTamMediaMovel() {
		return tamMediaMovel;
	}

	public void setTamMediaMovel(int tamMediaMovel) {
		this.tamMediaMovel = tamMediaMovel;
	}
	
	public int getPrevisao() {
		return previsao;
	}

	public void setPrevisao(int previsao) {
		this.previsao = previsao;
	}

	public List<Double> getListaSuavizacaoExponencial() {
		return listaSuavizacaoExponencial;
	}

	public void setListaSuavizacaoExponencial(List<Double> listaSuavizacaoExponencial) {
		this.listaSuavizacaoExponencial = listaSuavizacaoExponencial;
	}

	public List<Double> getListaMediaMovel() {
		return listaMediaMovel;
	}

	public void setListaMediaMovel(List<Double> listaMediaMovel) {
		this.listaMediaMovel = listaMediaMovel;
	}

	public List<Double> getListaHistorico() {
		return listaHistorico;
	}

	public void setListaHistorico(List<Double> listaHistorico) {
		this.listaHistorico = listaHistorico;
			
	}
		
	public void calcularMediaMovel(){
		
		mediaMovel = new LinkedList<Double>();
		listaMediaMovel = new LinkedList<Double>();
		double soma = 0.0;
		
		for (int j = 0; j < calcularNumeroPrevisoes(); j++) {
				listaHistorico.add(0.0);
			}
			for ( int i = 0; i < listaHistorico.size(); i++) {
				if(mediaMovel.size() < tamMediaMovel) {
					listaMediaMovel.add(0.0);
					soma += listaHistorico.get(i);
					mediaMovel.add(listaHistorico.get(i));
				}else{
					if(listaHistorico.get(i) == 0.0) {
						listaMediaMovel.add(i, (double) Math.round(soma / tamMediaMovel));
						listaHistorico.set(i, (double) Math.round(soma / tamMediaMovel));
						soma -= mediaMovel.removeFirst();
						soma += listaMediaMovel.get(i);
						mediaMovel.add(listaMediaMovel.get(i));
				}else {
					listaMediaMovel.add((double) Math.round(soma / tamMediaMovel));
					soma -= mediaMovel.removeFirst();
					soma += listaHistorico.get(i);
					mediaMovel.add(listaHistorico.get(i));
				}
				}
			}
	}
	
	public void calcularEqmMM() { 
		double soma = 0.0;
		int tamanho = calcularPeriodo() - this.getTamMediaMovel();
		for (int i = 0; i < tamanho; i++) {
			soma += Math.pow(Math.abs(getListaHistorico().get(i+getTamMediaMovel()) - getListaMediaMovel().get(i+getTamMediaMovel())), 2);
		}
		eqm = soma / tamanho;
	}
	
	public void calcularEqmSV() { 
		double soma = 0.0;
		int tamanho = getListaHistorico().size();
		for (int i = 0; i < tamanho; i++) {
			soma += Math.pow(Math.abs(getListaHistorico().get(i) - getListaSuavizacaoExponencial().get(i)), 2);
		}
		eqmSV = soma / tamanho;
	}
	
	public int calcularPeriodo() {
		return Months.monthsBetween(getDataInicioPrevisao(), getDataFinalPrevisao()).getMonths()+1;
	
	}
	public int calcularNumeroPrevisoes() {
		/*lembrar de zerar a data para previsoes definitivas*/
		DateTime hoje = new DateTime(2018, 10, 01,0,0,0);  
		return Months.monthsBetween(hoje, getDataFinalPrevisao()).getMonths();
	}

	public void calcuarSuavizacaoExponencial(Double alpha) {
		this.alpha = alpha;
		List<Double> prev = getListaHistorico();
		listaSuavizacaoExponencial = new LinkedList<>();
		double suave = 0.0;
		listaSuavizacaoExponencial.add((double)prev.get(0));
		for (int i = 1; i < prev.size(); i++) {
			suave = listaSuavizacaoExponencial.get(i-1) + alpha * (prev.get(i-1) - listaSuavizacaoExponencial.get(i-1));
			listaSuavizacaoExponencial.add(suave);
		}
		
	}

	public void calcularMenorAlpha() {
		double i = 0.001;
		double valor;
		double menorValor = 0;
		double menorAlpha = 0;
		while (i <= 1.0) {
			setAlpha(i);
			this.calcuarSuavizacaoExponencial(i);
			this.calcularEqmSV();
			valor = this.getEqmSV();
			if(menorValor == 0.0){
				menorValor = this.getEqmSV();
				menorAlpha = i;
			}else {			
			if (valor < menorValor  ) {
				menorValor = valor;
				menorAlpha = i;
			}
			i += 0.001;
		}
			setValorAlpha(menorAlpha);
			setMenorValor(menorValor);
		}
		
	}
	
}

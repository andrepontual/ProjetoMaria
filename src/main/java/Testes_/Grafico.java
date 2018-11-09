package Testes_;
import java.awt.Color;
import java.io.IOException;
import java.util.List;

import javax.swing.JFrame;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.category.DefaultCategoryDataset;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class Grafico extends JFrame{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int sku;
	DateTimeFormatter fmt = DateTimeFormat.forPattern("MM/yyyy");
	
	public Grafico(
			List<Double> Lista_1,
			List<Double> Lista_2,
			List<Double> Lista_3,
			List<Double> Lista_4,
			List<Double> Lista_5,
			List<Double> Lista_6,
			List<Double> Lista_7, 
			int sku,
			DateTime dataInicio) {
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setSize(1200, 900);
		setLocationRelativeTo(null);
		criarGrafico(Lista_1, Lista_2, Lista_3, Lista_4, Lista_5, Lista_6, Lista_7, sku, dataInicio);
		setVisible(true);
	}
	
	public void criarGrafico(
			List<Double> Lista_1,
			List<Double> Lista_2,
			List<Double> Lista_3,
			List<Double> Lista_4,
			List<Double> Lista_5,
			List<Double> Lista_6,
			List<Double> Lista_7,
			int sku,
			DateTime dataInicio) {
		DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
		List<Double> previsao_1 = Lista_1;
		List<Double> previsao_2 = Lista_2;
		List<Double> previsao_3 = Lista_3;
		List<Double> previsao_4 = Lista_4;
		List<Double> previsao_5 = Lista_5;
		List<Double> previsao_6 = Lista_6;
		List<Double> previsao_7 = Lista_7;
		int cont = 1;
		String datax = null; 
		for(int i = 0; i < previsao_2.size(); i++) {
			datax = fmt.print(dataInicio.plusMonths(cont));
			dataSet.setValue(previsao_1.get(i), "Historico" ,String.valueOf(datax));
			cont++;
		}
		cont = 1;
		for(int j = 0; j < previsao_2.size(); j++) {
			datax = fmt.print(dataInicio.plusMonths(cont));
			dataSet.setValue(previsao_2.get(j), "Previsao MM - 2" ,String.valueOf(datax));
			cont++;
		}
		cont = 1;
		for(int k = 0; k < previsao_2.size(); k++) {
			datax = fmt.print(dataInicio.plusMonths(cont));
			dataSet.setValue(previsao_3.get(k), "Previsao MM - 4" ,String.valueOf(datax));
			cont++;
		}
		cont = 1;
		for(int l = 0; l < previsao_2.size(); l++) {
			datax = fmt.print(dataInicio.plusMonths(cont));
			dataSet.setValue(previsao_4.get(l), "Previsao MM - 6" ,String.valueOf(datax));
			cont++;
		}
		cont = 1;
		for(int m = 0; m < previsao_2.size(); m++) {
			datax = fmt.print(dataInicio.plusMonths(cont));
			dataSet.setValue(previsao_5.get(m), "Previsao SE - 2" ,String.valueOf(datax));
			cont++;
		}
		cont = 1;
		for(int n = 0; n < previsao_2.size(); n++) {
			datax = fmt.print(dataInicio.plusMonths(cont));
			dataSet.setValue(previsao_6.get(n), "Previsao SE - 4" ,String.valueOf(datax));
			cont++;
		}
		cont = 1;
		for(int o = 0; o < previsao_2.size(); o++) {
			datax = fmt.print(dataInicio.plusMonths(cont));
			dataSet.setValue(previsao_7.get(o), "Previsao SE - 6" ,String.valueOf(datax));
			cont++;
		}
		
		JFreeChart grafico = ChartFactory.createLineChart(
				"Sku: " + sku,
				"Data",
				"Valor",
				dataSet,
				PlotOrientation.VERTICAL,
				true,
				true,
				false
				);
		final CategoryPlot plot = grafico.getCategoryPlot();
			plot.setBackgroundPaint(Color.white);
			plot.setRenderer(0, new LineAndShapeRenderer());
			plot.setRangeGridlinePaint(Color.BLACK);
			plot.setDomainCrosshairColumnKey(datax);
			
			org.jfree.chart.axis.CategoryAxis eixo = grafico.getCategoryPlot().getDomainAxis();
			eixo.setCategoryLabelPositions(CategoryLabelPositions.UP_90);
				
		ChartPanel painel = new ChartPanel(grafico);
		add(painel);
		try {
			ChartUtilities.saveChartAsJPEG(new java.io.File("G:/D O C U M E N T O S/D O R I Z I O/SENAI/Eclipese_N/ProjetoMaria/dist/Grafico_Sku - " + sku +".jpg"), grafico, 1200, 900);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}

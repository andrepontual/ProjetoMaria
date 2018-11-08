package Testes_;
import java.awt.Color;
import java.util.List;

import javax.swing.JFrame;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.category.DefaultCategoryDataset;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import javafx.scene.chart.CategoryAxis;

public class Grafico extends JFrame{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int sku;
	DateTimeFormatter fmt = DateTimeFormat.forPattern("MM/yyyy");
	
	public Grafico(List<Double> Lista,
					List<Double> Lista_2,
					List<Double> Lista_3,
					List<Double> Lista_4,
					List<Double> Lista_5,
					List<Double> Lista_6, 
					int sku,
					DateTime dataInicio) {
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setSize(1200, 900);
		setLocationRelativeTo(null);
		criarGrafico(Lista, Lista_2, Lista_3, Lista_4, Lista_5, Lista_6, sku, dataInicio);
		setVisible(true);
	}
	
	public void criarGrafico(List<Double> Lista,
							List<Double> Lista_2,
							List<Double> Lista_3,
							List<Double> Lista_4,
							List<Double> Lista_5,
							List<Double> Lista_6,
							int sku,
							DateTime dataInicio) {
		DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
		List<Double> previsao = Lista;
		List<Double> previsao_2 = Lista_2;
		List<Double> previsao_3 = Lista_3;
		List<Double> previsao_4 = Lista_4;
		List<Double> previsao_5 = Lista_5;
		List<Double> previsao_6 = Lista_6;
		DateTime dataIni = dataInicio;
		String datax = null; 
		for(int i = 2; i < previsao.size(); i++) {
			datax = fmt.print(dataIni.plusMonths(i));
			dataSet.setValue(previsao.get(i), "Previsao MM - 2" ,String.valueOf(datax));
		}
		for(int j = 4; j < previsao_2.size(); j++) {
			datax = fmt.print(dataIni.plusMonths(j));
			dataSet.setValue(previsao_2.get(j), "Previsao MM - 4" ,String.valueOf(datax));
		}
		for(int k = 6; k < previsao_3.size(); k++) {
			datax = fmt.print(dataIni.plusMonths(k));
			dataSet.setValue(previsao_3.get(k), "Previsao MM - 6" ,String.valueOf(datax));
		}
		for(int l = 2; l < previsao_4.size(); l++) {
			datax = fmt.print(dataIni.plusMonths(l));
			dataSet.setValue(previsao_4.get(l), "Previsao SE - 2" ,String.valueOf(datax));
		}
		for(int m = 2; m < previsao_5.size(); m++) {
			datax = fmt.print(dataIni.plusMonths(m));
			dataSet.setValue(previsao_5.get(m), "Previsao SE - 4" ,String.valueOf(datax));
		}
		for(int n = 2; n < previsao_6.size(); n++) {
			datax = fmt.print(dataIni.plusMonths(n));
			dataSet.setValue(previsao_6.get(n), "Previsao SE - 6" ,String.valueOf(datax));
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
			org.jfree.chart.axis.CategoryAxis eixo = grafico.getCategoryPlot().getDomainAxis();
			eixo.setCategoryLabelPositions(CategoryLabelPositions.UP_90);
		
			
	        
				
		ChartPanel painel = new ChartPanel(grafico);
		add(painel);
	}

	
}

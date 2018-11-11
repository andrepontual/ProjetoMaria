package br.senai.sc.edu.projetomaria.grafico;
import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;

import javax.swing.JFrame;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.title.LegendTitle;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.RectangleEdge;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class Grafico extends JFrame{

	private static final long serialVersionUID = 1L;
	int sku;
	DateTimeFormatter fmt = DateTimeFormat.forPattern("MM/yyyy");
	Path pastaArquivo = null;
	public Grafico(
			List<Double> Lista_1,
			List<Double> Lista_2,
			List<Double> Lista_3,
			List<Double> Lista_4,
			List<Double> Lista_5,
			List<Double> Lista_6,
			List<Double> Lista_7,
			int sku,
			DateTime dataInicio,
			DateTime dataFinal,
			Path pastaArquivo,
			List<Integer> ListaSkuOut
			) {
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setSize(1200, 900);
		setLocationRelativeTo(null);
		criarGrafico(
				Lista_1, 
				Lista_2,
				Lista_3, 
				Lista_4, 
				Lista_5, 
				Lista_6, 
				Lista_7, 
				sku, 
				dataInicio,
				dataFinal,
				pastaArquivo,
				ListaSkuOut
				);
		setVisible(false);
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
			DateTime dataInicio,
			DateTime dataFinal,
			Path pastaArquivo,
			List<Integer> ListaSkuOut
			) {
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
			dataSet.setValue(previsao_1.get(i), "Historico", String.valueOf(datax));
			cont++;
		}
		cont = 1;
		for(int j = 0; j < previsao_2.size(); j++) {
		
			if (previsao_2.get(j) == 0.0) {
				datax = fmt.print(dataInicio.plusMonths(cont));
				dataSet.setValue(null, "Previsao MM-2" ,String.valueOf(datax));
			} else {
				datax = fmt.print(dataInicio.plusMonths(cont));
				dataSet.setValue(previsao_2.get(j), "Previsao MM-2", String.valueOf(datax));
			}
			cont++;
		}
		cont = 1;
		for(int k = 0; k < previsao_2.size(); k++) {
			if (previsao_3.get(k) == 0.0) {
				datax = fmt.print(dataInicio.plusMonths(cont));
				dataSet.setValue(null, "Previsao MM-4" ,String.valueOf(datax));
			} else {
				datax = fmt.print(dataInicio.plusMonths(cont));
				dataSet.setValue(previsao_3.get(k), "Previsao MM-4", String.valueOf(datax));
			}
			cont++;
		}
		cont = 1;
		for(int l = 0; l < previsao_2.size(); l++) {
			if (previsao_4.get(l) == 0.0) {
				datax = fmt.print(dataInicio.plusMonths(cont));
				dataSet.setValue(null, "Previsao MM-6", String.valueOf(datax));
			} else {
				datax = fmt.print(dataInicio.plusMonths(cont));
				dataSet.setValue(previsao_4.get(l), "Previsao MM-6", String.valueOf(datax));
			}
			cont++;
		}
		cont = 1;
		for(int m = 0; m < previsao_2.size(); m++) {
			datax = fmt.print(dataInicio.plusMonths(cont));
			dataSet.setValue(previsao_5.get(m), "Previsao SE-2" ,String.valueOf(datax));
			cont++;
		}
		cont = 1;
		for(int n = 0; n < previsao_2.size(); n++) {
			datax = fmt.print(dataInicio.plusMonths(cont));
			dataSet.setValue(previsao_6.get(n), "Previsao SE-4" ,String.valueOf(datax));
			cont++;
		}
		cont = 1;
		for(int o = 0; o < previsao_2.size(); o++) {
			datax = fmt.print(dataInicio.plusMonths(cont));
			dataSet.setValue(previsao_7.get(o), "Previsao SE-6" ,String.valueOf(datax));
			cont++;
		}
		
		JFreeChart grafico = ChartFactory.createLineChart(
				"Sku: " + sku + "\n Previsão de: " + fmt.print(dataInicio.plusMonths(1)) +
				" até: " + fmt.print(dataFinal) + ( ListaSkuOut.size() == 0  ? "" : " \nSku Componente: " + ListaSkuOut ),
				"Data",
				"Valor",
				dataSet,
				PlotOrientation.VERTICAL,
				true,
				true,
				false
				);
		
			CategoryPlot plot = grafico.getCategoryPlot();
			grafico.removeLegend();
			
			plot.setBackgroundPaint(Color.getHSBColor(10, 00, 10));
			plot.setRenderer(0, new LineAndShapeRenderer());
			plot.setRangeGridlinePaint(Color.BLACK);
			plot.setDomainCrosshairColumnKey(datax);
			
			CategoryItemRenderer render = plot.getRenderer();
			
			render.setSeriesPaint(0, Color.BLUE);
			render.setSeriesPaint(1, Color.GREEN);
			render.setSeriesPaint(2, Color.RED);
			render.setSeriesPaint(3, Color.MAGENTA);
			render.setSeriesPaint(4, Color.ORANGE);
			render.setSeriesPaint(5, Color.PINK);
			render.setSeriesPaint(6, Color.BLACK);
			
			render.setSeriesStroke(0, new BasicStroke(1.75f));
			render.setSeriesStroke(1, new BasicStroke(1.75f));
			render.setSeriesStroke(2, new BasicStroke(1.75f));
			render.setSeriesStroke(3, new BasicStroke(1.75f));
			render.setSeriesStroke(4, new BasicStroke(1.75f));
			render.setSeriesStroke(5, new BasicStroke(1.75f));
			render.setSeriesStroke(6, new BasicStroke(1.75f));
			
			org.jfree.chart.axis.CategoryAxis eixox = plot.getDomainAxis();
			eixox.setLowerMargin(0.01);
							
			Font font = new Font("Dialog", Font.BOLD, 13);
			
			org.jfree.chart.axis.ValueAxis ex = plot.getRangeAxis();
			
			ex.setTickLabelFont(font);
			eixox.setCategoryLabelPositions(CategoryLabelPositions.UP_45);
			eixox.setTickLabelFont(font);
			
			LegendTitle legenda = new LegendTitle(plot);
			legenda.setItemFont(font);
			legenda.setPosition(RectangleEdge.BOTTOM);
			grafico.addLegend(legenda);
				
		ChartPanel painel = new ChartPanel(grafico);
		add(painel);
		try {
			
			ChartUtilities.saveChartAsJPEG(
					new java.io.File( 
							pastaArquivo.getParent() + "/Grafico_Sku - " + sku +".jpg"
							),
					grafico,
					1200,
					900
					);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

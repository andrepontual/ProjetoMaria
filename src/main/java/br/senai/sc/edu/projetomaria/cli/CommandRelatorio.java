package br.senai.sc.edu.projetomaria.cli;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.beust.jcommander.Parameter;
import com.beust.jcommander.Parameters;
import com.beust.jcommander.converters.PathConverter;

@Parameters(commandDescription = "Gera��o de relat�rios")
public class CommandRelatorio {
	DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy");
	@Parameter(description = "<caminho para o arquivo de sa�da>", required = true, converter =  PathConverter.class)
	private Path arquivo = null;
	
	@Parameter(names = {"-t", "--tipo" }, required = true, description = "Tipo do relat�rio")
	private RelatorioEnum tipo = null;		
	
	@Parameter(names = "-data", required = false, description = "Uma data para o in�cio e outra para o fim da previs�o")
	private List<String> datas;
	
	public Path getArquivo() {
		return arquivo;
	}

	public RelatorioEnum getTipo() {
		return tipo;
	}

	public DateTime getDataIncial() {
		DateTime data1;
		 data1 = fmt.parseDateTime(datas.get(0));
		return data1;
	}

	public DateTime getDataPrevisao() {
		DateTime data2;
		data2 = fmt.parseDateTime(datas.get(1));
		return data2;
		
	}
	public boolean isValidParameters() {
		return this.arquivo != null && Files.isReadable(this.arquivo) && this.tipo != null;
	}
	
	
}

module SqlToXls
	module SqlToXlsTemple

    include SqlToXls::SqlToXlsIo		

	def temple_report(temple_path,sql,start_row)
      report = execute_sql(sql)
      add_size = report.first&.size
      start_row = start_row.to_i
      file = Spreadsheet.open temple_path

      list = file.worksheet  0

      # 默认sql的列数要和xls模板列数对应
      report.each_with_index do |detail,index|
        add_size.times do |i|
           list[index+start_row,i] = detail[i]
        end
      end

      xls_report = StringIO.new
      file.write xls_report
      xls_report.string
	end

	end
end

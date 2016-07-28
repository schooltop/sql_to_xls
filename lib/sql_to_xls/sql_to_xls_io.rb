module SqlToXls
	module SqlToXlsIo

	    def init_sql(columns,sql,search_date = Time.now)
		    # 解析SQL
		    reports = execute_sql(sql)
		    # 生成EXCELL
		    to_xlsx(columns,reports,search_date)
		end

		def execute_sql(sql)
		  #执行报表sql查询
		  cullent_attributes = ActiveRecord::Base.connection.execute(sql)
		end

		def to_xlsx(columns,reports,search_date)
		  # 生成EXCELL
		    file = Spreadsheet::Workbook.new
	 
		    list = file.create_worksheet :name => search_date.to_s(:db)
		    list.row(0).concat columns
		 
		    reports.each_with_index { |report, i|
	          list.row(i+1).concat report
		    }

		    xls_report = StringIO.new 
		    file.write xls_report  
	        xls_report.string 
		end

	end
end

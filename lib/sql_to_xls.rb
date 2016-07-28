require "sql_to_xls/version"
require 'sql_to_xls/sql_to_xls_io'
require 'sql_to_xls/sql_to_xls_temple'

module SqlToXls
  include SqlToXls::SqlToXlsIo
  include SqlToXls::SqlToXlsTemple
end

ActiveRecord::Base.extend(StWhere)

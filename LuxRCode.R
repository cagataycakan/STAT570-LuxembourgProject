

# Packages ----------------------------------------------------------------

library(dplyr)
library(purrr)
library(readxl)
library(stringr)
library(janitor)

url = 'https://is.gd/1vvBAc'

raw_data = tempfile(fileext = '.xlsx')

download.file(url, raw_data, method = 'auto', mode = 'wb')

sheets = excel_sheets(raw_data)

raw_data = map(
  sheets,
  ~read_clean(raw_data,
              skip = 10,
              sheet =.)
) |> 
  bind_rows() |> 
  clean_names()





### ctrl + shift + M -> pipe



library(rvest)

url = 'https://en.wikipedia.org/wiki/Template:NHL_team_abbreviations'

page <- read_html(url)

t.node <- page %>% 
  rvest::html_node(xpath = '//*[@id="mw-content-text"]/div/div/table/tbody/tr[2]/td/div/div')

list.nodes <- t.node %>% 
  html_nodes('li') %>%
  html_text()%>% 
  strsplit(' – ') %>%
  unlist()

team_table <- matrix(list.nodes, ncol = 2, byrow = TRUE) %>% as_tibble(.name_repair = 'unique')
names(team_table) <- c('tm', 'team_name')


write.csv(team_table, './_GognUt/tm_names.csv', row.names = FALSE)


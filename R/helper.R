# Fonction pour combiner les variables d'intérêt de df1 et df2 pour l'année de notre choix 

big_table_year <- function(annee) {
    ghg_gdp_1year <- df1 %>% 
        filter(year == annee)
    life_exp_1year <- df2 %>% 
        filter(year == annee)
    life_exp_1year %>% 
        select(-country, -year) %>% 
        left_join(ghg_gdp_1year, by = "iso_code")
}

# Il manque beaucoup de données dans df1 pour les années les plus récentes, donc nous procédons aux analyses avec l'année 2015 

big_table_2010 <- big_table_year(annee = 2010)
big_table_2015 <- big_table_year(annee = 2015)
big_table_2020 <- big_table_year(annee = 2020)

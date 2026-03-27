# --- 
# Projeto: Análise de Emendas de Porto Velho
# Autor: Junior
# Data: 2026
# Download CSV: https://basedosdados.org/dataset/257e000c-1685-418a-88d9-4908ccef2840?table=f116068d-b65d-4d04-9bcb-368e70062c4b
# ---

emendas_por_tipo <- emendas |> 
  filter(sigla_uf_gasto == "RO") |>
  group_by(nome_subfuncao)  |> 
  summarise ( contagem = n() )

print(emendas_por_tipo )
ggplot(emendas_por_tipo, aes(x = reorder(nome_subfuncao, contagem), y = contagem)) + geom_bar(stat = "Identity" ) +
  coord_flip() +
  labs(
    title = "Emendas por Subfunção - Município Porto Velho-RO",
    x = "Área de Atuação (Subfunção)",
    y = "Número de Emendas Recebidas",
    caption = "Fonte: Dados Abertos / Feito por Junior"
  ) +
  theme_minimal(base_size = 12) + 
  scale_fill_viridis_c()

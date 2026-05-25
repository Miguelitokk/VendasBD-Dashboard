# 📊 VendasBD Dashboard

> 🇧🇷 Português | 🇺🇸 [English below](#-vendasbd-dashboard-english)

---

## 🇧🇷 Português

### Sobre o Projeto
Dashboard de vendas desenvolvido do zero, com banco de dados relacional criado no SQL Server e visualizações construídas no Power BI Desktop. O projeto simula um ambiente corporativo real de análise de vendas.

### 🛠️ Tecnologias Utilizadas
- **SQL Server** — criação do banco de dados e modelagem relacional
- **SSMS** (SQL Server Management Studio) — gerenciamento e consultas SQL
- **Power BI Desktop** — modelagem de dados, medidas DAX e dashboard

### 🗄️ Estrutura do Banco de Dados
6 tabelas relacionadas seguindo esquema estrela:
- `Categorias` → `Produtos` → `ItensPedido`
- `Clientes` → `Pedidos` → `ItensPedido`
- `Vendedores` → `Pedidos`

### 📊 Visuals do Dashboard
- Cartões de métricas: Faturamento Total, Total de Pedidos e Ticket Médio
- Faturamento por Categoria
- Faturamento por Vendedor
- Ranking Top 3 Produtos
- Percentual de vendas por Categoria
- Evolução do Faturamento Mensal

### 📐 Medidas DAX Criadas
```DAX
Faturamento Total = SUMX(ItensPedido, ItensPedido[quantidade] * ItensPedido[preco_unitario])
Total Pedidos = COUNTROWS(Pedidos)
Ticket Medio = DIVIDE([Faturamento Total], [Total Pedidos])
Ranking Produto = RANKX(ALL(Produtos[nome]), [Faturamento Total],,DESC)
```

### 📁 Arquivos
| Arquivo | Descrição |
|---|---|
| `VendasBD_Script.sql` | Script completo de criação e inserção de dados |
| `VendasBD_Dashboard.pbix` | Arquivo do dashboard Power BI |

---

## 🇺🇸 English

### About the Project
Sales dashboard built from scratch, with a relational database created in SQL Server and visualizations built in Power BI Desktop. The project simulates a real corporate sales analysis environment.

### 🛠️ Technologies Used
- **SQL Server** — database creation and relational modeling
- **SSMS** (SQL Server Management Studio) — database management and SQL queries
- **Power BI Desktop** — data modeling, DAX measures and dashboard

### 🗄️ Database Structure
6 related tables following a star schema:
- `Categories` → `Products` → `OrderItems`
- `Customers` → `Orders` → `OrderItems`
- `Salespeople` → `Orders`

### 📊 Dashboard Visuals
- Metric cards: Total Revenue, Total Orders and Average Ticket
- Revenue by Category
- Revenue by Salesperson
- Top 3 Products Ranking
- Sales Percentage by Category
- Monthly Revenue Evolution

### 📐 DAX Measures Created
```DAX
Total Revenue = SUMX(OrderItems, OrderItems[quantity] * OrderItems[unit_price])
Total Orders = COUNTROWS(Orders)
Average Ticket = DIVIDE([Total Revenue], [Total Orders])
Product Ranking = RANKX(ALL(Products[name]), [Total Revenue],,DESC)
```

### 📁 Files
| File | Description |
|---|---|
| `VendasBD_Script.sql` | Complete script for table creation and data insertion |
| `VendasBD_Dashboard.pbix` | Power BI dashboard file |

# API Orçamentos NovaTec 🚀

API Node.js integrada com Supabase para disponibilizar orçamentos de serviços da NovaTec, pronta para deploy no Vercel.

## 🔗 URL de Referência
Este projeto replica o formato da API: [https://novatec.com/api/orcamentos](https://novatec.com/api/orcamentos)

## ⚡ Início Rápido

### 1. Configurar Supabase
```bash
# Copiar arquivo de configuração
cp .env.example .env

# Editar .env com suas credenciais do Supabase
# SUPABASE_URL=https://seu-projeto.supabase.co
# SUPABASE_ANON_KEY=sua-chave-anonima
```

### 2. Criar tabela no Supabase
Execute o SQL do arquivo `exemplo-dados-novatec.sql` no Query Editor do Supabase.

### 3. Instalar e testar
```bash
# Instalar dependências
npm install

# Testar conexão com Supabase
npm test
```

### 4. Deploy no Vercel
```bash
# Instalar Vercel CLI
npm install -g vercel

# Deploy
vercel

# Configurar variáveis de ambiente
vercel env add SUPABASE_URL
vercel env add SUPABASE_ANON_KEY
```

## 📡 Endpoints

- **GET** `/api/orcamentos` - Lista todos os orçamentos NovaTec
- **GET** `/api/health` - Health check da API

## 📁 Estrutura do Projeto

```
.
├── api/
│   ├── orcamentos.js              # Endpoint principal
│   └── health.js                  # Health check
├── docs/
│   ├── API.md                     # Documentação da API
│   └── SETUP.md                   # Guia de configuração
├── exemplo-dados-novatec.sql      # Dados de orçamentos NovaTec
├── test-local.js                  # Teste de conexão local
├── .env.example                   # Modelo de variáveis de ambiente
└── package.json                   # Configuração do projeto
```

## 📖 Documentação Completa

- **[docs/SETUP.md](docs/SETUP.md)** - Configuração detalhada
- **[docs/API.md](docs/API.md)** - Documentação da API

## 🛠️ Tecnologias

- **Node.js** - Runtime JavaScript
- **Supabase** - Banco de dados PostgreSQL
- **Vercel** - Plataforma de deploy
- **ES Modules** - Módulos JavaScript modernos
- **API RESTful** - Arquitetura de API

## 📝 Exemplo de Resposta

```json
{
  "success": true,
  "data": [
    {
      "servico": "Formatação Completa",
      "valor": 100,
      "prazo": "1 dia útil",
      "garantia": "30 dias"
    },
    {
      "servico": "Troca de HD para SSD",
      "valor": 250,
      "prazo": "2 dias úteis",
      "garantia": "90 dias"
    }
  ]
}
```

## 🔒 Segurança

- Variáveis de ambiente protegidas
- CORS configurado
- Validação de métodos HTTP
- Tratamento de erros 
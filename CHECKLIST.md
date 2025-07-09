# ✅ Checklist de Deploy - API Orçamentos NovaTec

## 📋 Pré-requisitos

- [ ] Conta no [Supabase](https://supabase.com) (gratuita)
- [ ] Conta no [Vercel](https://vercel.com) (gratuita)
- [ ] Node.js instalado (v18+)

## 🔧 Configuração do Supabase

### 1. Criar Projeto no Supabase
- [ ] Acesse [app.supabase.com](https://app.supabase.com)
- [ ] Clique em "New Project"
- [ ] Escolha nome e senha para o banco
- [ ] Aguarde o projeto ser criado (~2 minutos)

### 2. Obter Credenciais
- [ ] No dashboard, vá em `Settings` → `API`
- [ ] Copie a **URL** do projeto
- [ ] Copie a **anon public** key

### 3. Criar Tabela e Dados
- [ ] No Supabase, vá em `SQL Editor`
- [ ] Execute o script do arquivo `exemplo-dados-novatec.sql`
- [ ] Verifique se a tabela `orcamentos_novatec` foi criada
- [ ] Confirme se os dados foram inseridos (+30 serviços)

## 🛠️ Configuração Local

### 1. Configurar Variáveis de Ambiente
```bash
# Copiar arquivo de exemplo
cp .env.example .env

# Editar .env com as credenciais do Supabase
nano .env  # ou usar seu editor preferido
```

Preencha o arquivo `.env`:
```env
SUPABASE_URL=https://seu-projeto.supabase.co
SUPABASE_ANON_KEY=sua-chave-anonima-aqui
```

### 2. Testar Conexão
```bash
# Executar teste local
npm test
```

**Resultado esperado:** ✅ Conexão estabelecida e dados encontrados

## 🚀 Deploy no Vercel

### 1. Preparar Deploy
```bash
# Instalar Vercel CLI (se não tiver)
npm install -g vercel

# Fazer login
vercel login
```

### 2. Executar Deploy
```bash
# Deploy inicial
vercel

# Seguir as instruções:
# - Set up and deploy? Y
# - Which scope? (sua conta)
# - Link to existing project? N
# - Project name: (confirmar ou alterar)
# - Directory: (confirmar .)
# - Override settings? N
```

### 3. Configurar Variáveis de Ambiente na Vercel
```bash
# Adicionar variáveis de ambiente
vercel env add SUPABASE_URL
vercel env add SUPABASE_ANON_KEY

# Ou pelo dashboard da Vercel:
# Settings → Environment Variables
```

### 4. Redeployar com Variáveis
```bash
vercel --prod
```

## 🔍 Verificação Final

### Endpoints para Testar

Substitua `novatec-api.vercel.app` pela URL gerada:

- [ ] **Health Check**: `https://novatec-api.vercel.app/api/health`
- [ ] **Orçamentos**: `https://novatec-api.vercel.app/api/orcamentos`

### Teste com cURL
```bash
# Health check
curl https://novatec-api.vercel.app/api/health

# Dados dos orçamentos
curl https://novatec-api.vercel.app/api/orcamentos
```

### Resposta Esperada
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

## 🎯 Resultado Final

✅ **API funcionando** na URL: `https://novatec-api.vercel.app`

✅ **Endpoints disponíveis:**
- `/api/orcamentos` - Lista orçamentos NovaTec
- `/api/health` - Status da API

✅ **Dados integrados** com Supabase (+30 serviços)

## 📚 Documentação

- `README.md` - Visão geral do projeto
- `docs/SETUP.md` - Configuração detalhada
- `docs/API.md` - Documentação da API
- `exemplo-dados-novatec.sql` - Script com +30 serviços

## 🆘 Problemas Comuns

### Erro de Conexão com Supabase
- Verifique as credenciais no arquivo `.env`
- Confirme se o projeto Supabase está ativo
- Teste com `npm test` localmente

### Deploy Falha no Vercel
- Verifique se as variáveis de ambiente foram configuradas
- Use `vercel logs` para ver erros detalhados
- Redeploye com `vercel --prod`

### API Retorna Dados Vazios
- Confirme se a tabela `orcamentos_novatec` existe
- Execute o script `exemplo-dados-novatec.sql` novamente
- Verifique no SQL Editor do Supabase: `SELECT * FROM orcamentos_novatec LIMIT 5;`

---

🎉 **Projeto concluído com sucesso!** 

Sua API está pronta para uso e replica exatamente o formato da URL de referência fornecida. 
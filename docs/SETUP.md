# Setup do Projeto - API Orçamentos NovaTec

## Configuração Inicial

### 1. Instalação das Dependências
```bash
npm install
```

### 2. Configuração do Supabase

#### 2.1. Criar arquivo .env
Copie o arquivo `.env.example` para `.env`:
```bash
cp .env.example .env
```

#### 2.2. Configurar as variáveis de ambiente
Edite o arquivo `.env` com suas credenciais do Supabase:

```env
SUPABASE_URL=https://seu-projeto.supabase.co
SUPABASE_ANON_KEY=sua-chave-anonima-aqui
```

**Como obter as credenciais:**
1. Acesse seu projeto no [Supabase Dashboard](https://app.supabase.com)
2. Vá em `Settings` → `API`
3. Copie a `URL` e a `anon public` key

### 3. Estrutura da Tabela no Supabase

Execute o script completo do arquivo `exemplo-dados-novatec.sql` que criará a tabela `orcamentos_novatec` com a seguinte estrutura:

```sql
CREATE TABLE orcamentos_novatec (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  servico TEXT NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  prazo TEXT NOT NULL,
  garantia TEXT NOT NULL,
  categoria TEXT,
  ativo BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

**O script já inclui +30 serviços da NovaTec:**
- Formatação e limpeza de sistemas
- Upgrades de hardware (SSD, RAM, etc.)
- Instalação de software
- Serviços para notebooks
- Recuperação de dados
- Configuração de redes

## Deploy no Vercel

### 1. Instalar Vercel CLI
```bash
npm install -g vercel
```

### 2. Fazer login na Vercel
```bash
vercel login
```

### 3. Deploy
```bash
vercel
```

### 4. Configurar variáveis de ambiente na Vercel
Após o primeiro deploy, configure as variáveis de ambiente:
```bash
vercel env add SUPABASE_URL
vercel env add SUPABASE_ANON_KEY
```

Ou através do dashboard da Vercel em `Settings` → `Environment Variables`.

## Endpoints da API

### GET /api/orcamentos
Retorna todos os orçamentos de serviços da NovaTec.

**Resposta:**
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

### GET /api/health
Health check da API.

**Resposta:**
```json
{
  "success": true,
  "message": "API funcionando corretamente",
  "timestamp": "2024-01-15T10:30:00.000Z",
  "endpoints": [...]
}
```

## Desenvolvimento Local

```bash
# Executar em modo desenvolvimento
npm run dev

# A API estará disponível em http://localhost:3000
```

## Notas Importantes

1. **Segurança**: Nunca commite o arquivo `.env` no Git
2. **Permissões**: Configure as Row Level Security (RLS) no Supabase conforme necessário
3. **CORS**: O projeto já está configurado para aceitar requisições de qualquer origem
4. **Logs**: Erros são logados no console para debugging 
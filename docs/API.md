# Documentação da API NovaTec

## Base URL
```
https://novatec.vercel.app
```

## Endpoints

### 1. Orçamentos NovaTec

**GET** `/api/orcamentos`

Retorna todos os orçamentos de serviços da NovaTec disponíveis.

#### Headers
```
Content-Type: application/json
```

#### Resposta de Sucesso (200)
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
      "servico": "Troca de HD para SSD 240GB",
      "valor": 250,
      "prazo": "2 dias úteis",
      "garantia": "90 dias"
    },
    {
      "servico": "Upgrade de Memória RAM 8GB",
      "valor": 200,
      "prazo": "1 dia útil",
      "garantia": "60 dias"
    }
  ]
}
```

#### Resposta de Erro (500)
```json
{
  "success": false,
  "error": "Erro interno do servidor"
}
```

#### Campos da Resposta
- `servico`: Nome do serviço oferecido
- `valor`: Preço do serviço em reais
- `prazo`: Tempo estimado para conclusão
- `garantia`: Período de garantia do serviço

#### Categorias de Serviços
- `Formatação`: Formatação e limpeza de sistema
- `Hardware`: Troca e upgrade de componentes
- `Software`: Instalação de programas e sistemas
- `Notebook`: Serviços específicos para notebooks
- `Recuperação`: Recuperação de dados
- `Rede`: Configuração de redes e conectividade

---

### 2. Health Check

**GET** `/api/health`

Verifica se a API está funcionando corretamente.

#### Resposta de Sucesso (200)
```json
{
  "success": true,
  "message": "API funcionando corretamente",
  "timestamp": "2024-01-15T10:30:00.000Z",
  "endpoints": [
    {
      "path": "/api/orcamentos",
      "method": "GET",
      "description": "Retorna lista de orçamentos NovaTec"
    },
    {
      "path": "/api/health", 
      "method": "GET",
      "description": "Health check da API"
    }
  ]
}
```

## Exemplos de Uso

### JavaScript/Fetch
```javascript
// Buscar orçamentos
fetch('https://novatec.vercel.app/api/orcamentos')
  .then(response => response.json())
  .then(data => {
    if (data.success) {
      console.log('Orçamentos:', data.data);
    }
  })
  .catch(error => console.error('Erro:', error));
```

### cURL
```bash
# Buscar orçamentos
curl -X GET https://novatec.vercel.app/api/orcamentos

# Health check
curl -X GET https://novatec.vercel.app/api/health
```

### Node.js/Axios
```javascript
const axios = require('axios');

async function buscarOrcamentos() {
  try {
    const response = await axios.get('https://novatec.vercel.app/api/orcamentos');
    
    if (response.data.success) {
      console.log('Orçamentos encontrados:', response.data.data.length);
      return response.data.data;
    }
  } catch (error) {
    console.error('Erro ao buscar orçamentos:', error.message);
  }
}
```

## Códigos de Status HTTP

| Código | Descrição |
|--------|-----------|
| 200 | Sucesso |
| 405 | Método não permitido |
| 500 | Erro interno do servidor |

## Rate Limiting

A API utiliza os limites padrão do Vercel:
- 100 requests por 10 segundos para planos gratuitos
- Sem limite para planos pagos

## CORS

A API está configurada para aceitar requisições de qualquer origem (`*`). 

Para produção, considere restringir as origens permitidas editando o arquivo `vercel.json`.

## Suporte

Para problemas ou dúvidas:
1. Verifique os logs no dashboard da Vercel
2. Teste o endpoint `/api/health` para verificar se a API está funcionando
3. Verifique as variáveis de ambiente no Supabase e Vercel 
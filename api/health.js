export default async function handler(req, res) {
  // Configurar CORS
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    res.status(200).end();
    return;
  }

  if (req.method !== 'GET') {
    return res.status(405).json({ 
      success: false, 
      error: 'Método não permitido. Use GET.' 
    });
  }

  res.status(200).json({
    success: true,
    message: 'API funcionando corretamente',
    timestamp: new Date().toISOString(),
    endpoints: [
      {
        path: '/api/orcamentos',
        method: 'GET',
        description: 'Retorna lista de orçamentos NovaTec'
      },
      {
        path: '/api/health',
        method: 'GET', 
        description: 'Health check da API'
      }
    ]
  });
} 
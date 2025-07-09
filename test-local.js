// Teste local da integração com Supabase
// Execute este arquivo após configurar o .env para testar a conexão

import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

// Carregar variáveis de ambiente
dotenv.config();

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Erro: Variáveis de ambiente SUPABASE_URL e SUPABASE_ANON_KEY são obrigatórias');
  console.log('📝 Configure o arquivo .env com suas credenciais do Supabase');
  process.exit(1);
}

console.log('🔄 Testando conexão com Supabase...');
console.log('📍 URL:', supabaseUrl);
console.log('🔑 Key:', supabaseKey.substring(0, 20) + '...');

const supabase = createClient(supabaseUrl, supabaseKey);

async function testarConexao() {
  try {
    // Testar conexão básica
    console.log('\n🔍 Testando conexão básica...');
    
    // Verificar se a tabela orcamentos_novatec existe
    const { data, error, count } = await supabase
      .from('orcamentos_novatec')
      .select('*', { count: 'exact', head: true });

    if (error) {
      console.error('❌ Erro ao conectar com a tabela orcamentos_novatec:', error.message);
      console.log('\n💡 Dicas para resolver:');
      console.log('1. Verifique se a tabela "orcamentos_novatec" existe no Supabase');
      console.log('2. Execute o SQL fornecido no arquivo exemplo-dados-novatec.sql');
      console.log('3. Verifique as credenciais no arquivo .env');
      return;
    }

    console.log('✅ Conexão com Supabase estabelecida com sucesso!');
    console.log(`📊 Tabela orcamentos_novatec encontrada com ${count || 0} registros`);

    // Buscar alguns dados para teste
    console.log('\n🔍 Buscando dados de exemplo...');
    const { data: orcamentos, error: selectError } = await supabase
      .from('orcamentos_novatec')
      .select(`
        servico,
        valor,
        prazo,
        garantia
      `)
      .limit(3);

    if (selectError) {
      console.error('❌ Erro ao buscar dados:', selectError.message);
      return;
    }

    if (orcamentos && orcamentos.length > 0) {
      console.log('✅ Dados encontrados:');
      orcamentos.forEach((orcamento, index) => {
        console.log(`${index + 1}. ${orcamento.servico} - R$ ${orcamento.valor} - ${orcamento.prazo} - Garantia: ${orcamento.garantia}`);
      });
    } else {
      console.log('⚠️  Nenhum dado encontrado na tabela orcamentos_novatec');
      console.log('💡 Execute o script exemplo-dados-novatec.sql');
    }

    console.log('\n🎉 Teste concluído com sucesso!');
    console.log('🚀 Agora você pode fazer o deploy no Vercel');

  } catch (error) {
    console.error('❌ Erro inesperado:', error.message);
    console.log('\n💡 Verifique:');
    console.log('1. Conexão com a internet');
    console.log('2. Credenciais do Supabase no arquivo .env');
    console.log('3. Se o projeto Supabase está ativo');
  }
}

// Executar teste
testarConexao(); 
-- Script SQL para criar tabela e inserir dados de orçamentos NovaTec
-- Execute este script no Query Editor do Supabase

-- Criar a tabela orcamentos_novatec
CREATE TABLE IF NOT EXISTS orcamentos_novatec (
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

-- Inserir dados de orçamentos para serviços de TI da NovaTec
INSERT INTO orcamentos_novatec (servico, valor, prazo, garantia, categoria) VALUES 

-- FORMATAÇÃO E LIMPEZA
('Formatação Completa', 100.00, '1 dia útil', '30 dias', 'Formatação'),
('Formatação + Backup de Dados', 150.00, '1 dia útil', '30 dias', 'Formatação'),
('Limpeza de Vírus e Malware', 80.00, '4 horas', '15 dias', 'Limpeza'),
('Otimização de Sistema', 60.00, '2 horas', '15 dias', 'Limpeza'),

-- HARDWARE
('Troca de HD para SSD 240GB', 250.00, '2 dias úteis', '90 dias', 'Hardware'),
('Troca de HD para SSD 480GB', 350.00, '2 dias úteis', '90 dias', 'Hardware'),
('Upgrade de Memória RAM 8GB', 200.00, '1 dia útil', '60 dias', 'Hardware'),
('Upgrade de Memória RAM 16GB', 400.00, '1 dia útil', '60 dias', 'Hardware'),
('Troca de Fonte de Alimentação', 180.00, '1 dia útil', '90 dias', 'Hardware'),
('Instalação de Placa de Vídeo', 120.00, '1 dia útil', '30 dias', 'Hardware'),
('Troca de Cooler/Ventoinha', 90.00, '4 horas', '60 dias', 'Hardware'),
('Limpeza Interna do Computador', 50.00, '2 horas', '15 dias', 'Hardware'),

-- SOFTWARE
('Instalação Windows 10/11', 120.00, '1 dia útil', '30 dias', 'Software'),
('Instalação de Drivers', 40.00, '2 horas', '15 dias', 'Software'),
('Instalação de Programas Básicos', 60.00, '2 horas', '15 dias', 'Software'),
('Configuração de Antivírus', 30.00, '1 hora', '30 dias', 'Software'),
('Instalação de Pacote Office', 80.00, '1 hora', '30 dias', 'Software'),

-- REDES E CONECTIVIDADE
('Configuração de Rede Wireless', 70.00, '2 horas', '30 dias', 'Rede'),
('Instalação de Placa de Rede', 90.00, '2 horas', '60 dias', 'Rede'),
('Configuração de Roteador', 100.00, '2 horas', '30 dias', 'Rede'),

-- NOTEBOOKS
('Troca de Teclado Notebook', 180.00, '3 dias úteis', '90 dias', 'Notebook'),
('Troca de Tela Notebook 14"', 350.00, '5 dias úteis', '90 dias', 'Notebook'),
('Troca de Tela Notebook 15.6"', 400.00, '5 dias úteis', '90 dias', 'Notebook'),
('Troca de Bateria Notebook', 200.00, '2 dias úteis', '180 dias', 'Notebook'),
('Reballing/Solda BGA', 280.00, '7 dias úteis', '90 dias', 'Notebook'),

-- SERVIÇOS ESPECIAIS
('Recuperação de Dados HD', 200.00, '3 dias úteis', '7 dias', 'Recuperação'),
('Recuperação de Dados SSD', 300.00, '5 dias úteis', '7 dias', 'Recuperação'),
('Backup Completo de Dados', 80.00, '4 horas', '30 dias', 'Backup'),
('Migração de Sistema', 150.00, '1 dia útil', '30 dias', 'Migração'),

-- MANUTENÇÃO PREVENTIVA
('Check-up Completo', 80.00, '2 horas', '30 dias', 'Preventiva'),
('Teste de Estresse Hardware', 60.00, '4 horas', '15 dias', 'Preventiva'),
('Diagnóstico de Problemas', 50.00, '1 hora', '7 dias', 'Diagnóstico'),

-- IMPRESSORAS
('Configuração de Impressora', 60.00, '1 hora', '30 dias', 'Impressora'),
('Limpeza de Impressora', 40.00, '1 hora', '15 dias', 'Impressora'),

-- MONTAGEM
('Montagem de PC Completo', 200.00, '2 dias úteis', '90 dias', 'Montagem'),
('Orçamento Personalizado', 0.00, '1 hora', '7 dias', 'Orçamento');

-- Verificar dados inseridos
SELECT 
  servico,
  valor,
  prazo,
  garantia,
  categoria
FROM orcamentos_novatec 
ORDER BY categoria, valor
LIMIT 15; 
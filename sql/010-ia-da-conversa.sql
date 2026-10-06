-- A IA da prospecção é a IA da conversa (Claude Code, Codex, Antigravity), não uma chamada de API.
-- O script guarda o texto do site e ela lê depois, pelo comando `ia` (lib/ia.mjs).
ALTER TABLE prospeccao.leads ADD COLUMN IF NOT EXISTS texto_site    TEXT;          -- até 12 mil caracteres: a home e as páginas de contato/sobre
ALTER TABLE prospeccao.leads ADD COLUMN IF NOT EXISTS site_lido_em  TIMESTAMPTZ;   -- quando a IA leu o texto (mesmo que o resumo tenha saído vazio)

-- Faltava esta coluna: lib/ia.mjs grava aqui o raio-X do site (tipo, serviços, público, profissionais,
-- unidades, do_nicho, motivo) que a IA da conversa preenche em "sites" do arquivo saidas/ia-<nicho>.json.
-- resumo_site e porte_estimado (005/sql antigo) continuam como colunas soltas; isto é o resto da leitura.
ALTER TABLE prospeccao.leads ADD COLUMN IF NOT EXISTS raio_x_site JSONB; 

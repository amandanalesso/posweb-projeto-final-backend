const express = require('express');
const helmet = require('helmet');
const migrateAll = require('./migrations/migrate.js');

const app = express();
const port = 3000;

// Middleware Helmet para segurança
app.use(helmet());

// Configuração da CSP sem fontes externas
app.use(
  helmet.contentSecurityPolicy({
    useDefaults: true,
    directives: {
      defaultSrc: ["'self'"],
      styleSrc: ["'self'"],
      fontSrc: ["'self'"],
      scriptSrc: ["'self'"],
      imgSrc: ["'self'"],
    },
  })
);

app.use(express.json());

// Rota básica para verificar se a API está funcionando
app.get('/', (req, res) => {
  res.send('API funcionando');
});

// Rota para migrar dados do MySQL para MongoDB
app.post('/api/migrate', async (req, res) => {
  try {
    await migrateAll();
    res.json({ message: 'Migração concluída com sucesso!' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});

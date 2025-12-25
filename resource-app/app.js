import express from 'express';
import { verifyToken, decodeToken } from './jwt.js';
const app = express();

/**
 * Port konfigurierbar über .env  Variable in dockerfile gesetzt
 */
const PORT = process.env.PORT ;
const SHOW_TOKEN = process.env.SHOW_TOKEN === 'true';
app.get('/', async (req, res) => {
  const auth = req.headers.authorization;

  if (!auth || !auth.startsWith('Bearer ')) {
    return res.status(401).send('Missing or invalid Authorization header');
  }

try {
    const token = auth.substring('Bearer '.length);

    // 🔐 Sicherheit
    const { payload } = await verifyToken(token);

    // 🧪 Anzeige / Debug
    const decoded = decodeToken(token); 
res.json({
      message: 'JWT valid',

      // 🔐 Identität
      user: payload.preferred_username,
      subject: payload.sub,

      // 🏷️ Token Metadaten
      issuer: payload.iss,
      audience: payload.aud,
      expires_at: payload.exp,
      issued_at: payload.iat,

      // 🔑 Rollen
      roles: payload.realm_access?.roles ?? [],

      // 🧪 Debug (optional!)
      token: SHOW_TOKEN ? token : 'hidden',
      // 🧪 Token decode
      decoded: SHOW_TOKEN
      ? {
      header: decoded.header,
      payload: decoded.payload
          }
        : 'hidden'
    });

  } catch (err) {
    console.error('JWT verification failed:', err.message);
    res.status(401).send('Invalid token');
  }
});

app.listen(PORT, () => {
  console.log(`Resource App listening on port ${PORT}`);
});

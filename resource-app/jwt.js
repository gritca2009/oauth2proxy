import {
  jwtVerify,
  createRemoteJWKSet,
  decodeJwt,
  decodeProtectedHeader
} from 'jose';

const issuer = process.env.ISSUER;
const audience = process.env.AUDIENCE;
const jwks = createRemoteJWKSet(
  new URL(`${issuer}/protocol/openid-connect/certs`)
);

export async function verifyToken(token) {
  return jwtVerify(token, jwks, {
    issuer,
    audience
  });
}

/**
 * ⚠ Token wird angezeigt 
 * 
 */
export function decodeToken(token) {
  return {
    header: decodeProtectedHeader(token),
    payload: decodeJwt(token)
  };
}

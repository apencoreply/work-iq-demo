# ⚡ Work IQ — Demo Comparativa

Demo interattiva che mostra 4 agenti Copilot Studio side-by-side, ciascuno con un livello crescente di intelligenza grazie ai connettori **Work IQ MCP** (Microsoft 365).

**Live:** [https://stworkiqdemo2026.z6.web.core.windows.net/](https://stworkiqdemo2026.z6.web.core.windows.net/)

---

## I 4 livelli

| # | Agente | Tool disponibili | Cosa fa |
|---|--------|-----------------|---------|
| 1 | **Base** | Nessuno | Solo LLM, risponde con conoscenza generica |
| 2 | **Connessioni** | Work IQ Mail, Calendar, User | Legge email, calendario e info utente |
| 3 | **Work IQ Copilot** | Semantic Index | Comprensione profonda cross-app (file, email, chat) |
| 4 | **Completo** | Copilot + Mail + Calendar + User | Intelligenza + azione: capisce e agisce |

## Architettura

- **Frontend:** singolo file HTML (`demo_app.html`) con dark theme
- **Chat:** [Bot Framework WebChat SDK](https://github.com/microsoft/BotFramework-WebChat) embedded in 4 pannelli
- **Backend:** 4 agenti Copilot Studio connessi via Direct Line (token endpoint)
- **Hosting:** Azure Storage Account con sito statico

---

## Flusso di autenticazione

Gli agenti 2, 3 e 4 richiedono autenticazione Microsoft per accedere ai dati M365 dell'utente. L'agente 1 (Base) non richiede autenticazione.

### Configurazione (una tantum)

1. **App Registration in Microsoft Entra ID**
   - Creare una registrazione app (es. "ACME Corp Agent Auth")
   - Tipo account: Single tenant
   - Redirect URI (Web): `https://europe.token.botframework.com/.auth/web/redirect`
   - Nessun permesso API aggiuntivo necessario (solo `User.Read` di default)
   - Creare un **Client Secret**

2. **Copilot Studio — per ogni agente (2, 3, 4)**
   - Impostazioni → Sicurezza → Autenticazione → **"Authenticate manually"**
   - Service provider: **Microsoft Entra ID V2**
   - Client ID: l'Application ID dell'App Registration
   - Client Secret: il secret creato sopra
   - Grant type: `Authorization Code`
   - Scopes: `profile openid`
   - Attivare "Require users to sign in"
   - Verificare che il topic di sistema **"Sign in"** sia presente e attivo
   - **Pubblicare** l'agente

### Flusso utente in demo

```
┌─────────────────────────────────────────────────────┐
│  1. L'app carica → 4 pannelli WebChat si connettono │
│     via token endpoint (Direct Line, no auth)       │
├─────────────────────────────────────────────────────┤
│  2. Appare il LOGIN GATE: overlay bloccante a       │
│     schermo intero che impedisce l'uso della demo   │
│     finché l'utente non si autentica                │
├─────────────────────────────────────────────────────┤
│  3. Clicca "🔑 Accedi con Microsoft"               │
│     → si apre un popup Microsoft per il primo       │
│     agente                                          │
├─────────────────────────────────────────────────────┤
│  4. Fai login (email + password + MFA)              │
│     → il popup mostra un codice di validazione      │
├─────────────────────────────────────────────────────┤
│  5. Copia il codice (Ctrl+C) e torna alla pagina:  │
│     - Su localhost: il codice viene letto           │
│       automaticamente dalla clipboard               │
│     - Su file://: incolla nel campo codice          │
├─────────────────────────────────────────────────────┤
│  6. Il popup per l'agente successivo si apre        │
│     automaticamente (SSO via cookie, senza          │
│     reinserire le credenziali)                      │
├─────────────────────────────────────────────────────┤
│  7. Copia il nuovo codice → torna alla pagina →    │
│     ripeti (3 codici totali, 1 solo login)          │
├─────────────────────────────────────────────────────┤
│  8. Login gate scompare, le chat vengono svuotate   │
│     automaticamente → demo pronta e pulita!         │
│     Usa "Invia a tutti ▶" per i prompt              │
└─────────────────────────────────────────────────────┘
```

### Schema autenticazione

```
Browser                    Bot Framework              Microsoft Entra ID
  │                            │                            │
  │── Token endpoint ─────────►│                            │
  │◄── Direct Line token ──────│                            │
  │                            │                            │
  │── WebChat connect ────────►│                            │
  │◄── OAuthCard (sign in) ────│                            │
  │                            │                            │
  │── popup: /authorize ──────────────────────────────────►│
  │◄── redirect + code ───────────────────────────────────│
  │                            │                            │
  │── validation code ────────►│── exchange code ──────────►│
  │                            │◄── access token ──────────│
  │◄── authenticated ─────────│                            │
  │                            │                            │
  │── "Invia a tutti" ────────►│── call MCP tools ─────────►│
  │◄── risposta con dati M365 ─│◄── mail/calendar/user ────│
```

---

## Esecuzione locale

> **Nota:** usare `localhost` (non `file://`) per abilitare la lettura automatica del codice dalla clipboard.

```bash
# Avvia il server HTTP
python3 -m http.server 8080

# Apri nel browser
open http://localhost:8080/demo_app.html
```

Oppure usa lo script: `./avvia_demo.command`

## Deploy su Azure

```bash
# Upload dopo modifiche
az storage blob upload-batch \
  --account-name stworkiqdemo2026 \
  --destination '$web' \
  --source . \
  --pattern "*.html" \
  --overwrite
```

## Configurazione token endpoint

I token endpoint sono hardcoded in `demo_app.html` (oggetto `DEFAULT_URLS`). Formato:

```
https://{environment-id}.environment.api.powerplatform.com/powervirtualagents/botsbyschema/{bot-schema}/directline/token?api-version=2022-03-01-preview
```

Per trovare il bot schema name: Copilot Studio → Agente → Impostazioni → Dettagli agente.

---

## Struttura

```
demo_app.html          # App principale (HTML + CSS + JS, single-file)
avvia_demo.command     # Script di avvio rapido (macOS)
WORK_IQ_DEMO_GUIDE.md  # Guida ai prompt e allo script live
WORK_IQ_DEMO_DOC.html  # Documentazione dettagliata
README.md              # Questo file
```

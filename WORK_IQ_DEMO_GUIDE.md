# Work IQ Demo — Progressione a 4 livelli
## Guida completa: prompt + setup + script live

> **Obiettivo:** dimostrare, con lo stesso prompt, come un agente Copilot Studio
> migliora progressivamente aggiungendo Work IQ. 4 livelli, 4 risposte diverse.
> Il pubblico vede la differenza con i propri occhi.

---

## Prerequisiti

| Cosa serve | Note |
|---|---|
| Tenant Microsoft 365 | Con dati reali (email, eventi, utenti) |
| Licenza Microsoft 365 Copilot | Richiesta per Work IQ MCP |
| Accesso a Copilot Studio | [copilotstudio.microsoft.com](https://copilotstudio.microsoft.com) |

---

## Setup: creare 4 agenti

Crea 4 agenti in Copilot Studio. Stesso nome base, suffisso diverso.
Stesso prompt di base, poi aggiungi i tool come descritto.

> 💡 **Shortcut:** in Copilot Studio puoi descrivere l'agente in linguaggio naturale
> e lasciare che generi le istruzioni per te. Nella sezione "Descrivi il tuo agente"
> puoi incollare il prompt che segue. Se preferisci copiarlo manualmente, vai
> nella sezione **Instructions** dell'agente.

---

## Prompt di base (uguale per tutti e 4)

Copia e incolla questo prompt nella sezione **Instructions** di ogni agente.
È progettato per funzionare a qualsiasi livello di tool disponibile.

```
You are ACME Assistant, an intelligent work companion for employees of ACME Corp.
Your role is to help the user stay on top of their work: meetings, emails,
people, and priorities.

## Core principles

1. CONTEXT FIRST — before answering, gather all the context you can from
   the tools available to you. If you have calendar tools, check the calendar.
   If you have email tools, check relevant emails. If you have people tools,
   enrich names with roles. If you have Copilot search, use it to find
   documents, chats, and cross-app context.

2. CONNECT THE DOTS — when you find related information across sources
   (e.g., an email from a meeting attendee), surface it proactively.
   The user should not have to ask follow-up questions to get a
   complete picture.

3. ACT, DON'T DESCRIBE — if the user asks you to do something (send email,
   create event, reschedule) and you have the tools, do it. Ask for one
   confirmation before irreversible actions. Never say "I would do X" if
   you can actually do X.

4. BE HONEST ABOUT LIMITS — if you don't have access to a tool or data
   source, say so clearly. Don't fabricate information.

## Output format

- Bullet points for lists.
- Bold for names, times, and key facts.
- For meeting briefings: **Name** · Role · Context.
- Keep responses under 200 words unless asked for more.

## Language

Reply in the same language the user writes in.
```

---

## Configurazione dei 4 agenti

### Agente 1: `ACME Assistant — Base`

| Campo | Valore |
|---|---|
| Nome | ACME Assistant — Base |
| Instructions | Il prompt di base sopra |
| Tool aggiunti | **Nessuno** |

> L'agente ha solo l'LLM. Risponderà da conoscenza generica.

---

### Agente 2: `ACME Assistant — Connessioni`

| Campo | Valore |
|---|---|
| Nome | ACME Assistant — Connessioni |
| Instructions | Il prompt di base sopra |
| Tool aggiunti | **Work IQ Mail + Work IQ Calendar + Work IQ User** |

**Come aggiungere i tool:**
1. Vai nella tab **Strumenti** → **Aggiungi strumento**
2. Seleziona **Model Context Protocol**
3. Cerca e aggiungi uno per uno:
   - `mail` → **Work IQ Mail** → Crea connessione → Accedi → Aggiungi
   - `calendar` → **Work IQ Calendar** → Crea connessione → Accedi → Aggiungi
   - `user` → **Work IQ User** → Crea connessione → Accedi → Aggiungi

> L'agente può cercare email, leggere il calendario, consultare l'organigramma e AGIRE
> (inviare email, creare eventi). Ma cerca in modo diretto, non semantico.

---

### Agente 3: `ACME Assistant — Copilot`

| Campo | Valore |
|---|---|
| Nome | ACME Assistant — Copilot |
| Instructions | Il prompt di base sopra |
| Tool aggiunti | **Work IQ Copilot** (solo questo) |

**Come aggiungere il tool:**
1. Tab **Strumenti** → **Aggiungi strumento** → **Model Context Protocol**
2. Cerca `copilot` → seleziona **Work IQ Copilot**
3. Crea connessione → Accedi → Aggiungi

> L'agente sfrutta tutta l'intelligenza di M365 Copilot: semantic index, memory,
> ragionamento cross-app, segnali di collaborazione. Ma NON può agire
> (non invia email, non crea eventi).

---

### Agente 4: `ACME Assistant — Completo`

| Campo | Valore |
|---|---|
| Nome | ACME Assistant — Completo |
| Instructions | Il prompt di base sopra |
| Tool aggiunti | **Work IQ Copilot + Work IQ Mail + Work IQ Calendar + Work IQ User** |

**Come aggiungere i tool:**
Ripeti i passi dell'Agente 2 e dell'Agente 3 — tutti e 4 i tool insieme.

> L'agente capisce in profondità (Copilot) E agisce (connessioni).
> Questa è la configurazione completa.

---

## Pre-autorizzazione (prima della demo!)

Per ognuno dei 4 agenti, apri il pannello **Test** e invia un prompt qualsiasi.
Quando appare il banner di consenso per ogni tool, clicca **Consenti**.
Fallo per tutti e 4 gli agenti così durante la demo non ci sono interruzioni.

---

## Script demo — stesso prompt, 4 risposte

### Il prompt da usare in tutti e 4 gli agenti:

```
Cosa devo sapere prima della mia prossima riunione?
```

(Assicurati di avere una riunione reale nel calendario con almeno
un partecipante che ti abbia scritto un'email di recente.)

---

### 1️⃣ Agente Base — risposta attesa

> "Non ho accesso al tuo calendario o alle tue email.
> In generale, prima di una riunione è buona norma rivedere l'agenda,
> preparare domande, e verificare i materiali condivisi."

**Commento al pubblico:**
> *"Risposta educata ma inutile. Non sa nulla del mio lavoro.
> È solo un modello di linguaggio generico."*

---

### 2️⃣ Agente Connessioni — risposta attesa

> "La tua prossima riunione è alle **14:00** — Review budget Q3.
> Partecipanti: **Luca Bianchi** (Head of Finance), **Anna Verdi**.
> Luca ti ha scritto ieri: *'Ho alcune domande sui numeri del Q3.'*"

**Commento al pubblico:**
> *"Ora vede il mio calendario, la mia email, chi sono le persone.
> Sta collegando i dati. Ma fa ricerche puntuali — non capisce il contesto storico."*

---

### 3️⃣ Agente Copilot — risposta attesa

> "La tua prossima riunione riguarda la review del budget Q3.
> Negli ultimi 2 mesi hai scambiato 14 email con Luca Bianchi su questo tema.
> Il documento 'Budget_Q3_v4.xlsx' su SharePoint è stato aggiornato 3 giorni fa da Anna.
> Nel Teams call della scorsa settimana, Luca ha menzionato un disallineamento
> tra i numeri EMEA e APAC."

**Commento al pubblico:**
> *"Non ha solo trovato la riunione e le email. Ha cercato nei documenti SharePoint,
> nei messaggi Teams, nella cronologia di collaborazione.
> Questo è il semantic index di Work IQ. Ma se gli chiedo 'manda un'email a Luca',
> non può farlo."*

---

### 4️⃣ Agente Completo — risposta attesa + follow-up

Stessa risposta ricca dell'agente 3, poi aggiungi il prompt:

```
Manda a Luca un'email: digli che ho visto le sue domande e ne parliamo alle 14.
```

> "Ho inviato l'email a Luca Bianchi con oggetto 'Re: Budget Q3 — ci vediamo alle 14'."

**Commento al pubblico:**
> *"Work IQ Copilot ha capito il contesto.
> Le connessioni hanno eseguito l'azione.
> Questo è un agente completo: intelligenza + azione."*

---

## Riepilogo visivo per le slide

```
 Livello          Capisce    Agisce    Fonti
─────────────────────────────────────────────
 1. Base           ❌         ❌        Nessuna
 2. Connessioni    Parziale   ✅        Mail, Calendar, User
 3. Copilot        ✅✅        ❌        Semantic Index, Memory, tutto M365
 4. Completo       ✅✅        ✅        Tutto
```

---

## Messaggi chiave per il debrief

| Messaggio | Come dirlo |
|---|---|
| L'agente base è un LLM generico | "Senza contesto, l'AI non serve in azienda." |
| Le connessioni danno vista e azione | "Vede le tue app e fa cose. Ma cerca per keyword." |
| Work IQ Copilot dà comprensione profonda | "Il semantic index connette i puntini nel tempo. È il salto di qualità." |
| Insieme sono l'agente completo | "Capire + Agire = valore reale." |
| Governance enterprise | "Ogni tool è controllabile dall'admin center. Ogni chiamata è tracciabile in Defender." |
| MCP = standard aperto | "Domani aggiungi SharePoint, Dynamics, i tuoi sistemi custom — stessa architettura." |

---

## Troubleshooting

| Problema | Soluzione |
|---|---|
| L'agente non usa i tool MCP | Verifica che le connessioni siano attive nella tab Strumenti |
| Consenso richiesto durante la demo | Pre-autorizza tutti i tool nel pannello Test prima della demo |
| Risponde in inglese | Il system prompt dice "Reply in the same language" — verifica sia presente |
| Work IQ Copilot non restituisce contesto ricco | Servono dati reali nel tenant: email, file, chat Teams degli ultimi giorni |
| Work IQ non disponibile | Licenza M365 Copilot attiva + feature abilitata nell'admin center |

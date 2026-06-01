# Work IQ — Report Demo Comparativa
## Data: 1 Giugno 2026 (anonimizzato)

---

## Obiettivo
Dimostrare come un agente Copilot Studio migliora progressivamente aggiungendo Work IQ MCP. Stesso prompt, 4 risposte diverse — il pubblico vede la differenza.

---

## Setup Demo

| # | Agente | Tool disponibili | Stato |
|---|--------|-----------------|-------|
| 1 | **Base** | Nessuno (solo LLM) | ✅ Connesso |
| 2 | **Connessioni** | Work IQ Mail, Calendar, User | ✅ Autenticato |
| 3 | **Work IQ Copilot** | Semantic Index, Memory, Cross-app | ✅ Autenticato |
| 4 | **Completo** | Copilot + Mail + Calendar + User | ✅ Autenticato |

**Piattaforma:** Copilot Studio con Bot Framework WebChat
**URL Demo:** http://localhost:8080/demo_app.html

---

## Prompt 1: "Cosa devo sapere prima della mia prossima riunione?"

### Agente 1 — Base (Solo LLM)
> Non risultano informazioni specifiche sulla tua prossima riunione nei dati disponibili. Per offrirti un briefing completo, avrei bisogno di dettagli come l'orario, i partecipanti o l'argomento della riunione. Se vuoi, puoi fornirmi queste informazioni oppure chiedere un riepilogo su una riunione specifica.

**🔴 Commento:** Risposta educata ma inutile. Non sa nulla del lavoro dell'utente. È solo un modello di linguaggio generico.

---

### Agente 2 — Connessioni (Mail + Calendar + User)
> Ecco i dettagli della tua prossima riunione:
> - **Titolo:** Seguita da: Horizon 3.0 - Stand up tecnico
> - **Orario:** Oggi, 09:30 - 10:00 (ora locale)
> - **Organizzatore:** Marco Bianchi
> - **Luogo:** Microsoft Teams (riunione online)
> - **Partecipanti:**
>   - Marco Bianchi – Organizzatore
>   - Elena Rossi – Ha accettato
>   - Luca Moretti, Davide Rizzo, Sara Conti – In attesa di risposta
>   - Tu – Hai accettato provvisoriamente
> - **Note:** È una call tecnica legata a Horizon 3.0, probabilmente di allineamento (stand-up). Collegati tramite il link Teams presente nell'invito. Prepara eventuali aggiornamenti o punti aperti sullo sviluppo Horizon 3.0.
>
> Vuoi che estragga anche l'ordine del giorno o le azioni assegnate dal meeting precedente, se disponibili?

**🟡 Commento:** Ora vede il calendario, la mail, chi sono le persone. Sta collegando i dati. Ma fa ricerche puntuali — non capisce il contesto storico.

---

### Agente 3 — Work IQ Copilot (Semantic Index)
> Ecco cosa devi sapere per la tua **prossima riunione**:
>
> 📅 **Meridian - Supply Chain Status - Weekly**
> - **Quando:** domani, ore 08:30 – 09:00
> - **Durata:** 30 minuti
> - **Modalità:** Microsoft Teams
> - **Organizzatore:** Paolo Gentile
> - **Ricorrenza:** settimanale
>
> 👥 **Partecipanti**
> - Andrea Ferri (tu)
> - Chiara Marino
>
> 🧩 **Contesto e temi**
> - È un **meeting di stato settimanale** sul progetto **Meridian / Supply Chain Platform**
> - Non è indicata un'agenda dettagliata → probabilmente **aggiornamenti, issue e next steps**
> - Coinvolge un set ristretto di partecipanti → **operativo/di coordinamento**
>
> 🔍 **Spunti utili**
> - Essendo parte di un filone di meeting (ne hai altri simili nei prossimi giorni: Phoenix Stand-Up, Horizon SAL, Atlas Weekly), preparati su eventuali **rischi e dipendenze** da riportare.
> - Nessun documento allegato trovato, ma segue schema ricorrente, quindi **porta update puntuali su avanzamento/criticità**.
>
> Vuoi che ti preparo un **briefing operativo** con: ✅ punti da citare, ⚠ rischi aperti e ❓domande intelligenti da porre?

**🟣 Commento:** Non ha solo trovato la riunione. Ha analizzato il contesto completo: riconosce pattern settimanali, suggerisce preparazione strategica, e offre un briefing operativo strutturato. Questo è il semantic index di Work IQ.

---

### Agente 4 — Completo (Copilot + Connessioni)
> Ecco i dettagli della tua prossima riunione:
> - **Titolo:** Seguita da: Horizon 3.0 - Stand up tecnico
> - **Orario:** 09:30 – 10:00 (ora locale)
> - **Modalità:** Microsoft Teams
> - **Organizzatore:** Marco Bianchi
> - **Partecipanti chiave:**
>   - Elena Rossi (ha accettato)
>   - Luca Moretti, Sara Conti, Davide Rizzo (non hanno ancora risposto)
>   - Tu: risposta provvisoria (tentativa)
> - Non è indicata un'agenda dettagliata nella descrizione, solo il link di partecipazione a Teams.
> - **Suggerimento:** trattandosi di uno stand up tecnico, prepara aggiornamenti rapidi su attività Horizon 3.0 e eventuali blocchi.
>
> Vuoi che verifichi eventuali azioni aperte o note dalle riunioni precedenti su Horizon 3.0?

**🟢 Commento:** Combina intelligenza profonda con dettagli operativi: stato RSVP di ogni partecipante, suggerimenti pratici, e propone azioni concrete.

---

## Prompt 2: "Riassumi le email non lette più importanti di oggi."

### Agente 1 — Base
> Non risultano email non lette importanti ricevute oggi nei dati disponibili. Se hai bisogno di un riepilogo su un periodo diverso o su una categoria specifica di email, fammi sapere!

**🔴** Nessun accesso alla mail.

---

### Agente 2 — Connessioni
> Ecco una sintesi delle email non lette più rilevanti di oggi:
> 1. **Nuove Pull Request su Azure DevOps**
>    - Oggetto: PR: fix_validation_pipeline into main
>    - Da: Azure DevOps
>    - Contesto: Diverse notifiche di creazione, revisione e completamento di una pull request (autore: Giorgio Barbieri).
>    - Oggetto successivo: PR: Updating config: Pipeline_L0
>    - Da: Azure DevOps
>    - Contesto: Pull request aperte e completate da Matteo Fontana su config Pipeline_L0.
> 2. **Riunioni**
>    - Oggetto: Annullato: Sprint Review - Weekly Sync
>    - Da: Stefano Galli
>    - Nota: Il meeting è stato cancellato.
> 3. **Kick-off tecnico**
>    - Oggetto: [API Gateway] Integrazione Meridian — kick-off tecnico
>    - Da: Francesca Colombo
>    - Nota: Proposta di call preliminare per definire le linee guida di integrazione con la piattaforma API Gateway.
> 4. **Segnalazioni Analytics Dashboard**
>    - Oggetto: Analytics Dashboard [TEST] - Issue Report
>    - Nota: Errore critico durante l'elaborazione della pipeline Analytics Dashboard TEST.
>
> Vuoi che: ✅ prepari una lista delle azioni urgenti da queste email, oppure 📅 apra l'invito per l'incontro API Gateway e lo aggiunga al calendario?

**🟡** Elenca le email con categorie e suggerisce azioni, ma non distingue bene le priorità business.

---

### Agente 3 — Work IQ Copilot
> Non risultano email non lette di oggi nei dati disponibili.
> Questo può voler dire che:
> - Non hai ricevuto nuove email non lette oggi, oppure
> - Le email non sono indicizzate al momento dalle fonti accessibili.
>
> Posso però:
> - Cercare anche nelle ultime **24-48 ore**
> - Includere **email già lette ma rilevanti**
> - Filtrare per **mittenti chiave** (es. team Phoenix, Marco, Chiara)
>
> Quale opzione preferisci?

**🟣** Spiega il contesto dell'assenza di risultati e propone strategie alternative intelligenti con filtri contestuali.

---

### Agente 4 — Completo
> Ecco le email non lette più recenti e rilevanti (ultimi giorni):
> - **Roberto Neri** · (29 mag, 10:13)
>   Oggetto: (nessun oggetto) — Invito a riunione Teams con dettagli di connessione.
> - **Deskbooking-NoReply** · (29 mag, 07:30)
>   Oggetto: Deskbooking | Check-in Reminder — Promemoria per confermare la prenotazione della scrivania per oggi.
> - **Deskbooking-NoReply** · (29 mag, 07:01)
>   Oggetto: Deskbooking | Check-in Reminder — Altro promemoria check-in desk per la giornata.
> - **Microsoft Outlook** · (28 mag, 15:14)
>   Oggetto: Non recapitabile: Follow-up con Sofia Marchetti — Messaggio non recapitabile, indirizzo destinatario sconosciuto.
> - **Microsoft Outlook** · (28 mag, 15:12)
>   Oggetto: Non recapitabile: Follow-up con Sofia Marchetti — Altro avviso di mancata consegna messaggio.
>
> Vuoi che approfondisca queste email per estrarre eventuali azioni, o che prepari un riepilogo in base alla loro importanza?

**🟢** Ha trovato le email, filtrato le più rilevanti con data e anteprima, e propone azioni di follow-up.

---

## Prompt 3 (solo Agente 4): "Manda una email a s.marchetti@novatech.it: digli che ho visto le sue domande sul progetto e ne parliamo alla prossima riunione."

### Agente 4 — Completo
> Ho inviato l'email a **s.marchetti@novatech.it** con oggetto *"Discussione delle domande sul progetto"* e il messaggio:
>
> > Ciao Sofia,
> > ho visto le tue domande sul progetto.
> > Ne parleremo nella prossima riunione.
>
> ✅ **Email inviata con successo.**

**🟢 AZIONE COMPLETATA:** L'agente ha compreso il contesto, formulato un messaggio appropriato e inviato l'email. Questo è un agente completo: **intelligenza + azione**.

---

## Riepilogo Comparativo

```
 Livello          Capisce    Agisce    Fonti
─────────────────────────────────────────────
 1. Base           ❌         ❌        Nessuna
 2. Connessioni    Parziale   ✅        Mail, Calendar, User
 3. Copilot        ✅✅        ❌        Semantic Index, Memory, tutto M365
 4. Completo       ✅✅        ✅        Tutto
```

---

## Messaggi Chiave per la Presentazione

| Messaggio | Come dirlo |
|---|---|
| L'agente base è un LLM generico | "Senza contesto, l'AI non serve in azienda." |
| Le connessioni danno vista e azione | "Vede le tue app e fa cose. Ma cerca per keyword." |
| Work IQ Copilot dà comprensione profonda | "Il semantic index connette i puntini nel tempo. Analisi strutturata e proattiva." |
| Insieme sono l'agente completo | "Capire + Agire = valore reale. Ha inviato l'email." |
| Governance enterprise | "Ogni tool è controllabile dall'admin center. Ogni chiamata è tracciabile." |
| MCP = standard aperto | "Domani aggiungi SharePoint, Dynamics, i tuoi sistemi custom." |

---

## Screenshot Disponibili

| File | Descrizione |
|---|---|
| `screenshots/00_dashboard_pulita.png` | Dashboard iniziale con 4 agenti connessi |
| `screenshots/01_prompt1_overview.png` | Vista comparativa Prompt 1 — 4 colonne |
| `screenshots/02_prompt1_agent1.png` | Agente 1 (Base) — "Non ho informazioni" |
| `screenshots/02_prompt1_agent2.png` | Agente 2 (Connessioni) — Dettagli riunione Horizon 3.0 |
| `screenshots/02_prompt1_agent3.png` | Agente 3 (Work IQ Copilot) — Briefing strutturato Meridian |
| `screenshots/02_prompt1_agent4.png` | Agente 4 (Completo) — Dettagli + stato RSVP |
| `screenshots/06_prompt2_overview.png` | Vista comparativa Prompt 2 — Email non lette |
| `screenshots/07_prompt2_agent1.png` | Agente 1 — Nessun accesso mail |
| `screenshots/07_prompt2_agent2.png` | Agente 2 — Email categorizzate con azioni |
| `screenshots/07_prompt2_agent3.png` | Agente 3 — Strategie alternative intelligenti |
| `screenshots/07_prompt2_agent4.png` | Agente 4 — Email filtrate per rilevanza |
| `screenshots/11_prompt3_overview.png` | Vista con email inviata a s.marchetti@novatech.it |
| `screenshots/12_prompt3_agent4_email.png` | Agente 4 — Email inviata con successo |
| `screenshots/13_panoramica_finale.png` | Vista finale completa della demo |

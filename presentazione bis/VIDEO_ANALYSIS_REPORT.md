# Analisi Video — Project Request Tracker Demo

**File sorgente:** `ProjectRequestTrackerDemoVideo1.mov`
**Durata:** 13:12 min | **Risoluzione:** 2478×1314 @ 30fps | **Formato:** H.264/MOV

---

## 🎯 Riepilogo Demo

La demo mostra un agente **Copilot Studio** ("Copilot - RValli POC Portfolio") che gestisce l'intero ciclo di creazione di una project request, dall'intake conversazionale fino alla generazione automatica di un OnePager su SharePoint, arricchito con AI notes tramite **Work IQ MCP**.

---

## 📋 PROMPT USATI

### 1. System Prompt (Instructions dell'agente)
**Screenshot:** `screenshots/01_prompt_system_instructions.png`
**Dettaglio:** `screenshots/02_prompt_instructions_detail.png`
**Timestamp:** ~3:15

**Contenuto chiave delle Instructions:**
> **Goal:** Collect all required request fields first, then run the AI/WorkIQ overlap check, then proceed based on user choice, and only then trigger the Power Automate creation flow.
>
> **Intake first (collect structured fields):** DO NOT DIRECTLY ASK values to the user, but MAKE SURE TO LAUNCH the "New project request" topic... it asks the user the required fields for the project request (Title, Requester, Sponsor, Objective/Outcome, Benefits, Urgency, Deadline, Impacts, Dependencies/Constraints, Effort size, Main risks, Notes).
>
> **Then run AI search** (Work IQ copilot_chat MCP tool using this exact query "Search inside my OneDrive folder 'CopilotStudioPOCs/POC_ProjectIntake/KnowledgeBase' for documents related to improving customer data quality in CRM and reducing duplicate customer records.") **to detect overlap and dependencies.**
>
> **Present findings and ask for next step.** Then ask the user: "§§§ What would you like to do next?", to choose one option:
> - ✅ Proceed as-is
> - ⟲ Revise the scope
>
> **Only after user confirmation, and AI Notes variable is set then trigger Power Automate.** Trigger the Power Automate "Create new project request" flow to create the tracker entry and generate the official one-pager.

**Modello:** GPT-5 Chat

---

### 2. Prompt Utente
**Screenshot:** `screenshots/03_prompt_user_request.png`
**Timestamp:** ~4:50

> **"I want to open a new internal project request to improve customer data quality in CRM and reduce duplicate customer records"**

L'agente interpreta il prompt e instrada automaticamente al topic "New project request".

---

## 🔧 TOOL USATI

### 1. Work IQ Copilot (Preview) — MCP Server
**Screenshot:** `screenshots/04_tool_workiq_mcp_panel.png`
**Timestamp:** ~6:10

| Proprietà | Valore |
|-----------|--------|
| **Nome** | Work IQ Copilot (Preview) |
| **Tipo** | Model Context Protocol (MCP) |
| **Stato** | Initialized |
| **Descrizione** | Use this MCP server to for Microsoft 365 Copilot and search operations |

**Tool esposto: `copilot_chat`**
> Use this tool to search internal Microsoft 365 content (documents, emails, chats, sites, files) when the specific workload is unclear or spans multiple areas, but always prefer workload-specific tools (SharePoint, OneDrive, Teams, Mail) when the workload is explicitly stated or clearly implied; do not use this tool for general knowledge, news, public web content, or external information.

---

### 2. copilot_chat — Esecuzione
**Screenshot working:** `screenshots/05_tool_copilot_chat_working.png`
**Screenshot completed:** `screenshots/06_tool_copilot_chat_completed.png`
**Timestamp:** ~7:00–8:10

- **Durata esecuzione:** 55.31 secondi
- **Query:** Ricerca documenti in OneDrive KnowledgeBase relativi a CRM data quality e deduplicazione
- **Risultato:** 3 documenti trovati con sintesi strutturata

---

### 3. Topics (Copilot Studio Authoring)
**Screenshot:** `screenshots/07_tool_topics_editor.png`
**Timestamp:** ~4:00

Topic **"New project request"** con nodi Question per:
- Urgency (→ `Global.varUrgency`)
- Expected Effort (→ `Global.varEffort`)
- Deadline (→ `Global.varDeadline`)
- + altri campi (Title, Requester, Sponsor, Objective, Benefits, Impacts, Dependencies, Risks, Notes)

---

### 4. AI Tool Node
**Screenshot:** `screenshots/08_tool_revise_title_flow.png`
**Timestamp:** ~9:20–9:30

Nodo "AI Tool" nel flusso di orchestrazione che collega copilot_chat → decisione utente → topic di revisione o creazione.

---

### 5. Topic "Revise Project Request Title"
**Screenshot:** `screenshots/08_tool_revise_title_flow.png`
**Timestamp:** ~9:40

- Utente sceglie "revise title"
- Agente chiede: "Please enter the new Project Request Title"
- Utente risponde: "CRM data deduplication"
- Agente conferma: "The Project Request Title has been updated to CRM data deduplication"

---

### 6. Power Automate — "Create new project request"
**Screenshot:** `screenshots/09_tool_create_request_completed.png`
**Timestamp:** ~10:20

- Topic "Create new project request" eseguito in 10.11s
- Output: `Request ID: 20260526-101851`
- Genera documento OnePager su SharePoint con link diretto

---

## 🎬 DEMO VIDEO — Flusso Completo

### Clip 1: Setup Agente e Instructions (0:00 – 3:40)
**File:** `clips/clip1_setup_agent_instructions.mp4` (5.0 MB)

Mostra la configurazione completa dell'agente in Copilot Studio:
- Overview con nome, modello (GPT-5 Chat), Instructions complete
- Tab Knowledge e Tools
- Documento sorgente nella KnowledgeBase OneDrive

---

### Clip 2: Prompt Utente e Raccolta Dati (4:40 – 7:20)
**File:** `clips/clip2_user_prompt_data_collection.mp4` (3.5 MB)

L'utente invia il prompt iniziale e l'agente raccoglie tutti i campi strutturati:
- Title, Requester, Sponsor, Objective/Outcome
- Benefits, Urgency (H), Effort (M), Deadline (2026-09-22)
- Impacts, Dependencies, Risks, Notes
- Messaggio: "Ok, thanks! Please wait a minute while I check the existence of related requests..."

---

### Clip 3: AI Search con Work IQ MCP (7:20 – 9:20)
**File:** `clips/clip3_ai_search_workiq_results.mp4` (2.9 MB)

Il tool `copilot_chat` cerca nella KnowledgeBase OneDrive e restituisce:

**Top Related Documents & Key Insights:**
1. **Customer_Master_Cleanup_Initiative.docx** — Focus: Strategic initiative to enhance CRM data quality. Problems: Duplicate records, inconsistent naming, missing VAT IDs.
2. **CRM_Data_Quality_Meeting_Notes.docx** — Focus: Stakeholder discussions (Sales Ops, IT, Data Governance). Actions Agreed: Define validation rules, assess CRM duplicate detection.
3. **Customer_Data_Risk_Assessment.docx** — Focus: Risks & mitigations. Risks: CRM/ERP sync failures, unclear ownership.

**Summary of Emerging Themes:**
- Overlaps: governance discussions and risk assessments already exist
- Key Dependencies: ERP sync, governance process, ownership assignment
- Stakeholders Named: Sales Ops, IT, Data Governance teams

Decisione utente: ✅ Proceed as-is / ⟲ Revise the scope

---

### Clip 4: Revisione Titolo e Creazione Request (9:20 – 10:30)
**File:** `clips/clip4_revise_create_request.mp4` (2.0 MB)

- Utente sceglie "revise title" → inserisce "CRM data deduplication"
- Agente aggiorna il titolo e ripropone la scelta
- Utente sceglie "proceed as is"
- Power Automate crea la request (ID: 20260526-101851)
- Link SharePoint al documento OnePager generato

---

### Clip 5: OnePager su SharePoint + Copilot Word (10:30 – 13:12)
**File:** `clips/clip5_onepager_copilot_word.mp4` (4.0 MB)

- Apertura documento `OnePager_20260526-101851` su Word Online
- Documento contiene tutti i campi compilati + sezione "AI Notes" con markdown raw
- Utente usa **Copilot in Word**: "convert the markdown in the AI notes to Word formatting"
- Copilot formatta il documento: headings, bulleted lists, bold labels
- Risultato finale: OnePager professionale con:
  - Project/Request title: CRM data deduplication
  - Request ID, Requester, Sponsor, Dates, Status
  - Tutti i campi strutturati
  - AI Notes formattate con documenti correlati e temi emergenti

---

## 📁 Indice File Prodotti

### Screenshots (15 file)
| # | File | Categoria | Descrizione |
|---|------|-----------|-------------|
| 01 | `01_prompt_system_instructions.png` | Prompt | System instructions complete |
| 02 | `02_prompt_instructions_detail.png` | Prompt | Dettaglio/crop delle instructions |
| 03 | `03_prompt_user_request.png` | Prompt | Prompt utente iniziale |
| 04 | `04_tool_workiq_mcp_panel.png` | Tool | Pannello Work IQ MCP + copilot_chat |
| 05 | `05_tool_copilot_chat_working.png` | Tool | copilot_chat in esecuzione |
| 06 | `06_tool_copilot_chat_completed.png` | Tool | copilot_chat completato + risultati |
| 07 | `07_tool_topics_editor.png` | Tool | Editor Topics (New project request) |
| 08 | `08_tool_revise_title_flow.png` | Tool | Flusso revisione titolo |
| 09 | `09_tool_create_request_completed.png` | Tool | Power Automate completato |
| 10 | `10_demo_ai_search_results.png` | Demo | Risultati AI search |
| 11 | `11_demo_decision_point.png` | Demo | Punto decisionale utente |
| 12 | `12_demo_onepager_raw.png` | Demo | OnePager con markdown raw |
| 13 | `13_demo_copilot_word_formatting.png` | Demo | Copilot Word formatta AI Notes |
| 14 | `14_demo_final_onepager.png` | Demo | OnePager finale formattato |
| 15 | `15_demo_knowledge_source_doc.png` | Demo | Documento sorgente KnowledgeBase |

### Video Clips (5 file, totale ~17.4 MB)
| # | File | Durata | Contenuto |
|---|------|--------|-----------|
| 1 | `clip1_setup_agent_instructions.mp4` | 3:40 | Setup agente e prompt di sistema |
| 2 | `clip2_user_prompt_data_collection.mp4` | 2:40 | Prompt utente e raccolta dati |
| 3 | `clip3_ai_search_workiq_results.mp4` | 2:00 | AI Search + risultati KnowledgeBase |
| 4 | `clip4_revise_create_request.mp4` | 1:10 | Revisione e creazione request |
| 5 | `clip5_onepager_copilot_word.mp4` | 2:43 | OnePager + Copilot Word formatting |

---
name: frontend-slides
description: "Create stunning, animation-rich HTML presentations from scratch or by converting PowerPoint files. Use when the user wants to build a presentation, convert a PPT/PPTX to web, or create slides for a..."
argument-hint: "User can provide content as text, bullet points, or images. For PPT conversion, user provides the file. For existing presentation enhancement, user provides the HTML file."
metadata: 
  risk: safe
  source: "https://github.com/zarazhangrui/frontend-slides"
  date_added: "2026-02-27"
---

# Frontend Slides Skill

Create zero-dependency, animation-rich HTML presentations that run entirely in the browser. This skill helps non-designers discover their preferred aesthetic through visual exploration ("show, don't tell"), then generates production-quality slide decks.

## Core Philosophy

1. **Zero Dependencies** — Single HTML files with inline CSS/JS. No npm, no build tools.
2. **Show, Don't Tell** — People don't know what they want until they see it. Generate visual previews, not abstract choices.
3. **Distinctive Design** — Avoid generic "AI slop" aesthetics. Every presentation should feel custom-crafted.
4. **Production Quality** — Code should be well-commented, accessible, and performant.

---

## Phase 0: Detect Mode

First, determine what the user wants:

**Mode A: New Presentation**
- User wants to create slides from scratch
- Proceed to Phase 1 (Content Discovery)

**Mode B: PPT Conversion**
- User has a PowerPoint file (.ppt, .pptx) to convert
- Proceed to Phase 4 (PPT Extraction)

**Mode C: Existing Presentation Enhancement**
- User has an HTML presentation and wants to improve it
- Read the existing file, understand the structure, then enhance

**Mode D: Built-in Template**
- User asks for a specific built-in template by name (e.g. "Reply Template White")
- Skip Phase 2 (Style Discovery) entirely — the design system is predefined
- Proceed to Phase 1 (Content Discovery) then jump to Phase 3 (Generate Presentation) using the template spec from the **Built-in Templates** section below

---

## Phase 1: Content Discovery (New Presentations)

Before designing, understand the content. Ask via AskUserQuestion:

### Step 1.1: Presentation Context

**Question 1: Purpose**
- Header: "Purpose"
- Question: "What is this presentation for?"
- Options:
  - "Pitch deck" — Selling an idea, product, or company to investors/clients
  - "Teaching/Tutorial" — Explaining concepts, how-to guides, educational content
  - "Conference talk" — Speaking at an event, tech talk, keynote
  - "Internal presentation" — Team updates, strategy meetings, company updates

**Question 2: Slide Count**
- Header: "Length"
- Question: "Approximately how many slides?"
- Options:
  - "Short (5-10)" — Quick pitch, lightning talk
  - "Medium (10-20)" — Standard presentation
  - "Long (20+)" — Deep dive, comprehensive talk

**Question 3: Content**
- Header: "Content"
- Question: "Do you have the content ready, or do you need help structuring it?"
- Options:
  - "I have all content ready" — Just need to design the presentation
  - "I have rough notes" — Need help organizing into slides
  - "I have a topic only" — Need help creating the full outline

If user has content, ask them to share it (text, bullet points, images, etc.).

---

## Phase 2: Style Discovery (Visual Exploration)

**CRITICAL: This is the "show, don't tell" phase.**

Most people can't articulate design preferences in words. Instead of asking "do you want minimalist or bold?", we generate mini-previews and let them react.

### Step 2.0: Built-in Template Shortcut

Before exploring custom styles, proactively offer available built-in templates.

**Question 0: Template**
- Header: "Template"
- Question: "Would you like to start from a ready-made template, or explore custom styles?"
- Options:
  - "Reply Template White" — Corporate-professional white template with green accents, ideal for business & client-facing decks
  - "Custom style" — Explore moods and generate unique style previews

If the user picks **"Reply Template White"**, skip the rest of Phase 2 and go directly to Phase 3 using the predefined design system from the **Built-in Templates** section.

If the user picks **"Custom style"**, continue to Step 2.1.

### Step 2.1: Mood Selection

**Question 1: Feeling**
- Header: "Vibe"
- Question: "What feeling should the audience have when viewing your slides?"
- Options:
  - "Impressed/Confident" — Professional, trustworthy, this team knows what they're doing
  - "Excited/Energized" — Innovative, bold, this is the future
  - "Calm/Focused" — Clear, thoughtful, easy to follow
  - "Inspired/Moved" — Emotional, storytelling, memorable
- multiSelect: true (can choose up to 2)

### Step 2.2: Generate Style Previews

Based on their mood selection, generate **3 distinct style previews** as mini HTML files in a temporary directory. Each preview should be a single title slide showing:

- Typography (font choices, heading/body hierarchy)
- Color palette (background, accent, text colors)
- Animation style (how elements enter)
- Overall aesthetic feel

**Preview Styles to Consider (pick 3 based on mood):**

| Mood | Style Options |
|------|---------------|
| Impressed/Confident | "Corporate Elegant", "Dark Executive", "Clean Minimal", **"Reply Template White"** |
| Excited/Energized | "Neon Cyber", "Bold Gradients", "Kinetic Motion" |
| Calm/Focused | "Paper & Ink", "Soft Muted", "Swiss Minimal" |
| Inspired/Moved | "Cinematic Dark", "Warm Editorial", "Atmospheric" |

> **Note:** Regardless of mood, always include **"Reply Template White"** as one of the 3 preview options so the user can compare it side-by-side with custom styles. If the user already chose it in Step 2.0, this step is skipped.

**IMPORTANT: Never use these generic patterns:**
- Purple gradients on white backgrounds
- Inter, Roboto, or system fonts
- Standard blue primary colors
- Predictable hero layouts

**Instead, use distinctive choices:**
- Unique font pairings (Clash Display, Satoshi, Cormorant Garamond, DM Sans, etc.)
- Cohesive color themes with personality
- Atmospheric backgrounds (gradients, subtle patterns, depth)
- Signature animation moments

### Step 2.3: Present Previews

Create the previews in: `.slide-design/slide-previews/`

```
.slide-design/slide-previews/
├── style-a.html   # First style option
├── style-b.html   # Second style option
├── style-c.html   # Third style option
└── assets/        # Any shared assets
```

Each preview file should be:
- Self-contained (inline CSS/JS)
- A single "title slide" showing the aesthetic
- Animated to demonstrate motion style
- ~50-100 lines, not a full presentation

Present to user:
```
I've created 3 style previews for you to compare:

**Style A: [Name]** — [1 sentence description]
**Style B: [Name]** — [1 sentence description]
**Style C: [Name]** — [1 sentence description]

Open each file to see them in action:
- .slide-design/slide-previews/style-a.html
- .slide-design/slide-previews/style-b.html
- .slide-design/slide-previews/style-c.html

Take a look and tell me:
1. Which style resonates most?
2. What do you like about it?
3. Anything you'd change?
```

Then use AskUserQuestion:

**Question: Pick Your Style**
- Header: "Style"
- Question: "Which style preview do you prefer?"
- Options:
  - "Style A: [Name]" — [Brief description]
  - "Style B: [Name]" — [Brief description]
  - "Style C: [Name]" — [Brief description]
  - "Reply Template White" — Use the built-in corporate Reply template (if not already among A/B/C)
  - "Mix elements" — Combine aspects from different styles

If "Mix elements", ask for specifics.

---

## Phase 3: Generate Presentation

Now generate the full presentation based on:
- Content from Phase 1
- Style from Phase 2

### File Structure

For single presentations:
```
presentation.html    # Self-contained presentation
assets/              # Images, if any
```

For projects with multiple presentations:
```
[presentation-name].html
[presentation-name]-assets/
```

### HTML Architecture

Follow this structure for all presentations:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Presentation Title</title>

    <!-- Fonts (use Fontshare or Google Fonts) -->
    <link rel="stylesheet" href="https://api.fontshare.com/v2/css?f[]=...">

    <style>
        /* ===========================================
           CSS CUSTOM PROPERTIES (THEME)
           Easy to modify: change these to change the whole look
           =========================================== */
        :root {
            /* Colors */
            --bg-primary: #0a0f1c;
            --bg-secondary: #111827;
            --text-primary: #ffffff;
            --text-secondary: #9ca3af;
            --accent: #00ffcc;
            --accent-glow: rgba(0, 255, 204, 0.3);

            /* Typography */
            --font-display: 'Clash Display', sans-serif;
            --font-body: 'Satoshi', sans-serif;

            /* Spacing */
            --slide-padding: clamp(2rem, 5vw, 4rem);

            /* Animation */
            --ease-out-expo: cubic-bezier(0.16, 1, 0.3, 1);
            --duration-normal: 0.6s;
        }

        /* ===========================================
           BASE STYLES
           =========================================== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
            scroll-snap-type: y mandatory;
        }

        body {
            font-family: var(--font-body);
            background: var(--bg-primary);
            color: var(--text-primary);
            overflow-x: hidden;
        }

        /* ===========================================
           SLIDE CONTAINER
           Each section is one slide
           =========================================== */
        .slide {
            min-height: 100vh;
            padding: var(--slide-padding);
            scroll-snap-align: start;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        /* ===========================================
           ANIMATIONS
           Trigger via .visible class (added by JS on scroll)
           =========================================== */
        .reveal {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity var(--duration-normal) var(--ease-out-expo),
                        transform var(--duration-normal) var(--ease-out-expo);
        }

        .slide.visible .reveal {
            opacity: 1;
            transform: translateY(0);
        }

        /* Stagger children */
        .reveal:nth-child(1) { transition-delay: 0.1s; }
        .reveal:nth-child(2) { transition-delay: 0.2s; }
        .reveal:nth-child(3) { transition-delay: 0.3s; }
        .reveal:nth-child(4) { transition-delay: 0.4s; }

        /* ... more styles ... */
    </style>
</head>
<body>
    <!-- Progress bar (optional) -->
    <div class="progress-bar"></div>

    <!-- Navigation dots (optional) -->
    <nav class="nav-dots">
        <!-- Generated by JS -->
    </nav>

    <!-- Slides -->
    <section class="slide title-slide">
        <h1 class="reveal">Presentation Title</h1>
        <p class="reveal">Subtitle or author</p>
    </section>

    <section class="slide">
        <h2 class="reveal">Slide Title</h2>
        <p class="reveal">Content...</p>
    </section>

    <!-- More slides... -->

    <script>
        /* ===========================================
           SLIDE PRESENTATION CONTROLLER
           Handles navigation, animations, and interactions
           =========================================== */

        class SlidePresentation {
            constructor() {
                // ... initialization
            }

            // ... methods
        }

        // Initialize
        new SlidePresentation();
    </script>
</body>
</html>
```

### Required JavaScript Features

Every presentation should include:

1. **SlidePresentation Class** — Main controller
   - Keyboard navigation (arrows, space)
   - Touch/swipe support
   - Mouse wheel navigation
   - Progress bar updates
   - Navigation dots

2. **Intersection Observer** — For scroll-triggered animations
   - Add `.visible` class when slides enter viewport
   - Trigger CSS animations efficiently

3. **Optional Enhancements** (based on style):
   - Custom cursor with trail
   - Particle system background (canvas)
   - Parallax effects
   - 3D tilt on hover
   - Magnetic buttons
   - Counter animations

### Code Quality Requirements

**Comments:**
Every section should have clear comments explaining:
- What it does
- Why it exists
- How to modify it

```javascript
/* ===========================================
   CUSTOM CURSOR
   Creates a stylized cursor that follows mouse with a trail effect.
   - Uses lerp (linear interpolation) for smooth movement
   - Grows larger when hovering over interactive elements
   =========================================== */
class CustomCursor {
    constructor() {
        // ...
    }
}
```

**Accessibility:**
- Semantic HTML (`<section>`, `<nav>`, `<main>`)
- Keyboard navigation works
- ARIA labels where needed
- Reduced motion support

```css
@media (prefers-reduced-motion: reduce) {
    .reveal {
        transition: opacity 0.3s ease;
        transform: none;
    }
}
```

**Responsive:**
- Mobile-friendly (single column, adjusted spacing)
- Disable heavy effects on mobile
- Touch-friendly interactions

```css
@media (max-width: 768px) {
    .nav-dots,
    .keyboard-hint {
        display: none;
    }
}
```

---

## Phase 4: PPT Conversion

When converting PowerPoint files:

### Step 4.1: Extract Content

Use Python with `python-pptx` to extract:

```python
from pptx import Presentation
from pptx.util import Inches, Pt
import json
import os
import base64

def extract_pptx(file_path, output_dir):
    """
    Extract all content from a PowerPoint file.
    Returns a JSON structure with slides, text, and images.
    """
    prs = Presentation(file_path)
    slides_data = []

    # Create assets directory
    assets_dir = os.path.join(output_dir, 'assets')
    os.makedirs(assets_dir, exist_ok=True)

    for slide_num, slide in enumerate(prs.slides):
        slide_data = {
            'number': slide_num + 1,
            'title': '',
            'content': [],
            'images': [],
            'notes': ''
        }

        for shape in slide.shapes:
            # Extract title
            if shape.has_text_frame:
                if shape == slide.shapes.title:
                    slide_data['title'] = shape.text
                else:
                    slide_data['content'].append({
                        'type': 'text',
                        'content': shape.text
                    })

            # Extract images
            if shape.shape_type == 13:  # Picture
                image = shape.image
                image_bytes = image.blob
                image_ext = image.ext
                image_name = f"slide{slide_num + 1}_img{len(slide_data['images']) + 1}.{image_ext}"
                image_path = os.path.join(assets_dir, image_name)

                with open(image_path, 'wb') as f:
                    f.write(image_bytes)

                slide_data['images'].append({
                    'path': f"assets/{image_name}",
                    'width': shape.width,
                    'height': shape.height
                })

        # Extract notes
        if slide.has_notes_slide:
            notes_frame = slide.notes_slide.notes_text_frame
            slide_data['notes'] = notes_frame.text

        slides_data.append(slide_data)

    return slides_data
```

### Step 4.2: Confirm Content Structure

Present the extracted content to the user:

```
I've extracted the following from your PowerPoint:

**Slide 1: [Title]**
- [Content summary]
- Images: [count]

**Slide 2: [Title]**
- [Content summary]
- Images: [count]

...

All images have been saved to the assets folder.

Does this look correct? Should I proceed with style selection?
```

### Step 4.3: Style Selection

Proceed to Phase 2 (Style Discovery) with the extracted content in mind.

### Step 4.4: Generate HTML

Convert the extracted content into the chosen style, preserving:
- All text content
- All images (referenced from assets folder)
- Slide order
- Any speaker notes (as HTML comments or separate file)

---

## Phase 5: Delivery

### Step 5.1: Present the HTML

When the presentation is complete:

1. **Clean up temporary files**
   - Delete `.slide-design/slide-previews/` if it exists

2. **Open the presentation**
   - Use `open [filename].html` to launch in browser

3. **Provide summary**
```
Your presentation is ready!

📁 File: [filename].html
🎨 Style: [Style Name]
📊 Slides: [count]

**Navigation:**
- Arrow keys (← →) or Space to navigate
- Scroll/swipe also works
- Click the dots on the right to jump to a slide
```

### Step 5.2: Export Format Selection

After the user confirms the HTML looks good (or after any adjustments), ask how they want to export.

**Question: Export Format**
- Header: "Export"
- Question: "How would you like to export the presentation?"
- Options:
  - "HTML only" — Keep just the HTML file, no further export
  - "PDF" — Export to PDF (landscape, one slide per page)
  - "PowerPoint (PPTX)" — Generate a .pptx file with python-pptx
  - "Word (DOCX)" — Generate an A4 Word document with flowing content
  - "All formats" — Export PDF + PPTX + DOCX

If the user picks one or more export formats, generate the corresponding Python export script(s) and run them.

---

### Step 5.3a: PDF Export (Playwright)

Generate a Python script that uses **Playwright** (headless Chromium) to open the HTML and produce a landscape PDF with one slide per page.

**Key implementation details:**

```python
from pathlib import Path
from playwright.sync_api import sync_playwright

def export_pdf(html_path: str, output_path: str):
    src = Path(html_path)
    dst = Path(output_path)
    file_url = src.resolve().as_uri()

    with sync_playwright() as pw:
        browser = pw.chromium.launch()
        page = browser.new_page(viewport={"width": 1280, "height": 720})
        page.goto(file_url, wait_until="networkidle")
        page.wait_for_timeout(1500)

        # Force all slides visible + hide nav UI
        page.evaluate("""() => {
            document.querySelectorAll('.slide').forEach(s => s.classList.add('visible'));
            document.querySelectorAll('.reveal').forEach(r => {
                r.style.opacity = '1';
                r.style.transform = 'translateY(0)';
            });
            ['progressBar','navDots','slideCounter','fullscreenBtn'].forEach(id => {
                const el = document.getElementById(id);
                if (el) el.style.display = 'none';
            });
            document.documentElement.style.scrollSnapType = 'none';
            document.querySelectorAll('.slide').forEach(s => {
                s.style.scrollSnapAlign = 'unset';
                s.style.minHeight = '100vh';
                s.style.pageBreakAfter = 'always';
                s.style.breakAfter = 'page';
            });
            // Trigger any canvas charts redraw
            if (typeof drawGanttChart === 'function') drawGanttChart();
        }""")

        page.wait_for_timeout(800)

        page.pdf(
            path=str(dst),
            format="A4",
            landscape=True,
            print_background=True,
            margin={"top": "0mm", "right": "0mm", "bottom": "0mm", "left": "0mm"},
        )
        browser.close()
    print(f"✓ PDF generated: {dst}")
```

**Requirements:** `pip install playwright && python -m playwright install chromium`

---

### Step 5.3b: PPTX Export (python-pptx)

Generate a Python script that uses **python-pptx** to create a `.pptx` file from the presentation data. The script must:

1. Parse the HTML with BeautifulSoup to extract slide content
2. Map each HTML slide type (`.slide-cover`, `.slide-section`, `.slide-text-single`, etc.) to a PPTX slide
3. Apply the same brand palette (Reply colors, Arial fonts) using python-pptx
4. Use 16:9 slide dimensions (`Inches(13.333) × Inches(7.5)`)
5. Reproduce tables, bullet lists, and charts as native PPTX shapes
6. Add footer with presentation name

**Key patterns (from existing project scripts):**

```python
from pptx import Presentation
from pptx.util import Inches, Pt
from pptx.dml.color import RGBColor
from pptx.enum.text import PP_ALIGN

APPLE_GREEN = RGBColor(0x76, 0xB8, 0x2A)
# ... other Reply brand colors

prs = Presentation()
prs.slide_width = Inches(13.333)
prs.slide_height = Inches(7.5)
blank_layout = prs.slide_layouts[6]

# For each slide parsed from HTML:
# - Create a blank slide
# - Add shapes (textbox, table, image) with Reply styling
# - Apply correct font, color, alignment per slide type
```

**Requirements:** `pip install python-pptx beautifulsoup4`

---

### Step 5.3c: Word/DOCX Export (python-docx)

Generate a Python script that uses **python-docx** and **BeautifulSoup** to create an A4 portrait Word document. 

**CRITICAL: Section divider merging rule.**
Section divider slides (`.slide-section`) must NOT produce a standalone page with just a title. Instead, the section title must be integrated as a heading at the top of the next content slide's page. This avoids wasted pages with only a title.

**Key implementation details:**

```python
from pathlib import Path
from bs4 import BeautifulSoup
from docx import Document
from docx.enum.section import WD_ORIENT
from docx.shared import Cm, Pt, RGBColor

REPLY_GREEN = RGBColor(0x76, 0xB8, 0x2A)

def convert(html_path: str, output_path: str):
    with open(html_path, encoding="utf-8") as f:
        soup = BeautifulSoup(f.read(), "html.parser")

    doc = Document()
    # A4 portrait setup
    section = doc.sections[0]
    section.orientation = WD_ORIENT.PORTRAIT
    section.page_width = Cm(21.0)
    section.page_height = Cm(29.7)
    section.top_margin = Cm(1.5)
    section.bottom_margin = Cm(1.5)
    section.left_margin = Cm(2.0)
    section.right_margin = Cm(2.0)

    slides = soup.find_all("section", class_="slide")
    pending_section_title = None  # Buffer for section divider merging

    for i, slide in enumerate(slides):
        classes = slide.get("class", [])

        # Buffer section dividers — do NOT emit a page break
        if "slide-section" in classes:
            phrase = slide.find(class_="section-phrase")
            impact = slide.find(class_="section-impact")
            pending_section_title = {
                "phrase": clean(phrase.get_text()) if phrase else "",
                "impact": clean(impact.get_text()) if impact else "",
            }
            continue  # Don't emit anything yet

        # If there's a buffered section title, emit it before this slide's content
        if pending_section_title:
            doc.add_page_break()
            h = doc.add_heading(pending_section_title["phrase"], level=1)
            for run in h.runs:
                run.font.color.rgb = REPLY_GREEN
            if pending_section_title["impact"]:
                p = doc.add_paragraph()
                run = p.add_run(pending_section_title["impact"])
                run.font.size = Pt(11)
                run.font.color.rgb = TEXT_SECONDARY
            pending_section_title = None
            # Then continue to emit the current slide content
            # WITHOUT an extra page break (they share the same page)
        else:
            doc.add_page_break()

        # ... emit current slide content (title, body, tables, bullets, etc.)

    doc.save(output_path)
```

**Requirements:** `pip install python-docx beautifulsoup4`

---

### Step 5.4: Deliver Exports

After running the export script(s), provide a summary:

```
Export complete!

📄 [filename].pdf — Landscape PDF, one slide per page
📊 [filename].pptx — PowerPoint 16:9 presentation
📝 [filename].docx — A4 Word document with flowing content

All files are in the same directory as the HTML source.
```

---

## Style Reference: Effect → Feeling Mapping

Use this guide to match animations to intended feelings:

### Dramatic / Cinematic
- Slow fade-ins (1-1.5s)
- Large scale transitions (0.9 → 1)
- Dark backgrounds with spotlight effects
- Parallax scrolling
- Full-bleed images

### Techy / Futuristic
- Neon glow effects (box-shadow with accent color)
- Particle systems (canvas background)
- Grid patterns
- Monospace fonts for accents
- Glitch or scramble text effects
- Cyan, magenta, electric blue palette

### Playful / Friendly
- Bouncy easing (spring physics)
- Rounded corners (large radius)
- Pastel or bright colors
- Floating/bobbing animations
- Hand-drawn or illustrated elements

### Professional / Corporate
- Subtle, fast animations (200-300ms)
- Clean sans-serif fonts
- Navy, slate, or charcoal backgrounds
- Precise spacing and alignment
- Minimal decorative elements
- Data visualization focus

### Calm / Minimal
- Very slow, subtle motion
- High whitespace
- Muted color palette
- Serif typography
- Generous padding
- Content-focused, no distractions

### Editorial / Magazine
- Strong typography hierarchy
- Pull quotes and callouts
- Image-text interplay
- Grid-breaking layouts
- Serif headlines, sans-serif body
- Black and white with one accent

---

## Animation Patterns Reference

### Entrance Animations

```css
/* Fade + Slide Up (most common) */
.reveal {
    opacity: 0;
    transform: translateY(30px);
    transition: opacity 0.6s var(--ease-out-expo),
                transform 0.6s var(--ease-out-expo);
}

.visible .reveal {
    opacity: 1;
    transform: translateY(0);
}

/* Scale In */
.reveal-scale {
    opacity: 0;
    transform: scale(0.9);
    transition: opacity 0.6s, transform 0.6s var(--ease-out-expo);
}

/* Slide from Left */
.reveal-left {
    opacity: 0;
    transform: translateX(-50px);
    transition: opacity 0.6s, transform 0.6s var(--ease-out-expo);
}

/* Blur In */
.reveal-blur {
    opacity: 0;
    filter: blur(10px);
    transition: opacity 0.8s, filter 0.8s var(--ease-out-expo);
}
```

### Background Effects

```css
/* Gradient Mesh */
.gradient-bg {
    background:
        radial-gradient(ellipse at 20% 80%, rgba(120, 0, 255, 0.3) 0%, transparent 50%),
        radial-gradient(ellipse at 80% 20%, rgba(0, 255, 200, 0.2) 0%, transparent 50%),
        var(--bg-primary);
}

/* Noise Texture */
.noise-bg {
    background-image: url("data:image/svg+xml,..."); /* Inline SVG noise */
}

/* Grid Pattern */
.grid-bg {
    background-image:
        linear-gradient(rgba(255,255,255,0.03) 1px, transparent 1px),
        linear-gradient(90deg, rgba(255,255,255,0.03) 1px, transparent 1px);
    background-size: 50px 50px;
}
```

### Interactive Effects

```javascript
/* 3D Tilt on Hover */
class TiltEffect {
    constructor(element) {
        this.element = element;
        this.element.style.transformStyle = 'preserve-3d';
        this.element.style.perspective = '1000px';
        this.bindEvents();
    }

    bindEvents() {
        this.element.addEventListener('mousemove', (e) => {
            const rect = this.element.getBoundingClientRect();
            const x = (e.clientX - rect.left) / rect.width - 0.5;
            const y = (e.clientY - rect.top) / rect.height - 0.5;

            this.element.style.transform = `
                rotateY(${x * 10}deg)
                rotateX(${-y * 10}deg)
            `;
        });

        this.element.addEventListener('mouseleave', () => {
            this.element.style.transform = 'rotateY(0) rotateX(0)';
        });
    }
}
```

---

## Troubleshooting

### Common Issues

**Fonts not loading:**
- Check Fontshare/Google Fonts URL
- Ensure font names match in CSS

**Animations not triggering:**
- Verify Intersection Observer is running
- Check that `.visible` class is being added

**Scroll snap not working:**
- Ensure `scroll-snap-type` on html/body
- Each slide needs `scroll-snap-align: start`

**Mobile issues:**
- Disable heavy effects at 768px breakpoint
- Test touch events
- Reduce particle count or disable canvas

**Performance issues:**
- Use `will-change` sparingly
- Prefer `transform` and `opacity` animations
- Throttle scroll/mousemove handlers

---

## Related Skills

- **learn** — Generate FORZARA.md documentation for the presentation
- **frontend-design** — For more complex interactive pages beyond slides
- **design-and-refine:design-lab** — For iterating on component designs

---

## Example Session Flow

1. User: "I want to create a pitch deck for my AI startup"
2. Skill asks about purpose, length, content
3. User shares their bullet points and key messages
4. Skill asks about desired feeling (Impressed + Excited)
5. Skill generates 3 style previews
6. User picks Style B (Neon Cyber), asks for darker background
7. Skill generates full presentation with all slides
8. Skill opens the presentation in browser
9. User requests tweaks to specific slides
10. Final presentation delivered

---

## Conversion Session Flow

1. User: "Convert my slides.pptx to a web presentation"
2. Skill extracts content and images from PPT
3. Skill confirms extracted content with user
4. Skill asks about desired feeling/style
5. Skill generates style previews
6. User picks a style
7. Skill generates HTML presentation with preserved assets
8. Final presentation delivered

---

## Built-in Templates

### Template 4: Reply Template White

A corporate-professional template inspired by the Reply consulting brand. White background, clean typography, green accents, structured layouts. Ideal for business presentations, project updates, and client-facing decks.

#### Design System

##### Color Palette

```css
:root {
    /* Backgrounds */
    --bg-primary: #ffffff;
    --bg-secondary: #f5f5f5;
    --bg-dark: #1a1a1a;
    --bg-overlay-50: rgba(255, 255, 255, 0.5);  /* 50% white overlay for image slides */
    --bg-overlay-100: rgba(255, 255, 255, 1);   /* solid white band */

    /* Text */
    --text-primary: #1a1a1a;           /* Black */
    --text-secondary: #555555;
    --text-on-dark: #ffffff;

    /* Reply Brand Colors */
    --accent-apple-green: #76b82a;     /* Accent 1 — primary accent */
    --accent-dark-green: #2d6a2e;
    --accent-bright-green: #8cc63f;    /* Accent 2 — bullets, highlights, textual evidence */
    --accent-vivid-blue: #0072ce;      /* Accent 3 */
    --accent-deep-rose: #c4376b;       /* Accent 4 */
    --accent-light-rose: #e8768a;      /* Accent 5 */
    --accent-amber: #f5a623;           /* Accent 6 */
    --accent-turquoise: #00b4d8;       /* Hyperlink */
    --accent-acid-green: #a4c639;      /* Followed Hyperlink */

    /* Functional */
    --bullet-color: var(--accent-bright-green);
    --highlight-color: var(--accent-bright-green);
    --chart-color-1: var(--accent-apple-green);
    --chart-color-2: var(--accent-vivid-blue);
    --chart-color-3: var(--accent-amber);
    --chart-color-4: var(--accent-deep-rose);
    --chart-color-5: var(--accent-turquoise);
    --chart-color-6: var(--accent-dark-green);
}
```

##### Typography

Use **Arial** font family (system font, no external dependency).

```css
:root {
    --font-display: 'Arial Black', 'Arial Bold', sans-serif;
    --font-body: Arial, Helvetica, sans-serif;
}

/* Title on cover slide: left-aligned, white, Arial Black 60pt, CAPITALIZED */
.cover-title {
    font-family: var(--font-display);
    font-size: clamp(2.5rem, 5vw, 3.75rem); /* ~60pt scaled */
    text-transform: uppercase;
    color: var(--text-on-dark);
    text-align: left;
    line-height: 1.1;
}

/* Subtitle on cover: left-aligned, white, Arial 18pt */
.cover-subtitle {
    font-family: var(--font-body);
    font-size: clamp(0.875rem, 1.5vw, 1.125rem);
    color: var(--text-on-dark);
    text-align: left;
}

/* Title on content slides: top-centered, black, Arial Black 32pt, CAPITALIZED */
.slide-title {
    font-family: var(--font-display);
    font-size: clamp(1.5rem, 3vw, 2rem); /* ~32pt scaled */
    text-transform: uppercase;
    color: var(--text-primary);
    text-align: center;
}

/* Subtitle on content slides: centered below title, Arial Black 16pt, CAPITALIZED */
.slide-subtitle {
    font-family: var(--font-display);
    font-size: clamp(0.75rem, 1.2vw, 1rem);
    text-transform: uppercase;
    color: var(--text-secondary);
    text-align: center;
}

/* Body text: left-aligned, black, Arial 18pt (reducible to 14pt) */
.body-text {
    font-family: var(--font-body);
    font-size: clamp(0.875rem, 1.3vw, 1.125rem);
    color: var(--text-primary);
    line-height: 1.6;
}

/* Textual evidence: Bright Green, capitalized, or Black Arial Black */
.text-evidence {
    color: var(--highlight-color);
    text-transform: uppercase;
    font-family: var(--font-display);
}

/* Bullets: squared ▪, Bright Green, 130% of text size */
.bullet-list {
    list-style: none;
    padding-left: 1.5em;
}
.bullet-list li::before {
    content: '▪';
    color: var(--bullet-color);
    font-size: 130%;
    margin-left: -1.5em;
    margin-right: 0.5em;
}
```

##### Slide Types

Every Reply Template White presentation should include a selection of these predefined slide types. Each type has a specific HTML class and layout.

| Slide Type | HTML Class | Description |
|------------|------------|-------------|
| **Cover** | `.slide-cover` | Gradient or dark background, large title left-aligned, subtitle + author below |
| **Meeting Agenda** | `.slide-agenda` | Numbered list (1–6), optional subtitle, white background |
| **Section Divider** | `.slide-section` | Impact phrase (24pt), centered, used to introduce topic sections |
| **Statement Chart** | `.slide-statement` | Large statement text centered on white, dark, or image+overlay background |
| **Single Column Text** | `.slide-text-single` | Title + body text, optional bulleted list |
| **Double Column Text** | `.slide-text-double` | Title + two equal columns of body text side by side |
| **Image Fullscreen** | `.slide-image-full` | Background image, top/bottom bars with 50% white transparency |
| **Image + Side Text** | `.slide-image-side` | Left: inserted image; Right: text evidence + body copy |
| **Image + Gradient Side** | `.slide-image-gradient` | Like Image+Side but with a highlighted data callout (e.g. "+60%") |
| **Bar Chart** | `.slide-chart-bar` | Single/double/triple column bar chart with Reply palette |
| **Trend Chart** | `.slide-chart-trend` | Horizontal progress bars (percentage trends) |
| **Pie Chart** | `.slide-chart-pie` | Pie/donut chart with percentages |
| **Table** | `.slide-table` | Styled table with green header row and alternating rows |
| **Gantt / Timeline** | `.slide-gantt` | Timeline grid with colored bars per task |
| **Organigram** | `.slide-orgchart` | Hierarchical box layout (org chart) |
| **Thank You** | `.slide-thankyou` | Closing slide with "THANK YOU" + URL |

##### Layout Architecture

```html
<!-- COVER SLIDE (gradient or image background) -->
<section class="slide slide-cover">
    <div class="cover-content">
        <h1 class="cover-title reveal">TITLE<br>OF YOUR<br>PRESENTATION</h1>
        <p class="cover-subtitle reveal">Name, Surname | Job Title</p>
    </div>
</section>

<!-- MEETING AGENDA -->
<section class="slide slide-agenda">
    <h2 class="slide-title reveal">MEETING AGENDA</h2>
    <p class="slide-subtitle reveal">OPTIONAL SUBTITLE</p>
    <ol class="agenda-list">
        <li class="reveal"><span class="agenda-number">1</span> Introduction</li>
        <li class="reveal"><span class="agenda-number">2</span> Title of the second point</li>
        <li class="reveal"><span class="agenda-number">3</span> Title of the third point</li>
    </ol>
</section>

<!-- SECTION DIVIDER -->
<section class="slide slide-section">
    <h2 class="section-phrase reveal">SECTION SLIDE</h2>
    <p class="section-impact reveal">Here you may use an impact phrase to
    introduce your topic. The font size used
    within this copy box usually is 24pt.</p>
</section>

<!-- STATEMENT CHART (white background) -->
<section class="slide slide-statement">
    <h2 class="statement-text reveal">STATEMENT<br>CHART FOR<br>IMPORTANT POINTS</h2>
</section>

<!-- SINGLE COLUMN TEXT -->
<section class="slide slide-text-single">
    <h2 class="slide-title reveal">TEMPLATE WITH SINGLE COLUMN</h2>
    <p class="slide-subtitle reveal">SAMPLES WITH AND WITHOUT BULLETED TEXT</p>
    <div class="text-content reveal">
        <p class="body-text">This is an example of a simple text with the standard style applied.</p>
        <p class="text-evidence">YOU CAN ALSO USE TEXTUAL EVIDENCE</p>
        <ul class="bullet-list">
            <li>Please make sure the bullets are used in colored font and at 130% of text size.</li>
            <li>The fontsize used within copy boxes usually is 18pt.</li>
        </ul>
    </div>
</section>

<!-- DOUBLE COLUMN TEXT -->
<section class="slide slide-text-double">
    <h2 class="slide-title reveal">TEMPLATE WITH DOUBLE COLUMN</h2>
    <p class="slide-subtitle reveal">SAMPLES WITH AND WITHOUT BULLETED TEXT</p>
    <div class="columns-2 reveal">
        <div class="column">
            <p class="body-text">Left column content...</p>
            <ul class="bullet-list">
                <li>Bullet point A</li>
            </ul>
        </div>
        <div class="column">
            <p class="body-text">Right column content...</p>
            <ul class="bullet-list">
                <li>Bullet point B</li>
            </ul>
        </div>
    </div>
</section>

<!-- IMAGE FULLSCREEN with overlay -->
<section class="slide slide-image-full" style="background-image: url('assets/image.jpg')">
    <div class="overlay-band top"></div>
    <h2 class="slide-title reveal">TEMPLATE WITH SINGLE IMAGE</h2>
    <p class="slide-subtitle reveal">FULLSCREEN BACKGROUND IMAGE</p>
    <div class="overlay-band bottom">
        <p class="body-text reveal">Caption or note text at the bottom.</p>
    </div>
</section>

<!-- IMAGE + SIDE TEXT -->
<section class="slide slide-image-side">
    <div class="image-panel">
        <img src="assets/image.jpg" alt="Descriptive alt">
    </div>
    <div class="text-panel reveal">
        <p class="text-evidence">YOU CAN ALSO USE TEXTUAL EVIDENCE</p>
        <p class="body-text">Body text next to the image...</p>
    </div>
</section>

<!-- BAR CHART -->
<section class="slide slide-chart-bar">
    <h2 class="slide-title reveal">TEMPLATE FOR CHART</h2>
    <p class="slide-subtitle reveal">WITH WHITE BACKGROUND</p>
    <div class="chart-container reveal">
        <!-- Chart rendered via inline JS (see Chart Rendering section) -->
        <canvas class="reply-chart" data-type="bar"></canvas>
    </div>
</section>

<!-- TABLE -->
<section class="slide slide-table">
    <h2 class="slide-title reveal">TABLE EXAMPLE</h2>
    <table class="reply-table reveal">
        <thead>
            <tr><th>ISSUE</th><th>DESCRIPTION</th><th>NUMBER</th></tr>
        </thead>
        <tbody>
            <tr><td>Name of Issue</td><td>Description text</td><td>Value</td></tr>
        </tbody>
    </table>
</section>

<!-- THANK YOU -->
<section class="slide slide-thankyou">
    <h2 class="thankyou-text reveal">THANK YOU</h2>
    <p class="thankyou-url reveal">www.reply.com</p>
</section>
```

##### Specific CSS for Reply Template White

```css
/* ===========================================
   REPLY TEMPLATE WHITE — COMPONENT STYLES
   =========================================== */

/* Cover slide: gradient background */
.slide-cover {
    background: linear-gradient(135deg, var(--accent-dark-green) 0%, var(--accent-apple-green) 50%, var(--accent-bright-green) 100%);
    justify-content: flex-end;
    padding-bottom: 10vh;
}
.cover-content {
    max-width: 70%;
}

/* Agenda slide */
.slide-agenda {
    background: var(--bg-primary);
}
.agenda-list {
    list-style: none;
    padding: 0;
    max-width: 600px;
    margin: 2rem auto;
}
.agenda-list li {
    font-family: var(--font-body);
    font-size: clamp(1rem, 1.5vw, 1.25rem);
    padding: 0.75rem 0;
    border-bottom: 1px solid #e0e0e0;
    display: flex;
    align-items: center;
    gap: 1.5rem;
}
.agenda-number {
    font-family: var(--font-display);
    font-size: 1.5em;
    color: var(--accent-apple-green);
    min-width: 2rem;
    text-align: center;
}

/* Section divider */
.slide-section {
    background: var(--bg-primary);
    text-align: center;
    justify-content: center;
}
.section-phrase {
    font-family: var(--font-display);
    font-size: clamp(1.5rem, 3vw, 2.5rem);
    text-transform: uppercase;
    color: var(--accent-apple-green);
}
.section-impact {
    font-family: var(--font-body);
    font-size: clamp(1rem, 1.8vw, 1.5rem);
    color: var(--text-secondary);
    max-width: 600px;
    margin: 1rem auto;
}

/* Statement chart */
.slide-statement {
    text-align: center;
    justify-content: center;
}
.statement-text {
    font-family: var(--font-display);
    font-size: clamp(2rem, 4vw, 3.5rem);
    text-transform: uppercase;
    line-height: 1.2;
    color: var(--text-primary);
}

/* Double column layout */
.columns-2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 2rem;
    padding: 2rem 0;
}
@media (max-width: 768px) {
    .columns-2 { grid-template-columns: 1fr; }
}

/* Image fullscreen with overlay bands */
.slide-image-full {
    background-size: cover;
    background-position: center;
}
.overlay-band {
    background: var(--bg-overlay-50);
    padding: 1rem var(--slide-padding);
    width: 100%;
}
.overlay-band.top { position: absolute; top: 0; left: 0; }
.overlay-band.bottom { position: absolute; bottom: 0; left: 0; }

/* Image + side text */
.slide-image-side {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 0;
    padding: 0;
}
.image-panel {
    overflow: hidden;
}
.image-panel img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.text-panel {
    padding: var(--slide-padding);
    display: flex;
    flex-direction: column;
    justify-content: center;
}
@media (max-width: 768px) {
    .slide-image-side { grid-template-columns: 1fr; }
    .image-panel { max-height: 40vh; }
}

/* Reply-styled table */
.reply-table {
    width: 100%;
    border-collapse: collapse;
    margin: 2rem 0;
    font-family: var(--font-body);
}
.reply-table thead th {
    background: var(--accent-apple-green);
    color: white;
    text-transform: uppercase;
    font-family: var(--font-display);
    font-size: 0.85rem;
    padding: 0.75rem 1rem;
    text-align: left;
}
.reply-table tbody tr:nth-child(even) {
    background: var(--bg-secondary);
}
.reply-table tbody td {
    padding: 0.75rem 1rem;
    border-bottom: 1px solid #e0e0e0;
    font-size: 0.9rem;
}

/* Gantt / timeline table */
.slide-gantt table {
    width: 100%;
}
.gantt-bar {
    height: 1rem;
    border-radius: 0.25rem;
    background: var(--accent-apple-green);
}

/* Thank you slide */
.slide-thankyou {
    background: linear-gradient(135deg, var(--accent-dark-green), var(--accent-apple-green));
    text-align: center;
    justify-content: center;
}
.thankyou-text {
    font-family: var(--font-display);
    font-size: clamp(3rem, 6vw, 5rem);
    color: var(--text-on-dark);
    text-transform: uppercase;
}
.thankyou-url {
    font-family: var(--font-body);
    font-size: 1.125rem;
    color: rgba(255, 255, 255, 0.8);
    margin-top: 1rem;
}

/* Progress bar uses Reply green */
.progress-bar {
    background: var(--accent-apple-green);
}
```

##### Chart Rendering (inline JS)

For bar, trend, and pie charts, render using inline `<canvas>` with a lightweight draw function (no Chart.js dependency). The chart palette must follow the Reply color scheme:

```javascript
const REPLY_PALETTE = [
    '#76b82a', // Apple Green (Accent 1)
    '#0072ce', // Vivid Blue (Accent 3)
    '#f5a623', // Amber (Accent 6)
    '#c4376b', // Deep Rose (Accent 4)
    '#00b4d8', // Turquoise
    '#2d6a2e', // Dark Green
];
```

##### Animation Guidelines for Reply Template White

- Use **subtle, fast animations** (200–400ms) — professional feel, not cinematic
- Preferred easing: `cubic-bezier(0.25, 0.1, 0.25, 1)` (ease-out)
- Entrance: **fade + slide-up** (20px translateY, not 30px — more restrained)
- Stagger children at **100ms intervals**
- No particle effects, no cursor trails, no parallax — keep it corporate-clean
- Charts should animate bars/slices growing in, counters ticking up

```css
/* Reply-specific animation overrides */
.reply-template .reveal {
    transform: translateY(20px);
    transition-duration: 0.4s;
    transition-timing-function: cubic-bezier(0.25, 0.1, 0.25, 1);
}
```

##### When to Use Reply Template White

- Client-facing deliverables for Reply or Reply affiliates
- Professional project updates and steering committee presentations
- Any presentation where the Reply brand identity is required
- Corporate meetings requiring clean, structured layouts
- When the user explicitly requests this template by name

---

## When to Use
This skill is applicable to execute the workflow or actions described in the overview.
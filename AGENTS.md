# AGENTS.md – CV generation for Emmanuel Dakdem Nguena

## Goal
When I give you a job posting (URL or pasted text), create a tailored, professional,
German-language CV as a compiled PDF – fully automatically, without further questions
unless information is truly missing.

## Project structure
- `profile/master_profile.md`  → SINGLE SOURCE OF TRUTH for all facts about me.
- `template/cv_template.tex`   → Layout/design. NEVER change colors, fonts, layout or sections order
                                 unless I explicitly ask. Only change the CONTENT.
- `applications/<Company>_<Position>/` → one folder per job, containing:
    - `job.md`    (job posting text + URL + date)
    - `cv.tex`    (tailored CV, copied from the template)
    - `cv.pdf`    (compiled)
    - `notes.md`  (what you changed and why, keywords used, anything you were unsure about)

## Workflow (do this for every job posting)
1. Work on the `main` branch at all times. Do not create a feature branch for these CV applications.
2. Fetch the posting. If the URL cannot be opened (login wall, LinkedIn, etc.), STOP and ask me
   to paste the text. Never guess the content of a posting.
3. Save the text to `applications/<Company>_<Position>/job.md`.
4. Extract: required skills, tools, keywords, tasks, language of the posting, seniority (Werkstudent,
   Praktikum, Berufseinstieg, ...).
5. Read `profile/master_profile.md` and review any added certificates / Zeugnisse as evidence.
6. Apply an evidence-first matching strategy:
   - Treat formal certificates, diplomas, trainings and documented proofs as stronger evidence than
     implied experience or self-declared skills.
   - Prioritize qualifications that are directly supported by Zeugnisse or issued credentials when
     matching to the job requirements.
   - Use certificates to justify relevant skills, training, and formal qualification claims only when
     they are explicitly supported by the documents.
   - If a certificate is only partially relevant, mention it in the notes and use it as secondary
     evidence rather than as the main argument.
7. Copy `template/cv_template.tex` to `applications/<Company>_<Position>/cv.tex` and adapt it:
   - Rewrite the profile paragraph (max. 5 lines) to match the role.
   - Reorder and select bullet points: the most relevant first, drop the least relevant.
   - Reuse wording/keywords from the posting ONLY where it truthfully matches my experience.
   - Reorder the skills list so the required skills come first.
   - Keep the CV to max. 2 pages (1 page if the posting is for an internship/Werkstudent role
     and everything fits).
8. Compile: `cd applications/<folder> && latexmk -pdf cv.tex` (fall back to `pdflatex` twice).
   Fix all errors and overfull/overlapping text. Check the page count.
9. Write `notes.md`: matched keywords, certificate-based evidence, changes made, gaps between posting and my profile.
10. Commit the generated application files and push them to the remote repository immediately after each
    successful CV generation. Use the current `main` branch and keep the repository state synced.

## Hard rules
- NEVER invent or exaggerate: no new employers, degrees, dates, tools, skill levels or numbers.
  Only use facts from `profile/master_profile.md`. If the posting asks for something I do not have,
  list it in `notes.md` as a gap – do not add it to the CV.
- Do not change dates, employers, degree names, contact data.
- Language: German by default; English if the posting is in English (translate content, keep
  the same layout; section titles then: Professional Experience, Education, Projects, Skills).
- Style: professional, concise, active verbs, no first-person pronouns, no filler adjectives.
- LaTeX: pdfLaTeX, escape special characters (& % _ #), use `\,` in abbreviations like `z.\,B.`.
- No photo in the CV.
- Never edit `profile/master_profile.md` or `template/cv_template.tex` while doing an application.
  If you think they should be updated, tell me in your reply.

## Final reply format
Short summary: path to the PDF, page count, 3–5 most important adaptations, gaps/risks.

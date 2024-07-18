#import "../template.typ" : template

#show: template.with(
  title: "Entwurf & Implementierung eines 3D-Avatars basierend auf künstlicher Intelligenz als Verkaufsberater",
  author: "Masoud Abdulhanan",
  date: datetime(year: 2024, month: 9, day: 9),
  logos: (
    image("assets/dhbw.svg", width: 30%),
    image("assets/telekom.svg", width: 15%),
  ),
  details: (
    "Course, Student ID": "TINF21A, 9769728",
    "Company": "Deutsche Telekom AG",
    "Supervisor": "Nguygen, Thi Ba-Nha",
  ),
  abstract: include "abstract.typ",
  acronyms: yaml("acronyms.yml"),
)

#include "chapters/introduction.typ"
#include "chapters/grundlagen.typ"
#include "chapters/GenAI.typ"
#include "chapters/ConvAI.typ"
#include "chapters/conclusion.typ"

#bibliography("references.yml")
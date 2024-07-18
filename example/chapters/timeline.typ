#import "@preview/timeliney:0.0.1"

#timeliney.timeline(
  show-grid: true,
  {
    import timeliney: *

    headerline(
      group(([*KW28*], 1)), group(([*KW29*], 1)), group(([*KW30*], 1)),
      group(([*KW31*], 1)), group(([*KW32*], 1)), group(([*KW33*], 1)), group(([*KW34*], 1)),
      group(([*KW35*], 1)), group(([*KW36*], 1)), group(([*KW37*], 1))
    )
  
    taskgroup(title: [*Bachelorarbeit*], {
      task("Projektbeschreibung", (0.5, 2), style: (stroke: 2pt + gray))
      task("Lückenanalyse", (1, 2.5), style: (stroke: 2pt + gray))
      task("Lösungsentwicklung", (2, 7), style: (stroke: 2pt + gray))
      task("Conclusion", (7, 8.5), style: (stroke: 2pt + gray))
      task("Introduction", (7, 8.5), style: (stroke: 2pt + gray))
      task("Abstract", (7, 8.5), style: (stroke: 2pt + gray))
      task("Finale Überarbeitung", (8.5, 9), style: (stroke: 2pt + gray))
    })

    milestone(
      at: 8.5,
      style: (stroke: (dash: "dashed")),
      align(center, [
        *Überarbeitung*\
        28.08.2024
      ])
    )

    milestone(
      at: 10,
      style: (stroke: (dash: "dashed")),
      align(center, [
        *Abgabe*\
        09.09.2024
      ])
    )
  }
)

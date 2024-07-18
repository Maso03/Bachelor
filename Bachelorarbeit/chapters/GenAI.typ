== Generative Intelligenz (GenAI)

Generative Intelligenz (GenAI) bezeichnet eine Klasse von Künstlicher Intelligenz, die das Konzept von Maschinen umfasst, die menschliche Intelligenz imitieren. Dies geschieht mithilfe von maschinellem Lernen (ML), das Muster erkennt, und Deep Learning, das künstliche neuronale Netze verwendet. GenAI kann im Gegensatz zu "normalen" KI-Systemen neue Inhalte generieren, indem sie die Muster ihrer Trainingsdaten analysiert und versteht. Basierend auf diesen Technologien ist GenAI in der Lage, große Mengen an Daten zu verarbeiten und daraus relevante Inhalte zu erzeugen, wie Texte, Bilder, Musiknoten und mehr @IWWB @GoogleGenAI.
#figure(
  image("/example/assets/GenAI.jpg", width: 50%),
  caption: [Visualisierung von KI-Systemen, Quelle: Google Cloud],
) <cluster-single-node>


=== Modelle und Technologien

Es gibt verschiedene generative Modelle, die in der Forschung und Praxis eingesetzt werden. Im Detail werden die Transformers erklärt, über die anderen Modelle, welche weniger Bedeutung für diese Arbeit beinhalten, wird nur ein Überblick gegeben. @KI-Statista3 @RobotsAI @KI-Statista2:

==== *Generative Adversarial Networks (GANs):* 

Diese bestehen aus einem Generator und einem Diskriminator, die gegeneinander arbeiten, um realistische Daten zu erzeugen.
Der Generator lernt Daten und generiert neue Beispiele, welche zu negativen Beispielen des Diskriminators werden.
Der Diskriminator lernt, zwischen echten und generierten Daten zu unterscheiden. Dabei bestraft der Diskriminator den Generator, wenn dieser schlechte Daten generiert.
Am Anfang sind die generierten Daten schlecht, aber mit der Zeit werden sie immer realistischer. Die Genauigkeit des Diskriminators steigt, bis er nicht mehr zwischen echten und generierten Daten unterscheiden kann @GAN @GoogleGAN.
#figure(
  image("/example/assets/Graph1.png", width: 50%),
  caption: [Generator und Diskriminator Verlust Kurve nach dem Training, Quelle: LernOpenCV],
) <cluster-single-node>

Das komplette System kann als Spiel zwischen zwei Spielern betrachtet werden, wobei der Generator versucht, den Diskriminator zu täuschen und der Diskriminator versucht, den Generator zu entlarven. Dieses Spiel führt zu einer Verbesserung der generierten Daten und kann für verschiedene Anwendungen wie Bildgenerierung, Textgenerierung und mehr verwendet werden. 
Sowohl der Diskriminator als auch der Generator sind neuronale Netze, die miteinander interagieren und sich gegenseitig verbessern. 
#figure(
  image("/example/assets/ganSystem.svg", width: 60%),
  caption: [Systemarchitektur, Quelle: Developers Google],
) <cluster-single-node>

Probleme enstehen, wenn der Diskriminator zu gut ist, dann versagt das System, da der Generator keine Chance hat, aufgrund des verschwindendes Gradients, gute Daten zu generieren.
GANs scheitern an der Konvergenz und sind schwer zu trainieren, da sie instabil sind. Es gibt verschiedene Ansätze, um diese Probleme zu lösen, wie zum Beispiel Wasserstein GANs oder das Hinzufügen von Rauschen um die Stabilität zu verbessern @GoogleGAN.

==== *Variational Autoencoders (VAEs):* 
Diese Modelle lernen, die Daten in einem niedrigdimensionalen Raum zu repräsentieren und aus dieser Darstellung neue Daten zu generieren.
Autoencoder bestehen aus einer neuronalen Netzwerkarchitektur, welche für die Kompression und Rekonstruktion von Daten verwendet wird. Er besteht aus einem Encoder, der die Daten in einen niedrigdimensionalen Raum abbildet, und einem Decoder, der die Daten wieder in den ursprünglichen Raum zurückführt. Der Rekonstruktionsfehler sorgt für eine Übereinstimmung der Ausgabe mit der Eingabe. Das ist die Grundlage für das Verständnis von VAEs @VAEs.

Ein variationaler Autoencoder (VAE) bietet eine Möglichkeit, eine Beobachtung im latenten Raum zu beschreiben. Anstatt also einen Encoder zu bauen, der einen einzelnen Wert ausgibt, um jedes latente Zustandsattribut zu beschreiben, wird der Encoder so umformuliert, damit eine Wahrscheinlichkeitsverteilung für jedes latente Attribut entsteht. Das bedeutet, dass der Encoder eine Wahrscheinlichkeitsverteilung in der Engpassschicht angibt, anstatt nur einen einzelnen Ausgabewert @VAEs.

Der variante Autoencoder unterscheidet sich von einem Autoencoder in der Hinsicht, dass er eine statistische Weise zur Beschreibung der Stichproben des Datensatzes im latenten Raum bietet. Daher gibt der variationale Autoencoder eine Wahrscheinlichkeitsverteilung, in der Engpassschicht, anstelle eines einzelnen Ausgabewerts aus.
#figure(
  image("/example/assets/VAEs.png", width: 60%),
  caption: [Systemarchitektur des VAEs, Quelle: GeeksforGeeks],
) <cluster-single-node>


==== *Recurrent Neural Networks (RNNs):* 

Recurrent Neural Networks (RNNs) unterscheiden sich von anderen neuronalen Netzwerken (NNs) durch ihre Fähigkeit, mit sequentiellen Daten zu arbeiten. Im Gegensatz zu herkömmlichen neuronalen Netzwerken, die typischerweise einen festen Inputwert haben und daraus eine Vorhersage ableiten, können RNNs mehrere Inputwerte in einer Sequenz verarbeiten. 

Herkömmliche neuronale Netzwerke arbeiten in der Regel mit einer festen Anzahl an Eingabewerten, zum Beispiel mit einem einzigen Input oder mit einem 6x6-Pixel-Bild. Das bedeutet, der Input ist immer gleich und hat eine bestimmte, vorgegebene Anzahl an Werten. Wenn man jedoch Vorhersagen treffen möchte, die auf verschiedenen Inputsequenzen basieren, zum Beispiel auf den Werten 9 und 5, kommen RNNs ins Spiel. 

RNNs verfügen, genau wie herkömmliche NNs, über Gewichtungen, Biases, Schichten und Aktivierungsfunktionen. Der wesentliche Unterschied besteht darin, dass RNNs Feedback-Loops besitzen. Diese Feedback-Loops ermöglichen es RNNs, sequentielle Eingaben zu verarbeiten, indem der aktuelle Input zusammen mit dem vorherigen Input berechnet wird, um eine Vorhersage zu treffen. 

Bei der sequenziellen Eingabe wird jeder Input durch die Aktivierungsfunktion berechnet und dann der Output ausgegeben. Hier kommt die Feedback-Loop ins Spiel, die es erlaubt, den vorherigen Input in die Berechnung des aktuellen Inputs einzubeziehen. Dies macht RNNs besonders geeignet für Anwendungen, bei denen der Kontext vorheriger Eingaben entscheidend ist, wie zum Beispiel in der Textverarbeitung oder bei Zeitreihenanalysen.

Um die Flexibilität zu erhöhen, können RNNs durch das Erstellen mehrerer Input-Layer mit verschiedenen Eingaben und einer gleichen Anzahl an Outputs optimiert werden. Dabei wird der Output jeder Schicht an die nächste Schicht weitergegeben, wobei die Gewichtungen und Biases für alle Eingaben gleich bleiben. Egal, wie oft das RNN entfaltet wird, die Gewichtungen und Biases bleiben konstant für alle Daten, die trainiert werden @RNN.

#figure(
  image("/example/assets/Rnn.svg", width: 60%),
  caption: [Architektur des RNNs, Quelle: Analytics Vidhya],
) <cluster-single-node>


*Herausforderungen bei der Nutzung von RNNs*

RNNs werden in der Praxis oft weniger genutzt, weil sie mit zunehmender Entfaltungstiefe schwieriger zu trainieren sind. Ein wesentliches Problem ist das "Vanishing/Exploding Gradient Problem", das bei tiefen RNNs auftreten kann. Dieses Problem tritt auf, wenn die Gewichtungen in den Feedback-Loops entweder zu groß oder zu klein werden. Es gibt zwei Hauptprobleme, die durch das Vanishing/Exploding Gradient Problem entstehen können:

- *Explodierender Gradient:* Wenn RNNs zu oft entfaltet werden und die Gewichtungen größer als 1 sind, können bereits kleine Inputwerte zu extrem großen Zahlen führen. Beispielsweise kann ein Inputwert von 50 bei einer Gewichtung von 2 zu einem Output von $2^50$ führen, was eine zu große Zahl ist.
  
- *Verschwindender Gradient:* Wenn man sich auf Gewichtungen kleiner als 1 beschränkt, verschwindet der Gradient, der für die Berechnung der Backpropagation entscheidend ist. Zum Beispiel würde eine Gewichtung von 0,5 bei 50 Unroll-Schritten zu einem Wert von $0,5^50$ führen, was nahezu null ist und die Schritte somit zu klein macht.

Diese Probleme machen das Training von tiefen RNNs herausfordernd und sind ein Grund, warum sie in der Praxis oft durch andere Architekturen, wie Long Short-Term Memory (LSTM) Netzwerke oder Gated Recurrent Units (GRUs), ersetzt werden, die diese Probleme besser handhaben können @RNN.


==== *Transformers*

Transformers sind neuronale Netzwerke, die in der Lage sind, vielfältige Aufgaben zu bewältigen, wie zum Beispiel das Übersetzen von Texten, das Schreiben von Texten, das Generieren von Computercode oder Anwendungen in der Biologie, wie das Entfalten und Vorhersagen von Proteinen. Bekannte Modelle wie GPT, BERT und GEMINI basieren auf der Transformer-Architektur .

*Was sind Transformers?*

Transformers stellen einen speziellen Typ von neuronaler Netzwerkarchitektur dar. Während für die Verarbeitung von Bildern lange Zeit Convolutional Neural Networks (CNNs) verwendet wurden, und für sequentielle Daten wie Sprache Recurrent Neural Networks (RNNs) zum Einsatz kamen, bringen Transformers wesentliche Vorteile, insbesondere bei der Verarbeitung von Texten.

RNNs, wie bereits beschrieben, können sequenzielle Eingaben verarbeiten, was bedeutet, dass sie die Reihenfolge der Wörter berücksichtigen. Allerdings haben sie Schwierigkeiten, lange Texte zu verarbeiten und Kontext über große Textabschnitte hinweg zu behalten. Zudem ist das Training von RNNs aufgrund ihrer sequentiellen Natur sehr zeitaufwendig. Hier kommen Transformers ins Spiel, da sie parallel arbeiten können und dadurch große Modelle wie GPT-3 mit 45 Terabyte an Textdaten effizient trainiert werden können @AIAYN.

*Wie funktionieren Transformers?*

Transformers beruhen auf drei Hauptinnovationen: Positional Encoding, Attention und Self-Attention.

*Word Embedding*

Zunächst werden Wörter in numerische Werte konvertiert, indem ein einfaches neuronales Netzwerk jedem Wort ein einzigartiges Set von Zahlen zuweist. Diese numerischen Werte, oder Word Embeddings, ermöglichen es dem Modell, Wörter in einer für Maschinen verständlichen Form zu verarbeiten.

*Positional Encoding*

Beim Übersetzen eines Textes beispielsweise wird nicht sequenziell gearbeitet, sondern jedes Wort wird nummeriert und die Position im Satz wird durch eine Positionscodierung berücksichtigt. Dies geschieht mithilfe von sinus- und cosinus-Funktionen, um positionsspezifische Werte für jedes Word Embedding zu generieren.

*Self-Attention*

Eine der Herausforderungen beim Übersetzen von Texten ist, dass Sätze nicht einfach Wort für Wort übersetzt werden können, da verschiedene Sprachen unterschiedliche Satzstrukturen haben. Das Attention-Mechanismus betrachtet daher immer den gesamten Originalsatz und gibt Vorhersagen bzw. Wahrscheinlichkeiten an, welches Wort am ehesten an welcher Stelle im Zieltext stehen sollte. Dieses Verfahren wird durch eine große Menge an Daten unterstützt, aus denen das Modell lernt.
Die wahre Innovation der Transformers liegt in der Self-Attention. Während frühere Modelle nur die Anordnung der Wörter berücksichtigten, ermöglicht Self-Attention dem Modell, ein tieferes Verständnis der Sprache zu entwickeln. Das Modell lernt dabei automatisch Synonyme und sprachliche Regeln, indem es die Beziehungen zwischen den Wörtern im Kontext analysiert. Self-Attention berechnet für jedes Wort sogenannte Queries, Keys und Values, um Attention-Scores zu generieren, die helfen, die Beziehung zwischen den Wörtern zu etablieren. 

*Residual Connections*

Residual Connections helfen beim Training komplexer neuronaler Netzwerke, indem sie sicherstellen, dass die Selbstaufmerksamkeitsschicht sich auf die Beziehungen zwischen den Eingabewörtern konzentrieren kann, ohne die Informationen zur Einbettung der Wörter und der Positionscodierung zu verlieren.

*Multi-head Attention*

Durch das Stapeln mehrerer Self-Attention-Schichten, die „Heads“ genannt werden, fängt der Transformer verschiedene Beziehungen zwischen den Wörtern ein. Das ursprüngliche Transformermodell verwendet acht solcher Heads.

*Encoding und Decoding*

Der Transformer besteht aus einem Encoder, der die Eingangssequenz verarbeitet, und einem Decoder, der die Ausgangssequenz erzeugt. Sowohl der Encoder als auch der Decoder verwenden Word Embedding, Positional Encoding, Self-Attention und Residual Connections. Der Decoder beginnt mit einem End-of-Sequence-Token (EOS) und generiert die Ausgabesequenz Schritt für Schritt.

*Normalization und Scaling*

Um große Vokabeln und lange Eingabe-/Ausgabesequenzen zu verarbeiten, normalisiert der Transformer die Werte nach jedem Schritt und skaliert die Produktwerte während der Aufmerksamkeitsberechnungen. Dies trägt zur Stabilität bei und verbessert die Leistung des Modells.

*Fully Connected Layers*

Nach der Verarbeitung mit Self-Attention und Residual Connections werden die Werte durch vollständig verbundene Schichten und eine Softmax-Funktion geleitet, um die endgültigen Ausgabe-Token zu generieren.

*Warum sind Transformers besser in der Praxis als RNNs?*

Transformers bieten mehrere Vorteile gegenüber RNNs:

- *Parallelisierung:* Im Gegensatz zu RNNs, die sequenziell arbeiten, können Transformers Eingaben parallel verarbeiten. Dies führt zu deutlich schnelleren Trainingszeiten und ermöglicht die Verarbeitung großer Datensätze.
- *Kontextbewusstsein:* Durch Self-Attention können Transformers den Kontext eines Wortes besser verstehen und über längere Textabschnitte hinweg beibehalten, was zu besseren Vorhersagen und Übersetzungen führt.
- *Effizienz:* Die parallele Verarbeitung und die Möglichkeit, große Modelle effizient zu trainieren, machen Transformers zu einer leistungsstarken Architektur für viele Anwendungen, die auf großen Datenmengen beruhen.

Diese Eigenschaften haben Transformers in vielen Bereichen zu einem bevorzugten Modell gemacht, sei es bei der maschinellen Übersetzung, der Textgenerierung oder anderen Anwendungen der natürlichen Sprachverarbeitung.

#figure(
  image("/example/assets/Transformers.svg", width: 40%),
  caption: [Architektur des Transformers, Quelle: Cornell University @AIAYN],
) <cluster-single-node>


== Spracherkennungstechnologien

Spracherkennungstechnologien ermöglichen es Computern, gesprochene Sprache zu erkennen und zu verarbeiten. Diese Technologien nutzen komplexe Algorithmen und maschinelles Lernen, um Sprachmuster zu analysieren und in Text umzuwandeln. Anwendungen finden sich in virtuellen Assistenten, Transkriptionsdiensten und interaktiven Sprachanwendungen. Fortschritte in der Spracherkennung haben die Genauigkeit und Benutzerfreundlichkeit dieser Systeme erheblich verbessert.

== Datenmanagement

Datenmanagement bezieht sich auf die Prozesse und Systeme, die verwendet werden, um Daten zu sammeln, zu speichern, zu organisieren und zu pflegen. Effektives Datenmanagement ist entscheidend für die Gewährleistung der Datenqualität, -sicherheit und -zugänglichkeit. In der Entwicklung von KI-Systemen spielen Daten eine zentrale Rolle, da sie die Grundlage für das Training und die Verbesserung von Modellen bilden. Ein robustes Datenmanagementsystem ermöglicht es, große Datenmengen effizient zu handhaben und die Integrität und Vertraulichkeit der Daten zu schützen.

== Marktanalyse

Die Marktanalyse umfasst die Untersuchung von Marktbedingungen, Wettbewerbslandschaften und Verbraucherverhalten, um fundierte Geschäftsentscheidungen zu treffen. Im Kontext von KI- und VR-Technologien hilft eine Marktanalyse, die Potenziale und Herausforderungen dieser Technologien zu verstehen. Sie liefert Einblicke in aktuelle Trends, Wachstumschancen und mögliche Marktbarrieren. Für die Entwicklung eines KI-basierten Chat-Avatars, der in verschiedenen Branchen eingesetzt werden kann, ist eine gründliche Marktanalyse unerlässlich, um die Bedürfnisse der Zielgruppe zu identifizieren und die Markteinführungsstrategie zu planen. 

Diese Grundlagen bilden das Fundament für die Entwicklung eines interaktiven, KI-gestützten 3D-Avatars, der in der Lage ist, Nutzern kontextbezogene Unterstützung und Beratung zu bieten.

== Anforderungen an den 3D-Avatar
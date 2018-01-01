﻿-- THIS CONTENTS OF THIS FILE IS AUTO-GENERATED BY THE WOWACE PACKAGER
-- Please use the Localization App on WoWAce to update this
-- at http://www.wowace.com/projects/omen-threat-meter/localization/

--  Translation courtesy of Ben (Aesyl - US Tanaris)
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("Omen", "esES") or AceLocale:NewLocale("Omen", "esMX")
if not L then return end

L["A collection of help pages"] = "Una colección de páginas de ayuda"
L["Alpha"] = "Transparencia"
L["Always Show Self"] = "Siempre verse uno mismo"
L["Always show your threat bar on Omen (ignores class filter settings), showing your bar on the last row if necessary"] = "Siempre ver tu barra de amenaza en Omen (ignora las opciones de filtrado de clase), enseña tu barra en la última fila si es necesario"
L["Animate Bars"] = "Animar las Barras"
L["Attach to minimap"] = "Adjuntar a la minimapa"
L["Autocollapse"] = "Compactarse Automáticamente" -- Needs review
L["Autocollapse Options"] = "Opciones de Compacto Automático" -- Needs review
L["AUTO_SHOW/HIDE_NOTE"] = "Nota: Si usted muestra/oculta Omen manualmente, éste permanecerá oculto o mostrándose, independientemente de los ajustes de Auto-Mostrar/Ocultar hasta que llegues a la próxima zona, te unas o abandones un grupo o banda, o cambies cualquier ajuste de Auto-Mostrar/Ocultar."
L["Background Color"] = "Color del Fondo"
L["Background Options"] = "Opciones del Fondo"
L["Background Texture"] = "Textura del Fondo"
L["Background Tile Size"] = "Tamaño del mosaico de fondo"
L["Bar BG Color"] = "Color de Fondo de Barra"
L["Bar Height"] = "Altura de la Barra"
L["Bar Inset"] = "Recuadro de la Barra"
L["Bar Label Options"] = "Opciones de Etiqueta de Barra"
L["Bar Settings"] = "Opciones de las Barras"
L["Bar Spacing"] = "Espacio entre Barras" -- Needs review
L["Bar Texture"] = "Textura de la Barra"
L["Border Color"] = "Color del Borde"
L["Border Texture"] = "Textura del Marco"
L["Border Thickness"] = "Ancho del Borde"
L["Causes Omen to play a chosen sound effect"] = "Hacer que Omen reproduzca un efecto de sonido escogido"
L["Causes the entire game world to shake momentarily. This option only works if nameplates are turned off."] = "Hace que toda la pantalla del juego tiemble brevemente. Esta opción sólo funciona si las placas de nombre son desactivadas."
L["Causes the entire screen to flash red momentarily"] = "Hace que la pantalla entera destelle de rojo brevemente"
L["Center"] = "Centro"
L["Center Omen"] = "Centrar Omen"
L["|cffff0000Error:|r Omen cannot use shake warning if you have turned on nameplates at least once since logging in."] = "|cffff0000Error:|r Omen no puede usar el aviso de temblor si usted ha activado las placas de nombre al menos una vez desde que ha entrado."
L["Clamp To Screen"] = "Anclar a la pantalla"
L["Click|r to toggle the Omen window"] = "Pulse click para mostrar/ocultar la ventana de Omen" -- Needs review
L["Collapse to show a minimum number of bars"] = "Compactarse para mostrar un número mínimo de barras." -- Needs review
L["Configure"] = "Configurar"
L["Configure bar settings."] = "Configura las Opciones de las Barras"
L["Configure title bar settings."] = "Configurar opciones de la Barra de Título"
L["Controls the frame strata of the main Omen window. Default: MEDIUM"] = "Controla la capa donde se sitúa la ventana principal de Omen. Capa por defecto: Media"
L["Controls the scaling of the main Omen window."] = "Controla la escala de la ventana principal de Omen."
L["Controls the transparency of the main Omen window."] = "Controla la transparencia de la ventana principal de Omen."
L["Controls whether the main Omen window can be dragged offscreen"] = "Controla si la ventana principal de Omen puede ser movida fuera de la pantalla"
L["Control the font size of the labels"] = "Controla el tamaño de la fuente de las etiquetas"
L["Control the font size of the title text"] = "Controla el tamaño de la fuente del texto del título"
L["DEATHKNIGHT"] = "Caballero de la Muerte"
L["Disable while tanking"] = "Desactivar cuándo eres el tanque"
L["DISABLE_WHILE_TANKING_DESC"] = "No dar ninguna alerta si Actitud defensiva, Forma de oso, Furia recta o Presencia de Helada está activado."
L["Display large numbers in Ks"] = "Mostrar números grandes en Ks"
L["DRUID"] = "Druida"
L["Enable Screen Flash"] = "Activar Destello de Pantalla"
L["Enable Screen Shake"] = "Activar Temblor de Pantalla"
L["Enable Sound"] = "Activar Sonido"
L["Enable Warning Message"] = "Activar Mensaje de Aviso"
L["Fade/MI Bar Color"] = "Color de la barra de Sigilo/Reflejo exacto"
L["FAQ Part 1"] = "FAQ Parte 1"
L["FAQ Part 2"] = "FAQ Parte 2"
L["Font"] = "Fuente"
L["Font Color"] = "Color de Fuente"
L["Font Outline"] = "Borde de Fuente" -- Needs review
L["Font Size"] = "Tamaño de Fuente"
L["Frame's background color"] = "Color de Fondo del Marco"
L["Frame's border color"] = "Color del Borde del Marco"
L["Frame Strata"] = "Capa del Marco"
L["Frequently Asked Questions"] = "Preguntas Frecuentes (FAQ)"
L["FuBar Options"] = "Opciones de FuBar"
L["GENERAL_FAQ"] = [=[|cffffd200¿Qué diferencias hay entre Omen3 y Omen2?|r

Omen3 cuenta completamente con el API de amenaza de Blizzard y eventos de amenaza. No trata a calcular o extrapolar la amenaza a diferencia de Omen2.

Omen2 era lo que llamábamos la biblioteca Threat-2.0. Esta biblioteca era responsable de observar el diario de combate, hechizos, ventajas, desventajas, actitudes, talentos y modificadores de equipo para calcular la amenaza de cada individual. La amenaza se calculaba basado en lo que estaba sabido o aproximado de conductas observadas. Muchas informaciones, como golpes en la espalda se basaban en suposiciones.

La biblioteca Threat-2.0 también incluía communicación para transmtir su amenaza al resto de la banda mientras que usaban Threat-2.0 también. Esta información estaba usado para dar una muestra de información de amenaza incluyendo la banda entera.

Desde el parche 3.0.2, Omen ya no hace estas cosas y una biblioteca de amenaza ya no es necesario. Omen3 usa el monitor de amenaza de Blizzard para obtener los valores exactos de la amenaza de cada miembro. Esto significa que Omen3 no necesita sincronización de datos, analizar el diario de combate o adivinar. Esto resulta un aumento significativo en rendimiento con respecto al tráfico de red, uso de la CPU y de la memoria. La implementación de módulos por jefes específicos ya no es necesario.

Además esta implementación nueva permite la adición de la amenaza de NPCs. Sin embargo, hay desventajas; las actualizaciones son menos frecuentes, los detalles de amenaza no pueden estar obtenido a menos que alguien en su banda estén apuntando al mob y no es posible obtener amenaza de un mob con el que usted no está en combate.

|cffffd200¿Cómo me deshago de las 2 líneas verticales de color gris de la mitad?|r

Bloquea tu Omen. Bloquear Omen lo previene de ser movido o reescalado, como también previene que el tamaño de las columnas sea cambiado. Si no realizas esto, las 2 líneas grises verticales seguirán ahí para poder cambiar las columnas manualmente.

|cffffd200¿Cómo hago que Omen3 se parezca a Omen2?|r

Cambia la Textura de Fondo y Textura de Borde a "Blizzard Tooltip", cambie el Color de Fondo a negro (arrastra hacia abajo la barra de luminosidad), y el Color de Borde a azul.

|cffffd200¿Por qué no me muestra la amenaza en un enemigo cuándo lo apunto, aún cuando él está en combate?|r

El API de amenaza de Blizzard no devuelve datos de amenaza de un enemigo con el que no estás en combate directamente, porque no estarás en su lista de amenaza. Creemos que esto es un esfuerzo para reducir tráfico de red.

|cffffd200Is there ANY way around this Blizzard limitation? Not being able to see my pet's threat before I attack has set me back to guessing.|r

There is no way around this limitation short of us doing the guessing for you (which is exactly how Omen2 did it).

The goal of Omen3 is to provide accurate threat data, we no longer intend to guess for you and in the process lower your FPS. Have some confidence in your pet/tank, or just wait 2 seconds before attacking and use a low damage spell such as Ice Lance so that you can get initial threat readings.

|cffffd200¿Qué es la amenaza, aggro y APS?|r

La amenaza, o puntos de amenaza, es un valor que un personaje puede tener sobre un enemigo NPC/mob (personaje no controlable, es decir, no es un jugador). Este valor aumenta normalmente 1 punto de amenaza por cada 1 punto de daño sobre el enemigo ó 2 puntos de cura sobre un jugador (los buffs y debuffs, mejoras y enfermedades en el tiempo, también aumentan la amenaza). Los valores pueden aumentar o disminuir dependiendo de la habilidad usada. Los APS son sencillamente los puntos de amenaza generados por segundo (parecido a DPS, daño por segundo).

El aggro es el hecho de tener a un enemigo atacándote. Para cambiar el aggro desde un jugador a otro, el otro jugador debe conseguir un 30% más de amenaza del jugador que tiene el aggro actualmente (esto hace que sea relativamente fácil mantener el aggro, pero una vez perdido sea muy difícil recuperarlo).]=] -- Needs review
L["GENERAL_FAQ2"] = [=[|cffffd200¿Podemos obtener de nuevo el modo de AOE? 

De nuevo, esto no es realmente posible sin la amenaza de adivinanzas valores. La amenaza de la API de Blizzard sólo nos permite una consulta de datos sobre las unidades de la amenaza de que alguien en el ataque se dirige. Esto significa que si hay 20 bandas y sólo 6 de ellos son el blanco de la redada, no hay manera de obtener datos exactos sobre la amenaza de otros 14. 

Esto también es extremadamente complicado de adivinar sobre todo para la curación y el desbarbado (amenaza se divide por el número de bandas que están en combate con), ya que las multitudes que se encuentran bajo efectos de control de masas (oveja, desterrar, savia, etc) no tienen su amenaza de mesa modificados addons y fiable no puede decir cuántas bandas se encuentra en combate con. Omen2 de adivinar casi siempre se equivocan. 

|cffffd200Herramientas en la unidad mouseover muestra una amenaza% que no coincide con la amenaza% reportado por Omen3. ¿Por qué? 

Blizzard es la amenaza porcentaje a escala entre el 0% y 100%, para que siempre tire agresividad en un 100%. Presagio informes valores de la materia prima sin escala que ha tirando agresividad en porcentajes del 110% mientras que en cuerpo a cuerpo y rango de 130% lo contrario. 

Por acuerdo universal, el objetivo principal de un grupo que se llama el depósito y se define como la amenaza al 100%. 

|cffffd200¿Tiene Omen3 sincronización o analizar la lucha contra el registro? 

No. Omen3 no trata de analizar la sincronización o la lucha registro. Actualmente no hay intenciones de hacerlo. 

|cffffd200Las actualizaciones de Omen son lentas ... 

Omen3 actualizaciones de los valores de la amenaza que aparezca tan a menudo como Blizzard actualiza los valores que nos amenaza. 

De hecho, Blizzard actualiza aproximadamente una vez por segundo, que es mucho más rápido que lo Omen2 usar para sincronizar las actualizaciones. En Omen2, sólo transmitió su amenaza para el resto de la redada una vez cada 3 segundos (o si se 1.5s un tanque). 

|cffffd200¿Dónde puedo reportar errores o hacer sugerencias? 

http://forums.wowace.com/showthread.php?t=14249 

|cffffd200¿Quién diseñó Omen3? 

El diseñador principal de Omen es Xinhuan (Reino Blackrock de EE.UU., Alianza). 

¿Aceptan donaciones de Paypal? 

Sí, por favor, enviadlas a "xinhuan @ gmail 'PUNTO' com".]=]
L["General Settings"] = "Opciones Generales"
L["Grow bars upwards"] = "Barras crecen hacia arriba"
L["Heading background color"] = "Color de Fondo de las Categorías"
L["Heading BG Color"] = "Color de Fondo de las Categorías"
L["Height of each bar"] = "Altura de cada barra"
L["Height of the title bar. The minimum height allowed is twice the background border thickness."] = "Altura de la Barra de Título. La altura mínima permitida es el doble del grosor del borde del fondo."
L["Help File"] = "Archivo de ayuda"
L["Hide minimap/FuBar icon"] = "Ocultar el icono del minimapa/FuBar"
L["Hide Omen"] = "Ocultar Omen"
L["Hide Omen entirely if it collapses to show 0 bars"] = "Ocultar Omen completamente si se desploma para mostrar 0 barras"
L["Hide Omen on 0 bars"] = "Ocultar Omen cuándo hay 0 barras"
L["However, hide Omen if any of the following are true (higher priority than the above)."] = "Sin embargo, ocultar Omen si alguna de las siguientes son verdaderas (prioridad más alta que lo anterior)."
L["HUNTER"] = "Cazador"
L["Ignore Player Pets"] = "Ignorar tu Mascota"
L["IGNORE_PLAYER_PETS_DESC"] = [=[Tells Omen to skip enemy player pets when determining which unit to display threat data on.

Player pets maintain a threat table when in |cffffff78Aggressive|r or |cffffff78Defensive|r mode and behave just like normal mobs, attacking the target with the highest threat. If the pet is instructed to attack a specific target, the pet still maintains the threat table, but sticks on the assigned target which by definition has 100% threat. Player pets can be taunted to force them to attack you.

However, player pets on |cffffff78Passive|r mode do not have a threat table, and taunt does not work on them. They only attack their assigned target when instructed and do so without any threat table.

When a player pet is instructed to |cffffff78Follow|r, the pet's threat table is wiped immediately and stops attacking, although it may immediately reacquire a target based on its Aggressive/Defensive mode.
]=]
L["Invert Bar/Text Colors"] = "Invertir Barras/Colores de texto"
L["Left"] = "Izquierda"
L["Lock Omen"] = "Bloquear Omen"
L["Locks Omen in place and prevents it from being dragged or resized."] = "Bloquea Omen en el sitio y lo evita que arrastrar o cambiar la talla."
L["MAGE"] = "Mago"
L["Max bars to show"] = "Máx. barras para mostrar"
L["Max number of bars to show"] = "Nº Máx. de barras mostradas"
L["'My Bar' BG Color"] = "Color de fondo de tu barra"
L["Name"] = "Nombre"
L["None"] = "Nada"
L["*Not in Party*"] = "*No Está en el Grupo*"
L["OMEN_DESC"] = "Omen es un medidor ligero de amenaza que le muestra la amenaza del enemigo con el que usted está en combate. Puede configurar cómo Omen se aparece y funciona, y configurar perfiles diferentes por cada personaje."
L["Omen Quick Menu"] = "Menu Rápido de Omen"
L["OMEN_SLASH_DESC"] = "Estos botones ejecutan las mismas funciones que las del comando de chat /omen"
L["OMEN_WARNINGS_DESC"] = "Esta sección le permite configurar cuándo y cómo Omen le notifica si su amenaza es demasiada alta o si recibes el aggro."
L["Open Config"] = "Abrir Configuración"
L["Open Omen's configuration panel"] = "Abrir el panel de configuración de Omen"
L["Open the configuration dialog"] = "Abrir el diálogo de configuración"
L["Outline"] = "Borde"
L["PALADIN"] = "Paladín"
L["Passed %s%% of %s's threat!"] = "¡Has pasado un %s%% del %s de amenaza!"
L["PET"] = "Mascota"
L["Pet Bar Color"] = "Color de la barra de mascotas"
L["Position"] = "Posición"
L["PRIEST"] = "Sacerdote"
L["Print a message to screen when you accumulate too much threat"] = "Mostrar una mensaje en pantalla cuándo acumulas demasiada amenaza"
L["Profiles"] = "Perfiles"
L["> Pull Aggro <"] = ">> Amenaza para Aggro <<"
L["Pull Aggro Bar Color"] = "Color de la barra de Amenaza para Aggro"
L["Right"] = "Derecho"
L["Right-click|r to open the options menu"] = "Haga clic con el botón derecho|r para abrir el menú de opciones"
L["ROGUE"] = "Pícaro"
L["Scale"] = "Escala"
L["Sets how far inside the frame the threat bars will display from the 4 borders of the frame"] = "Controla a qué distancia dentro del marco las barras de amenaza mostrarán los 4 bordes del marco" -- Needs review
L["SHAMAN"] = "Chamán"
L["Short Numbers"] = "Números Cortos"
L["Show a bar for the amount of threat you will need to reach in order to pull aggro."] = "Mostrar una barra que indica la amenaza que necesitas para conseguir el aggro y te ataquen (Amenaza para Aggro)"
L["Show bars for these classes"] = "Mostrar barras para estas clases"
L["Show Classes..."] = "Mostrar Clases..."
L["SHOW_CLASSES_DESC"] = "Mostrar barras de amenaza de Omen de las clases siguientes. Las clases aquí se refieren solamente a las personas quien están en su grupo/banda a excepción de la opción 'No Está en el Grupo'."
L["Show column headings"] = "Mostrar las categorías sobre las columnas"
L["Show Headings"] = "Mostrar Categorías"
L["Show icon"] = "Mostrar Icono"
L["Show minimap button"] = "Mostrar Icono del Minimapa"
L["Show Omen"] = "Mostrar Omen"
L["Show Omen when..."] = "Mostrar Omen cuándo..."
L["Show Omen when any of the following are true"] = "Mostrar Omen cuándo cualquiera de lo siguiente es cierto"
L["Show Omen when you are alone"] = "Mostrar Omen cuándo usted está solo(a)"
L["Show Omen when you are in a 5-man party"] = "Mostrar Omen cuándo usted está en un grupo de 5 miembros"
L["Show Omen when you are in a raid"] = "Mostrar Omen cuándo usted está en una banda"
L["Show Omen when you have a pet out"] = "Mostrar Omen cuándo tienes una mascota fuera"
L["Show Pull Aggro Bar"] = "Mostrar Barra de Amenaza para Aggro"
L["Show text"] = "Mostrar Texto"
L["Show the Omen minimap button"] = "Mostrar el icono de Omen en el minimapa"
L["Show the Omen Title Bar"] = "Mostrar la barra de título de Omen"
L["Show Threat %"] = "Mostrar el Porcentaje de Amenaza"
L["Show threat per second values"] = "Mostrar la amenaza por segundo (APS)"
L["Show Threat Values"] = "Mostrar Valores de Amenaza"
L["Show Title Bar"] = "Mostrar la Barra de Título"
L["Show TPS"] = "Mostrar APS (Amenaza por Segundo)"
L["Show When..."] = "Mostrar cuándo..."
L["Slash Command"] = "Comando de Barra"
L["Smoothly animate bar changes"] = "Animar Suavamente las Barras"
L["Sound to play"] = "Sonido para reproducir"
L["Spacing between each bar"] = "Espacio entre cada barra"
L["Switch the colors so that the bar background colors and the text colors are swapped."] = "Cambiar los colores de modo que el color de fondo de las barras y el texto estén invertidas." -- Needs review
L["Tank Bar Color"] = "Color de la Barra del Tanque"
L["Tells Omen to additionally check your 'focus' and 'focustarget' before your 'target' and 'targettarget' in that order for threat display."] = "Omen revisa tu 'foco' y 'objetivo de foco' antes de que tu 'objetivo' y 'objetivo de objetivo\" en ese orden en la ventana de amenaza." -- Needs review
L["Tells Omen to enter Test Mode so that you can configure Omen's display much more easily."] = "Omen entra en el Modo para Prueba para que puedas configurar la ventana de de Omen más fácilmente."
L["Test Mode"] = "Modo para Prueba"
L["Test warnings"] = "Avisos de Prueba"
L["Texture to use for the frame's background"] = "Textura usada en el fondo del marco"
L["Texture to use for the frame's border"] = "Textura usada en el borde del marco"
L["The background color for all threat bars"] = "El color de fondo para todas las barras de amenaza"
L["The background color for pets"] = "El color de fondo para las barras de mascotas"
L["The background color for players under the effects of Fade and Mirror Image (they will be at negative 4 million threat)"] = "El color de fondo para jugadores bajo los efectos de Sigilo y Reflejo exacto (que será negativo en 4 millones de amenaza)"
L["The background color for your Pull Aggro bar"] = "El color de fondo para tu barra de Amenaza para Aggro"
L["The background color for your tank's threat bar"] = "El color de fondo de la barra de amenaza del tanque"
L["The background color for your threat bar"] = "El color de fondo de tu barra de amenaza"
L["The color of the labels"] = "El color de las etiquetas"
L["The color of the title text"] = "El color del texto del título"
L["The font that the labels will use"] = "La fuente que las etiquetas usarán"
L["The font that the title text will use"] = "La fuente que el título usará"
L["The outline that the labels will use"] = "El borde que las etiquetas usarán"
L["The outline that the title text will use"] = "El borde que el texto del título usará"
L["The size used to tile the background texture"] = "El tamaño usado la textura del mosaico del fondo"
L["The texture that the bar will use"] = "La Textura que la barra usará"
L["The thickness of the border"] = "El ancho del borde"
L["Thick Outline"] = "Borde ancho"
L["This section controls when Omen is automatically shown or hidden."] = "Esta sección controla cuando Omen se muestra u oculta automáticamente"
L["Threat"] = "Amenaza"
L["Threat [%]"] = "Amenaza [%]"
L["Tile Background"] = "Poner en mosaico el Fondo" -- Needs review
L["Tile the background texture"] = "Poner en mosaico la textura de fondo" -- Needs review
L["Title Bar Background Options"] = "Opciones del Fondo de la Barra de Título"
L["Title Bar Height"] = "Altura de la Barra de Título"
L["Title Bar Settings"] = "Opciones de la Barra de Título"
L["Title Text Options"] = "Opciones del Texto del Título"
L["Toggle Focus"] = "Mostrar/Ocultar Focus"
L["Toggle Omen"] = "Mostrar/Ocultar Omen"
L["TPS"] = "APS"
L["TPS Window"] = "Ventana de APS"
L["TPS_WINDOW_DESC"] = "El cálculo de amenaza por segundo se basa en una ventana deslizante en tiempo real de los X segundos pasados." -- Needs review
L["Turning this on will cause Omen to hide whenever you are in a battleground or arena."] = "Activar esto hace que Omen se oculte mientras estás en un campo de batalla o arena."
L["Turning this on will cause Omen to hide whenever you are in a city or inn."] = "Activar esto hace que Omen se oculte cuando estés en una ciudad o posada."
L["Turning this on will cause Omen to hide whenever you are not in combat."] = "Activar esto hace que Omen se oculte cuando usted no está en combate."
L["<Unknown>"] = "<Desconocido>"
L["Use a different colored background for the tank's threat bar in Omen"] = "Usar un coloreado de fondo diferente para la barra de amenaza del tanque en Omen"
L["Use a different colored background for your threat bar in Omen"] = "Usar un coloreado de fondo diferente para tu barra de amenaza en Omen"
L["Use Auto Show/Hide"] = "Usar Auto-Mostrar/Ocultar"
L["Use !ClassColors"] = "Usar !ClassColors" -- Needs review
L["Use Class Colors"] = "Usar Colores de Clase"
L["Use !ClassColors addon for class colors for the background color of threat bars"] = "Usar el addon !ClassColors para los colores de fondo de las barras de amenaza" -- Needs review
L["Use Focus Target"] = "Usar Objetivo de Foco"
L["Use 'My Bar' color"] = "Usar un color especial en tu barra"
L["Use Same Background"] = "Usar el mismo fondo"
L["Use standard class colors for the background color of threat bars"] = "Usar los colores de clase estándar para el color de fondo de las barras de amenaza"
L["Use Tank Bar color"] = "Usar el color de Barra del Tanque"
L["Use the same background settings for the title bar as the main window's background"] = "Usar las mismas opciones de fondo de la ventana principal en la barra de título"
L["WARLOCK"] = "Brujo"
L["Warning Settings"] = "Opciones de Aviso"
L["Warning Threshold %"] = "Umbral de Aviso %"
L["Warrior"] = "Guerrerro"
L["WARRIOR"] = "Guerrerro"
L["WARRIOR_FAQ"] = [=[Lo siguiente información está obtenido de |cffffd200http://www.tankspot.com/forums/f200/39775-wow-3-0-threat-values.html|r Oct 2nd 2008 (crédito a Satrina). Los números son por un carácter de nivel 80.

|cffffd200Modificadores|r
Actitud de batalla ________ x 80
Actitud rabiosa _____ x 80
Maestría táctica _____ x 121/142/163
Actitud defensiva _____ x 207.35

Nota que en nuestros estimaciones originales (que usamos ahora en WoW 2.0), comparábamos 1 daño a 1 amenaza, y usábamos 1.495 para representar el modificador de actitud+desafío multiplicador. Ahora vemos que el método de Blizzard es para usar el multiplicador sin decimales, así en 2.x habría estado x149 (quizás x149.5); es x207 (quizás 207.3) en 3.0. Supongo que esto es para permitir el transporte de números enteros en vez de decimales a través del internet por rendimiento. Se parece que los valores de amenaza son multiplicados por 207.35 al servidor, pues redondeado.

Si quiere usar el 1 daño = 1 amenaza método todavía; los modificadores de actitud son 0.8 y 2.0735, etc..

|cffffd200Valores de Amenaza (modificadores de actitud aplica a menos que dijera otra cosa):|r
Grito de batalla _________ 78 (divido)
Rajar _______________ daño + 225 (divido)
Grito de orden _____ 80 (divido)
Arremetida de conmoción ______ daño solamente
Escudo de daño ________ daño solamente
Grito desmoralizador ___ 63 (divido)
Devastar ____________ daño + 5% of AP
Esquivar/Parar/Bloquear_____ 1 (en actitud defensiva solamente con Actitud defensiva mejorada)
Golpe heroico ________ daño + 259
Tira heroico _________ 1.50 x daño
Gana de ira ____________ 5 (sin modificador de actitud)
Desgarrar _________________ daño solamente
Revancha ______________ daño + 121
Azote de escudo __________ 36
Embate con escudo __________ daño + 770
Onda de choque ____________ daño solamente
Embate _________________ daño + 140
Reflejo de hechizos ________ daño solamente
Aggro Social _________ 0
Hender armadura ________ 345 + 5%AP
Atronar _________ 1.85 x daño
Vigilancia ____________ 10% de la amenaza del blanco (sin modificador de actitud)

No gana amenaza por reflejar hechizos apuntado a su aliados con Reflejo de hechizos mejorado. Cuándo refleja un hechizo por un aliado, el aliado gana la amenaza por el daño del hechizo.
]=]
L["You are alone"] = "Estás solo(a)"
L["You are in a battleground"] = "Estás en un campo de batalla"
L["You are in a party"] = "Estás en un grupo"
L["You are in a raid"] = "Estás en una banda"
L["You are not in combat"] = "No estás en combate"
L["You are resting"] = "Estás en una ciudad o posada"
L["You have a pet"] = "Tienes una mascota"


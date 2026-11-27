# Memoria persistente entre sesiones

> **Última actualización:** 2026-11-27
> Lectura obligatoria para modelos (ver `AGENTS.md`). Recoge hechos verificados y
> decisiones que no conviene repetir ni reabrir sin datos nuevos.

## Propósito general

- Este archivo de memoria pone en contexto al usuario cuando se encuentra perdido dentro del repositorio, cuando no recuerda su funcionamiento o cuando no sabe cómo funciona algo exactamente. Es útil tanto para los modelos de IA como para el propietario del repositorio.
- Se usa para guardar el estado del proyecto, **tareas pendientes**, **tareas completadas** y **próximos pasos**.
- Nota el archivo (`CHANGELOG.md`) si tiene una sesión de tareas pendientes, pero es más relevante para los usuarios que revisan el repositorio en línea.

## Estado actual

- `AGENTS.md` y `MEMORY.md` fueron revisados repetidamente después de las ediciones del usuario. Se corrigieron faltas ortográficas, acentos, puntuación, formato, espacios finales y algunos problemas menores de gramática.
- Se corrigieron cinco fallos reales en una sola sesión: typos de Polybar (`module-margin-letf`, `label-emply-background`), `HISTDUP` en `.zshrc`, detección de `bat`/`batcat` en `target.sh`, `[Install]` de `polybar-update.service` y el separador de lualine. Detalle en los commits `ab4644c`, `45177cc`, `2cf2bfa`, `cc119c4` y `a61b072`.

## Decisiones (y por qué)

- Se conservaron sin cambios los nombres propios, rutas, nombres de paquetes y URLs para no romper las referencias del repositorio.
- No se modificaron `CHANGELOG.md` ni `README.md`, ya que sus cambios requieren la aprobación previa del usuario.

## Aprendizaje y errores a evitar

- Al revisar texto editado por el usuario, hay que comprobar especialmente palabras como `línea`, `vacío`, `por qué`, `tokens`, `software`, `específico`, `repositorio` y `pronto`, además de eliminar espacios finales.
- Nunca redirigir la salida dentro de una sustitución de comandos: `CMD=$(command -v bat &>/dev/null)` deja la variable vacía. Usar `CMD=$(command -v bat || command -v batcat)`.
- En Polybar, un typo en el nombre de una opción no genera error, simplemente se ignora; conviene buscar `letf`/`emply` y variantes al revisar los `.ini`.

## Próximos pasos

- Implementar `home/.config/bspwm/src/ArchUpdates.sh` (está vacío y sin permiso de ejecución) junto con `ArchUpdates.service` y `ArchUpdates.timer`, que también están vacíos.
- Pendiente proponer al usuario la entrada de `CHANGELOG.md` para estos fixes.

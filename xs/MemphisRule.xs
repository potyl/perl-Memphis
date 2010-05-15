/* Memphis.
 *
 * Perl bindings for libmemphis; a generic glib/cairo based OSM renderer
 * library. It draws maps on arbitrary cairo surfaces.
 *
 * Perl bindings by Emmanuel Rodriguez <emmanuel.rodriguez@gmail.com>
 *
 * Copyright (C) 2010 Emmanuel Rodriguez
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */


#include "memphis-perl.h"


MODULE = Memphis::Rule  PACKAGE = Memphis::Rule  PREFIX = memphis_rule_


MemphisRule*
memphis_rule_new (class)
	C_ARGS: /* No args */


MemphisRule*
memphis_rule_copy (const MemphisRule *rule)


void
memphis_rule_free (MemphisRule *rule)


#
# Provide nice accessors and modifiers to the data members of the struct.
#
void
keys (MemphisRule *rule, ...)
	ALIAS:
		values = 1

	PREINIT:
		gchar **list = NULL;
		gchar **iter = NULL;

	PPCODE:
		switch (ix) {
			case 0:
				list = rule->keys;
			break;

			case 1:
				list = rule->values;
			break;
		}

		if (items > 1) {
			size_t i;
			if (list != NULL) {
				for (iter = list; *iter != NULL; ++iter) {
					g_free(*iter);
				}
				g_free(list);
			}

			list = g_new(char *, items);
			list[items - 1] = NULL;
			for (i = 0; i < items - 1; ++i) {
				list[i] = g_strdup(SvGChar(ST(i + 1)));
			}
		}

		if (list != NULL) {
			for (iter = list; *iter != NULL; ++iter) {
				XPUSHs(sv_2mortal(newSVGChar(*iter)));
			}
		}

		switch (ix) {
			case 0:
				rule->keys = list;
			break;

			case 1:
				rule->values = list;
			break;
		}


#
# Provide nice accessors and modifiers to the data members of the struct.
#
SV*
type (MemphisRule *rule, ...)
	ALIAS:
		polygon = 1
		line    = 2
		border  = 3
		text    = 4

	PREINIT:

	CODE:
		switch (ix) {
			case 0:
				RETVAL = newSVMemphisRuleType(rule->type);
				if (items > 1) rule->type = SvMemphisRuleType(ST(1));
			break;

			default:
				RETVAL = &PL_sv_undef;
				g_assert_not_reached();
			break;
		}

	OUTPUT:
		RETVAL

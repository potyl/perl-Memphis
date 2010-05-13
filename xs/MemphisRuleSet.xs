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


MODULE = Memphis::RuleSet  PACKAGE = Memphis::RuleSet  PREFIX = memphis_rule_set_


MemphisRuleSet*
memphis_rule_set_new (class)
	C_ARGS: /* No args */


void
memphis_rule_set_free (MemphisRuleSet *rules)


void
memphis_rule_set_load_from_file (MemphisRuleSet *rules,
    const gchar *filename,
    GError **error);


void
memphis_rule_set_load_from_data (MemphisRuleSet *rules,
    const gchar *data,
    guint size,
    GError **error);


void
memphis_rule_set_set_bg_color (MemphisRuleSet *rules, guint8 r, guint8 g, guint8 b, guint8 a)


void
memphis_rule_set_get_bg_color (MemphisRuleSet *rules, guint8 *r, guint8 *g, guint8 *b, guint8 *a)


GList*
memphis_rule_set_get_rule_ids (MemphisRuleSet *rules)


void
memphis_rule_set_set_rule (MemphisRuleSet *rules, MemphisRule *rule)


MemphisRule*
memphis_rule_set_get_rule (MemphisRuleSet *rules, const gchar *id)


gboolean
memphis_rule_set_remove_rule (MemphisRuleSet *rules, const gchar *id)


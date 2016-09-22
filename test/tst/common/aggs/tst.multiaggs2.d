/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License (the "License").
 * You may not use this file except in compliance with the License.
 *
 * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */

/*
 * Copyright 2006 Sun Microsystems, Inc.  All rights reserved.
 * Use is subject to license terms.
 */

#pragma	ident	"@(#)tst.multiaggs2.d	1.1	06/08/28 SMI"

/*
 * ASSERTION:
 *   Test multiple aggregations and the default output order
 *
 * SECTION: Aggregations/Aggregations;
 *	Aggregations/Output
 *
 */

#pragma D option quiet
#pragma D option statusrate=120ms

BEGIN
{
	i = 0;
}

tick-10ms
/i < 1000/
{
	@a = avg(i);
	@b = sum(i);
	@c = min(i);
	@d = max(i);
	@e = quantize(i);
	@f = lquantize(i, 0, 1000, 100);

	i += 100;
}

tick-10ms
/i == 1000/
{
	exit(0);
}

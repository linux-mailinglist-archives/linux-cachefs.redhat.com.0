Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F0754457B
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Jun 2022 10:16:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654762572;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KRZsS8qyEpqo1Pv2ov4N1LuujHSak53YJ6hbFHDZgKg=;
	b=D12g25pZcZUmFKzyl5EGwlI67sxiJ4gzbmUTb3TNThsZKlIG6t5ak/4PG7qy5ilmLA3tPT
	goV7VAUNTMVYkIFlI0B8NkjFf4wYnKhqbPPFJwUPuib025m6l0u6ZQbBIT3FlUwDNejtl/
	IBCk2z4MaI8xVi831VUQ3GnwetPPCHg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-FILri9poM6iKZTn2HAV0Rw-1; Thu, 09 Jun 2022 04:16:09 -0400
X-MC-Unique: FILri9poM6iKZTn2HAV0Rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4F7580B90D;
	Thu,  9 Jun 2022 08:16:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BACF218EA3;
	Thu,  9 Jun 2022 08:16:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 849FA194705B;
	Thu,  9 Jun 2022 08:16:08 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9BF1B1947040 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  9 Jun 2022 08:16:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 88158456CD5; Thu,  9 Jun 2022 08:16:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95887492C3B;
 Thu,  9 Jun 2022 08:16:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <165476202136.3999992.433442175457370240.stgit@warthog.procyon.org.uk>
References: <165476202136.3999992.433442175457370240.stgit@warthog.procyon.org.uk>
To: jlayton@kernel.org
MIME-Version: 1.0
Date: Thu, 09 Jun 2022 09:16:03 +0100
Message-ID: <4000417.1654762563@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH] iov_iter: Fix iter_xarray_get_pages{,
 _alloc}()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Gao Xiang <xiang@kernel.org>, linux-erofs@lists.ozlabs.org,
 linux-afs@lists.infradead.org, devel@lists.orangefs.org,
 Mike Marshall <hubcap@omnibond.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <4000416.1654762563.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Here's a program that can be used to exercise the iter_xarray_get_pages()
function in userspace.  In the main() function, there are various parameters
that can be adjusted, such as the starting offset (iter.xarray_start), the
size of the content (iter.count), the maximum number of pages to be extracted
(maxpages) and the maximum size to be extracted (maxsize).

David
---
/* SPDX-License-Identifier: GPL-2.0 */
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef unsigned long pgoff_t;
#define PAGE_SHIFT 12
#define PAGE_SIZE ((unsigned long)1 << PAGE_SHIFT)
#define PAGE_MASK (~(PAGE_SIZE - 1))

struct page;
struct xarray;

struct iov_iter {
	size_t iov_offset;
	size_t count;
	loff_t xarray_start;
};
#define __is_constexpr(x) \
	(sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
#define __typecheck(x, y) \
	(!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))

#define __no_side_effects(x, y) \
		(__is_constexpr(x) && __is_constexpr(y))

#define __safe_cmp(x, y) \
		(__typecheck(x, y) && __no_side_effects(x, y))

#define __cmp(x, y, op)	((x) op (y) ? (x) : (y))

#define __cmp_once(x, y, unique_x, unique_y, op) ({	\
		typeof(x) unique_x = (x);		\
		typeof(y) unique_y = (y);		\
		__cmp(unique_x, unique_y, op); })

#define __careful_cmp(x, y, op) \
	__builtin_choose_expr(__safe_cmp(x, y), \
		__cmp(x, y, op), \
		__cmp_once(x, y, __x, __y, op))
#define min(x, y)	__careful_cmp(x, y, <)
#define min_t(type, x, y)	__careful_cmp((type)(x), (type)(y), <)

static int apply_fix;

static ssize_t iter_xarray_populate_pages(pgoff_t index, unsigned int nr_pages)
{
	return nr_pages;
}

static ssize_t iter_xarray_get_pages(struct iov_iter *i, size_t maxsize,
				     unsigned maxpages, size_t *_start_offset)
{
	unsigned nr, offset;
	pgoff_t index, count;
	size_t size = maxsize, head_size, tail_size;
	loff_t pos;

	if (!size || !maxpages)
		return 0;

	pos = i->xarray_start + i->iov_offset;
	index = pos >> PAGE_SHIFT;
	offset = pos & ~PAGE_MASK;
	*_start_offset = offset;

	count = 1;
	tail_size = head_size = PAGE_SIZE - offset;
	if (maxsize > head_size) {
		size -= head_size;
		count += size >> PAGE_SHIFT;
		tail_size = size & ~PAGE_MASK;
		if (tail_size)
			count++;
	}

	if (count > maxpages)
		count = maxpages;

	printf(" %6lx %6lu %6zx |", index, count, tail_size);

	nr = iter_xarray_populate_pages(index, count);
	if (nr == 0)
		return 0;

	if (!apply_fix) {
		size_t actual = PAGE_SIZE * nr;
		actual -= offset;
		if (nr == count && size > 0) {
			unsigned last_offset = (nr > 1) ? 0 : offset;
			actual -= PAGE_SIZE - (last_offset + size);
		}
		return actual;
	} else {
		return min(nr * PAGE_SIZE - offset, maxsize);
	}
}

ssize_t iov_iter_get_pages(struct iov_iter *i,
			   size_t maxsize, unsigned maxpages, size_t *start)
{
	if (maxsize > i->count)
		maxsize = i->count;
	if (!maxsize)
		return 0;
	return iter_xarray_get_pages(i, maxsize, maxpages, start);
}

int main()
{
	struct iov_iter iter;
	ssize_t size;
	size_t i, maxpages, maxsize, offset;

	memset(&iter, 0, sizeof(iter));

	/* Adjustable parameters */
	iter.xarray_start	= 0x11000;
	iter.count		= PAGE_SIZE * 16;
	maxpages		= 15;
	maxsize			= maxpages * PAGE_SIZE;

	printf("X-STRT X-OFFS X-CNT  | INDEX  COUNT  T-SIZE | OFFSET SIZE\n");
	printf("====== ====== ====== | ====== ====== ====== | ====== ======\n");

	for (apply_fix = 0; apply_fix < 2; apply_fix++) {
		i = 0;
		for (;;) {
			iter.iov_offset = i;
			printf("%6lx %6zx %6zx |",
			       iter.xarray_start, iter.iov_offset, iter.count);
			size = iov_iter_get_pages(&iter, maxsize, maxpages,
						  &offset);

			printf(" %6zx %6zx", offset, size);
			if (offset + size > maxsize)
				printf(" ** BIG");
			if (offset + size > iter.iov_offset + iter.count)
				printf(" ** OVER");
			printf("\n");
			if (i > PAGE_SIZE)
				break;
			i += 0x111;
		}

	}
	return 0;
}
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


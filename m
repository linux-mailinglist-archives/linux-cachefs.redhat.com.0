Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B325935976A
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 10:14:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617956084;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HnbvxvecKMmIL0FSWXZcJNfox01F7emoUPU4MgqgwrQ=;
	b=Pf0WjGqosQj2XJFNcx200fYmFm2tDpL6l5TKVWvUHugBgpoQosj3ua/5e69ORMLR5yMQoc
	msDBsuhtKqog/UaeEVw5znd0nWjKryOwfMLbtdbb+rcxAmz1QCNEPoVkb+D1Qz8XurpQu9
	qVS0UJSAGbYXCLL0J/c1t7Br0k3jkPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-E_iiWBDaPky7VHpYvfdMWg-1; Fri, 09 Apr 2021 04:14:42 -0400
X-MC-Unique: E_iiWBDaPky7VHpYvfdMWg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91E2291105;
	Fri,  9 Apr 2021 08:14:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 763A119C95;
	Fri,  9 Apr 2021 08:14:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B56EC44A5B;
	Fri,  9 Apr 2021 08:14:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1398EVhS010891 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 04:14:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B845D60C05; Fri,  9 Apr 2021 08:14:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C66C160BE5;
	Fri,  9 Apr 2021 08:14:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wi_XrtTanTwoKs0jwnjhSvwpMYVDJ477VtjvvTXRjm5wQ@mail.gmail.com>
References: <CAHk-=wi_XrtTanTwoKs0jwnjhSvwpMYVDJ477VtjvvTXRjm5wQ@mail.gmail.com>
	<20210408145057.GN2531743@casper.infradead.org>
	<161789062190.6155.12711584466338493050.stgit@warthog.procyon.org.uk>
	<161789066013.6155.9816857201817288382.stgit@warthog.procyon.org.uk>
	<46017.1617897451@warthog.procyon.org.uk>
	<136646.1617916529@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Fri, 09 Apr 2021 09:14:24 +0100
Message-ID: <184803.1617956064@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1398EVhS010891
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS,
	SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Linux-MM <linux-mm@kvack.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [RFC][PATCH] mm: Split page_has_private() in
	two to better handle PG_private_2
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <184802.1617956064.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> >  #define PAGE_FLAGS_PRIVATE                             \
> >         (1UL << PG_private | 1UL << PG_private_2)
>
> I think this should be re-named to be PAGE_FLAGS_CLEANUP, because I
> don't think it makes any other sense to "combine" the two PG_private*
> bits any more. No?

Sure.  Do we even want it still, or should I just fold it into
page_needs_cleanup()?  It seems to be the only place it's used.

> > +static inline int page_private_count(struct page *page)
> > +{
> > +       return test_bit(PG_private, &page->flags) ? 1 : 0;
> > +}
>
> Why is this open-coding the bit test, rather than just doing
>
>         return PagePrivate(page) ? 1 : 0;
>
> instead? In fact, since test_bit() _should_ return a 'bool', I think even just
>
>         return PagePrivate(page);

Sorry, yes, it should be that.  I was looking at transforming the "1 <<
PG_private" and completely overlooked that this should be PagePrivate().

> should work and give the same result, but I could imagine that some
> architecture version of "test_bit()" might return some other non-zero
> value (although honestly, I think that should be fixed if so).

Yeah.  I seem to recall that test_bit() on some arches used to return the
datum just with the other bits masked off, but I may be misremembering.

In asm-generic/bitops/non-atomic.h:

static inline int test_bit(int nr, const volatile unsigned long *addr)
{
	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
}

should perhaps return bool?

I wonder, should:

	static __always_inline int PageTail(struct page *page)
	static __always_inline int PageCompound(struct page *page)
	static __always_inline int Page##uname(struct page *page)
	static __always_inline int TestSetPage##uname(struct page *page)
	static __always_inline int TestClearPage##uname(struct page *page)

also all return bool?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

